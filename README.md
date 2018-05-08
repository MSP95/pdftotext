
# Pdftotext
A simple Elixir package to convert .pdf file to .txt using OCR API

**Module Page:** [hex.pm/packages/pdftotext](https://hex.pm/packages/pdftotext)

> convert(file, key)
This is the main PDF to Text Module.

Converts the given pdf file into text.

**Parameters:**
1. File -> Accepts a Plug.Upload{} struct or a binary of the file.
2. Key -> Accepts a key for the OCR API. Get your key here: [OCR API KEY](https://ocr.space/ocrapi)

**Returns:**
> {:ok, result} -> On a successful parse returns this where 'result' is a string containing the contents of the passed file.

> {:error, error_message, result} -> returns a :error struct with the error_message and the partial result if any.
