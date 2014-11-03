require_relative "anagram"

describe Anagram do
	
	let(:single_word) {["iceman"]}
	let(:word_list) {["iceman", "bat"]}

	it "should find all possible anagrams of a single word." do
		anagram = Anagram.new(single_word)
		expect(anagram).to eq(["iceman", "anemic", "cinema"])
	end

	it "should find all possible anagrams of multiple words." do
		anagram = Anagram.new(word_list)
		expect(anagram).to eq([["iceman", "anemic", "cinema"],["bat", "tab"]])
	end

end