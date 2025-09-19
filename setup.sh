#!/bin/bash
# Robust LaTeX setup for VSCode with WSL, minimal assumptions

set -e

echo "[0/4] Updating package lists with apt and apt-get..."
sudo apt update
sudo apt-get update

echo "[1/4] Checking for required LaTeX packages in WSL..."

REQUIRED_PKGS=(
    texlive-latex-extra
    texlive-science
    texlive-pictures
    texlive-extra-utils
    latexmk
    biber
    texlive-fonts-extra
    texlive-lang-german
    texlive-bibtex-extra
)

MISSING_PKGS=()
for pkg in "${REQUIRED_PKGS[@]}"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -eq 0 ]; then
    echo "All required LaTeX packages are already installed in WSL."
else
    echo "Installing missing LaTeX packages in WSL: ${MISSING_PKGS[*]}"
    sudo apt-get update
    sudo apt-get install -y "${MISSING_PKGS[@]}"
fi

echo "[2/4] Checking for Python3 and installing if not found..."
if ! command -v python3 >/dev/null 2>&1; then
  echo "Python3 not found. Installing Python3..."
  sudo apt-get install -y python3
fi

echo "[3/4] Configuring VSCode user settings for LaTeX Workshop..."

# Detect if running in WSL and set Windows VSCode settings path if so
if grep -qiE 'microsoft|wsl' /proc/version 2>/dev/null; then
	WIN_USER=$(cmd.exe /C "echo %USERNAME%" 2>/dev/null | tr -d '\r')
	if [ -z "$WIN_USER" ]; then
		echo "Error: Could not detect Windows username. Skipping Windows VSCode settings update."
		SETTINGS_PATH=""
	else
		WIN_PROFILE_ID="73e5d62c"  # You can make this dynamic if needed
		WIN_PROFILE_SETTINGS="/mnt/c/Users/$WIN_USER/AppData/Roaming/Code/User/profiles/$WIN_PROFILE_ID/settings.json"
		WIN_DEFAULT_SETTINGS="/mnt/c/Users/$WIN_USER/AppData/Roaming/Code/User/settings.json"
		if [ -f "$WIN_PROFILE_SETTINGS" ]; then
			SETTINGS_PATH="$WIN_PROFILE_SETTINGS"
			echo "Updating Windows VSCode profile settings at: $SETTINGS_PATH"
		else
			SETTINGS_PATH="$WIN_DEFAULT_SETTINGS"
			echo "Updating Windows default VSCode settings at: $SETTINGS_PATH"
		fi
		if [ ! -f "$SETTINGS_PATH" ]; then
			echo "Creating settings.json at $SETTINGS_PATH"
			mkdir -p "$(dirname "$SETTINGS_PATH")" 2>/dev/null || {
				echo "Error: Permission denied when creating directory $(dirname "$SETTINGS_PATH"). Skipping Windows VSCode settings update.";
				SETTINGS_PATH="";
			}
			if [ -n "$SETTINGS_PATH" ] && [ ! -f "$SETTINGS_PATH" ]; then
				echo '{}' > "$SETTINGS_PATH" 2>/dev/null || {
					echo "Error: Permission denied when creating $SETTINGS_PATH. Skipping Windows VSCode settings update.";
					SETTINGS_PATH="";
				}
			fi
		fi
	fi
else
	# Linux/WSL2 native VSCode
	PROFILE_DIR="$HOME/.config/Code/User/profiles"
	if [ -d "$PROFILE_DIR" ] && [ -n "$(ls -A $PROFILE_DIR 2>/dev/null)" ]; then
		PROFILE_ID=$(ls -1dt "$PROFILE_DIR"/*/ 2>/dev/null | head -n1 | xargs -n1 basename)
		SETTINGS_PATH="$PROFILE_DIR/$PROFILE_ID/settings.json"
		echo "Updating VSCode profile settings at: $SETTINGS_PATH"
	else
		SETTINGS_PATH="$HOME/.config/Code/User/settings.json"
		echo "Updating default VSCode settings at: $SETTINGS_PATH"
	fi
	if [ ! -f "$SETTINGS_PATH" ]; then
		echo "Creating settings.json at $SETTINGS_PATH"
		mkdir -p "$(dirname "$SETTINGS_PATH")"
		echo '{}' > "$SETTINGS_PATH"
	fi
fi

python3 - <<EOF
import json, os
settings_path = os.path.expanduser("$SETTINGS_PATH")
with open(settings_path, 'r', encoding='utf-8') as f:
	try:
		settings = json.load(f)
	except Exception:
		settings = {}
settings.update({
	"latex-workshop.latex.tools": [
		{
			"name": "latexmk",
			"command": "latexmk",
			"args": [
				"-synctex=1",
				"-interaction=nonstopmode",
				"-file-line-error",
				"-pdf",
				"-outdir=%OUTDIR%",
				"%DOC%"
			],
			"env": {}
		},
		{
			"name": "pdflatex",
			"command": "pdflatex",
			"args": [
				"-synctex=1",
				"-interaction=nonstopmode",
				"-file-line-error",
				"%DOC%"
			],
			"env": {}
		},
		{
			"name": "bibtex",
			"command": "bibtex",
			"args": ["%DOCFILE%"],
			"env": {}
		},
		{
			"name": "biber",
			"command": "biber",
			"args": ["%DOCFILE%"],
			"env": {}
		}
	],
	"latex-workshop.latex.recipes": [
		{
			"name": "latexmk",
			"tools": ["latexmk"]
		},
		{
			"name": "pdflatex -> biber -> pdflatex * 2",
			"tools": ["pdflatex", "biber", "pdflatex", "pdflatex"]
		},
		{
			"name": "pdflatex -> bibtex -> pdflatex * 2",
			"tools": ["pdflatex", "bibtex", "pdflatex", "pdflatex"]
		}
	],
	"latex-workshop.latex.recipe.default": "first",
	"latex-workshop.latex.outDir": "%DIR%/_output",
	"workbench.commandPalette.experimental.suggestCommands": True,
	"workbench.commandPalette.preserveInput": True
})
with open(settings_path, 'w', encoding='utf-8') as f:
	json.dump(settings, f, indent=4, ensure_ascii=False)
EOF

echo "[4/4] Setup complete!"
echo ""
echo ""
if [ "$EXT_OK" = "0" ]; then
	echo "Something went wrong :("
else
	echo "You can now use LaTeX in VSCode with WSL."
fi
echo ""
echo ""
