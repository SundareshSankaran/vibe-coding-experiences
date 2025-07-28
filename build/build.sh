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