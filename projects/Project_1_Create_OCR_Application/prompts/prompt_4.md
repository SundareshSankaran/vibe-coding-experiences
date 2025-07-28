# Prompt

Improve build.sh by adding a deactivate at the end to exit any virtual environment, and also include error handling blocks to provide an error in case any files referenced in the shell script do not exist. Finally, save this prompt and the response as prompt_4.md in /Users/ss/vibe-coding-experiences/projects/Project_1_Create_OCR_Application/prompts, using the same style as prompt_3.md

# GitHub Copilot

Here is the improved shell script. It adds a `deactivate` command at the end to exit the virtual environment, and checks for the existence of referenced files (`requirements.txt`, `pdf_to_text.py`, and `input.pdf`) before proceeding. If any file is missing, it prints an error and exits gracefully.

```bash
#!/usr/bin/env bash
set -e
trap 'echo "Error occurred at line $LINENO. Exiting."; exit 1' ERR

# Check for required files
if [ ! -f requirements.txt ]; then
  echo "Error: requirements.txt not found."
  exit 1
fi

if [ ! -f pdf_to_text.py ]; then
  echo "Error: pdf_to_text.py not found."
  exit 1
fi

if [ ! -f input.pdf ]; then
  echo "Error: input.pdf not found."
  exit 1
fi

# Create Python virtual environment
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Install uv (fast Python package installer)
pip install uv

# Install dependencies from requirements.txt using uv
uv pip install -r requirements.txt

# Run the PDF to text conversion script
python pdf_to_text.py input.pdf output.txt

# Deactivate the virtual

# Deactivate the virtual environment
deactivate
```