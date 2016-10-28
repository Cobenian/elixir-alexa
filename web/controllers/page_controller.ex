defmodule Alexa.PageController do
  use Alexa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def make_response(message, end_session \\ true) do
    %{
          "version" => "1.0",
          "response" => %{
            "outputSpeech" => %{
              "type" => "PlainText",
              "text" => message,
            },
            "shouldEndSession" => end_session
        }
    }
  end

  def process_request(conn, %{"request" => %{"intent" => %{"name" => "Baseball"}}}) do
    Enum.random([
        "My kids love playing baseball.",
        "Do you think the Cubs can win the World Series?",
        "108 years is a long time!",
        "Are you a Nationals fan?",
      ])
    |> make_response
  end

  def process_request(conn, %{"request" => %{"intent" => %{"name" => "Elixir"}}}) do
    Enum.random([
        "Elixir is an amazing programming language.",
        "Don't you just love pattern matching?",
        "Binaries are amazing!",
        "Macros really help remove boilerplate from your code.",
        "The tooling in Elixir is fantastic.",
        "Elixir: built on the shoulders of giants",
      ])
    |> make_response
  end

  def process_request(conn, _params) do
    "I did not understand what you said.  Clearly you made a mistake not me." |> make_response
  end

  def alexa(conn, params) do
    IO.puts "called with:"
    IO.inspect params

    response = process_request(conn, params) |> IO.inspect

    json conn, response
  end
end
