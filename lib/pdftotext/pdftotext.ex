defmodule PdfToText do
  #
  def convert(file= %Plug.Upload{}, key) do
    # "file is a plug.Upload struct"

    # copying the file to a temporary directory
    File.mkdir("temp")
    tmp_path = "temp/#{file.filename}.pdf"
    File.cp(file.path, tmp_path)
    PdfToText.upload(file, key, tmp_path)
  end

  def convert(file, key) do
    if is_binary(file) do
      # "file is a binary"
      File.mkdir("temp")
      tmp_path = "temp/unknown.pdf"
      File.write(tmp_path, file, [:binary])
      PdfToText.upload(file, key, tmp_path)
    else
      # "file is unknown"
      errorMessage =  "File is invalid."
      {:error, errorMessage, ""}
    end
  end

  def upload(file, key, tmp_path) do
    # preparing data for post request.
    url = "https://api.ocr.space/parse/image"
    body = {:multipart, [{"filetype", "pdf"}, {:file, tmp_path}]}
    headers = [{"apikey", key}]

    #post request
    response = HTTPoison.post!(url,body,headers,[])

    #removing temporary folder
    File.rm_rf("temp")

    #decoding text from the post response.
    response = Poison.decode!(response.body)
    result = Enum.reduce(response["ParsedResults"], "", fn(r, acc) -> acc<>" "<>r["ParsedText"] end)

    if response["IsErroredOnProcessing"] do
      errorMessage =  List.first(response["ErrorMessage"])
      {:error, errorMessage, result}
    else
      {:ok, result}
    end
  end

end
