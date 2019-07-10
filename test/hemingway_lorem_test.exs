defmodule HemingwayLoremTest do
  use ExUnit.Case
  #   doctest HemingwayLorem

  alias HemingwayLorem, as: HL

  test "sentence returns one long string" do
    sentence = HL.sentence()

    assert is_binary(sentence)
    assert String.length(sentence) > 1
  end

  test "sentences/1: returns x sentences" do
    count = :random.uniform(10)
    sentences = HL.sentences(count)

    assert Enum.count(sentences) == count
    for sentence <- sentences, do: assert(String.match?(sentence, ~r/\n/) == false)
  end
end
