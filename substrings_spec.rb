require_relative 'substrings'

describe Substrings do
  describe '#count' do
    let(:input_word) { 'below' }
    let(:input_phrase) { "Howdy partner, sit down! How's it going?" }
    let(:dictionary) { ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] }

    it 'receives a String and a Hash as parameters' do
      expect(Substrings).to receive(:count).with(input_word, dictionary)
      Substrings.count input_word, dictionary
    end

    it 'validates input parameters' do
      expect { Substrings.count dictionary, input_phrase }.to raise_error ArgumentError
      expect { Substrings.count input_word, [] }.to raise_error ArgumentError
      expect { Substrings.count 12345, dictionary}.to raise_error ArgumentError
      expect { Substrings.count input_phrase, {} }.to raise_error ArgumentError
    end

    it 'count how many substrings were found on the given string' do
      expected = {"below"=>1, "low"=>1}
      expect(Substrings.count input_word, dictionary).to eq expected
    end

    it 'can count substrings on a String with multiple words' do
      expected = { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
      expect(Substrings.count input_phrase, dictionary).to eq expected
    end

    it 'is case insensitive' do
      phrase = "Howdy Partner, is the Party here?"
      dictionary = ["howdy", "how", "par", "partner"]

      expected = { "howdy" => 1, "how" => 1, "par" => 2, "partner" => 1 }
      expect(Substrings.count phrase, dictionary).to eq expected
    end

  end
end