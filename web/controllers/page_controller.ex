defmodule Alexa.PageController do
  use Alexa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def process_request(conn, %{"request" => %{"intent" => %{"name" => "Empex"}}}) do
    message = "I really hope you enjoy Empex! Thanks to the organizers for a great conference."
    %{
          "version" => "1.0",
          "response" => %{
            "outputSpeech" => %{
              "type" => "PlainText",
              "text" => message,
            },
            "shouldEndSession" => true
        }
    }
  end

  def process_request(conn, params) do
    message = Enum.random([
      "I'm not sure what you said, but I do know that I didn't understand it."
      ])
    %{
          "version" => "1.0",
          "response" => %{
            "outputSpeech" => %{
              "type" => "PlainText",
              "text" => message,
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
