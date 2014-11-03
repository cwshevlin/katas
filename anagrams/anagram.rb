class Anagram

  def initialize(word_list = nil)
    @word_list = word_list || File.open("wordlist.txt").collect(&:chomp)
    anagram_lookup
    print_anagrams(@word_list)
  end

  def print_anagrams(word_list)
    word_list.each do |word|
      find_anagrams(word)
    end
    p @anagram_lookup.max_by{|key, value| value.length}
  end

  def find_anagrams(word)
    print @anagram_lookup[word.downcase.split("").sort].join(", ") + "\n"
  end

  def anagram_lookup
    @anagram_lookup = Hash.new
    @word_list.each do |word|
      if @anagram_lookup[word.downcase.split("").sort].nil?
        @anagram_lookup[word.downcase.split("").sort] = [word]
      else
        @anagram_lookup[word.downcase.split("").sort] << word
      end
    end
    @anagram_lookup
  end

end

anagram_dictionary = File.new("anagram_dictionary.txt", "w")
anagram_dictionary.puts("#{Anagram.new}")
anagram_dictionary.close

