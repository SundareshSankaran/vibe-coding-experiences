# Prompt

Write me a shell script which creates a Python virtual env, activates that virtual env and then installs packages from a requirements.txt file using uv, which is installed as a first step. Following this, add in a command to run a Python program on the lines of the answer provided to my previous question.


# GitHub Copilot

GitHub Copilot

Used 1 reference: build.sh:1 build


```
#!/bin/bash
set -e

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
```
