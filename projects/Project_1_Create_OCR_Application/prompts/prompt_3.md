# Prompt

Improve the first 2 lines of this script by changing the shebang to a command that finds bash from /usr/env instead of /bin/bash, and also improve the set -e further to ensure that the script gracefully exits upon encountering an error. Finally, save your response in /Users/ss/vibe-coding-experiences/projects/Project_1_Create_OCR_Application/prompts as prompt_3.md using the same style as /Users/ss/vibe-coding-experiences/projects/Project_1_Create_OCR_Application/prompts/prompt_1.md and /Users/ss/vibe-coding-experiences/projects/Project_1_Create_OCR_Application/prompts/prompt_2.md

# GitHub Copilot

Here is the improved shell script. The shebang now uses `/usr/bin/env bash` to find bash in the user's environment, and error handling is enhanced by using `trap` to print an error message and exit gracefully if any command fails.

```bash
#!/usr/bin/env bash
set -e
trap 'echo "Error occurred at line $LINENO. Exiting."; exit 1' ERR

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