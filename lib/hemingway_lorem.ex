defmodule HemingwayLorem do
  @moduledoc """
  HemingwayLorem is a random text generator like lorem-ipsum, except the text
  is from public domain works of Hemingway.

  Get a random sentence(s)

  ## Examples

      iex> HemingwayLorem.sentence()
      "Gee it’s awful when they go by you and then you have to watch them go
      farther away and get smaller and smaller and then all bunched up on the
      turns and then come around towards into the stretch and you feel like
      swearing and goddaming worse and worse"

      iex> HemingwayLorem.sentences(2)
      ["It was a big two hundred thousand franc race with seven entries and Kzar
      a big favourite",
      "He’d start the rope whirring till they’d stop dead still and watch him,
      then give the steers a cluck and a poke with the goad and get going again"]
  """

  # I wonder if there is a way to read the file only once and keep the list
  # in the memory
  #
  #  @on_load :load_sentences

  #   defp load_sentences do
  #     @text = File.read!("data/my_old_man.txt") |> String.split("\n", trim: true)
  #   end

  @doc """

  Use `sentence` to get just one random sentence.

  """
  def sentence(), do: hd(sentences())

  @doc """

  Get multiple random sentences.
  If called without an argument, a single sentence it returned.

  It is *not* same as `sentence` since output is
  returned as a list (containing a single random sentence)

  ## Example

      iex(1)> HemingwayLorem.sentences()
      ["Especially at San Siro with that big green infield and the mountains way off and the fat wop starter with his big whip and the jocks fiddling them around and then the barrier snapping up and that bell going off and them all getting off in a bunch and then commencing to string out"]

  """
  def sentences(count \\ 1) do
    # The story has long sentences, spanning across multiple lines in the file
    # Hence consider "." as an end of a sentence.
    # Replace "\n"s with a space.

    lines =
      File.read!("priv/my_old_man.txt")
      |> String.split(".", trim: true)

    for line <- Enum.take_random(lines, count) do
      String.replace(line, "\n", " ")
      |> String.trim()
    end

    # Even if count is more than number of lines, take_random takes care of it.
  end
end
