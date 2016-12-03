defmodule SchizoTest do
  use ExUnit.Case
  doctest Schizo

  test "does not uppercase the first word" do
    assert Schizo.uppercase("foo") == "foo"
  end
  
  test "uppercases the second word" do
    assert Schizo.uppercase("foo bar") == "foo BAR"
  end
  
  test "uppercases every other word" do
    assert Schizo.uppercase("foo bar baz wat") == "foo BAR baz WAT"
  end
  
  test "unvowel does not remove vowels from the first word" do
    assert Schizo.unvowel("foo") == "foo"
  end
  
  test "unvowel removes vowels from the second word" do
    assert Schizo.unvowel("foo bar") == "foo br"
  end
  
  test "unvowel removes vowels from every other word" do
    assert Schizo.unvowel("foo bar baz") == "foo br baz"
  end
end
