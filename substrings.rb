class Substrings

  def self.count words, dictionary
    raise ArgumentError unless words.is_a?(String) && dictionary.is_a?(Array) && dictionary.size > 0
    dictionary.each_with_object({}) do |dic_word, words_count|
      count = words.scan(/#{dic_word}/i).size
      words_count[dic_word] =  count if count > 0
    end
  end
end