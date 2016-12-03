defmodule Schizo do
    require Integer
    
    def uppercase(string) do
        transform_every_other_word(string, &uppercaser/1)
    end
    
    def unvowel(string) do
        transform_every_other_word(string, &unvoweler/1)
    end
    
    # Private methods
    
    defp transform_every_other_word(string, transformation) do
        words = String.split(string)
        words_with_index = Stream.with_index(words)
        transformed_words = Enum.map(words_with_index, transformation)
        Enum.join(transformed_words, " ")
    end
    
    defp unvoweler(input) do
        transformer(input, fn(word) -> Regex.replace(~r([aeiou]), word, "", global: false) end)
    end
    
    defp uppercaser(input) do
        transformer(input, &String.upcase/1)
    end
    
    defp transformer({word, index}, transformation) do
        cond do
         Integer.is_even(index) -> word
         Integer.is_odd(index)  -> transformation.(word)
        end
    end
end
