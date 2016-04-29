defmodule Alexa.PageController do
  use Alexa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def process_request(conn, %{"request" => %{"intent" => %{"name" => "Mastery"}}}) do
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
  end

  def process_request(conn, %{"request" => %{"intent" => %{"name" => "Ivan"}}}) do
    %{
    "version" => "1.0",
    "response" => %{
      "outputSpeech" => %{
        "type" => "PlainText",
        "text" => "Elixir is awesome, but you are more awesome.",
      },
      "shouldEndSession" => true
     }
    }
  end

  def process_request(conn, params) do
    %{
    "version" => "1.0",
    "response" => %{
      "outputSpeech" => %{
        "type" => "PlainText",
        "text" => "Dude, I didn't understand that at all, but I still love Elixir.",
      },
      "shouldEndSession" => true
     }
    }
  end

  def alexa(conn, params) do
    IO.puts "called with:"
    IO.inspect params

    response = process_request(conn, params) |> IO.inspect

    json conn, response
  end
end
