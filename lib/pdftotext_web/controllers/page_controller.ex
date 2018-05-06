defmodule PdftotextWeb.PageController do
  use PdftotextWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", result: ""
  end

  def handlesubmit(conn, params) do
    # IO.inspect params["pdf"]
    # result = PdfToText.convert(1, "20a32109a488957")
    result = case PdfToText.convert(params["pdf"], "120a32109a488957") do
      {:ok, res} ->  res
      {:error, msg, res} ->  res
      _-> ""
    end
    render conn, "index.html", result: result
  end
end
