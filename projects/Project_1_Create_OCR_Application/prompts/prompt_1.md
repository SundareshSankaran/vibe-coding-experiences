# Prompt
Create a Python program which uses command line arguments to ingest a PDF, apply standard PDF parser libraries or OCR packages and services where necessary, and convert the PDF to a text format.

## GitHub Copilot

Here’s a Python program that uses command line arguments to ingest a PDF, applies PDF parsing (with PyPDF2), and falls back to OCR (with pytesseract and Pillow) if needed. It outputs the extracted text to a .txt file.
Requirements:
```
PyPDF2
pytesseract
Pillow
pdf2image
Tesseract OCR installed (brew install tesseract on Mac)
```

### Install dependencies:
```
pip install PyPDF2 pytesseract Pillow pdf2image
```

### Python script:
```python
import sys
import os
from PyPDF2 import PdfReader
from pdf2image import convert_from_path
from PIL import Image
import pytesseract
def extract_text_from_pdf(pdf_path):
    text = ""
    try:
        reader = PdfReader(pdf_path)
        for page in reader.pages:
            page_text = page.extract_text()
            if page_text:
                text += page_text + "\n"
        if text.strip():
            return text
    except Exception as e:
        print(f"Error reading PDF: {e}")
    return None
def ocr_pdf(pdf_path):
    text = ""
    try:
        images = convert_from_path(pdf_path)
        for i, image in enumerate(images):
            page_text = pytesseract.image_to_string(image)
            text += f"\n--- Page {i+1} ---\n{page_text}"
        return text
    except Exception as e:
        print(f"OCR failed: {e}")
        return None
def main():
    if len(sys.argv) < 2:
        print("Usage: python pdf_to_text.py <input.pdf> [output.txt]")
        sys.exit(1)
    pdf_path = sys.argv[1]
    output_path = sys.argv[2] if len(sys.argv) > 2 else os.path.splitext(pdf_path)[0] + ".txt"
    print(f"Extracting text from {pdf_path}...")
    text = extract_text_from_pdf(pdf_path)
    if not text:
        print("No text found with PDF parser, running OCR...")
        text = ocr_pdf(pdf_path)
        if not text:
            print("Failed to extract text from PDF.")
            sys.exit(2)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"Text written to {output_path}")
if __name__ == "__main__":
    main()
```
### Usage:
```
python pdf_to_text.py input.pdf output.txt
```
If output.txt is omitted, it will use input.txt as the output filename.