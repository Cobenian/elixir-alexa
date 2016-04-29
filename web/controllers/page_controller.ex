defmodule Alexa.PageController do
  use Alexa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def alexa(conn, params) do
    IO.puts "called with:"
    IO.inspect params

    response = 

    %{
	  "version" => "1.0",
	  "response" => %{
	    "outputSpeech" => %{
	      "type" => "PlainText",
	      "text" => "Elixir is awesome",
	    },
	    "shouldEndSession" => true 
	  }
    }
    |> IO.inspect

    json conn, response 
  end
end
