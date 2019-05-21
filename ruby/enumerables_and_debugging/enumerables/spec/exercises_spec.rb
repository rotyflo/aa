require "rspec"
require "exercises"

describe "#factors" do
  it "returns factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end
end

describe "#subwords" do
  it "can find a simple word" do
    words = subwords("asdfcatqwer", ["cat", "car"])
    expect(words).to eq(["cat"])
  end

  it "doesn't find spurious words" do
    words = subwords("batcabtarbrat", ["cat", "car"])
    expect(words).to be_empty
  end

  it "can find words within words" do
  #note that the method should NOT return duplicate words
    dictionary = ["bears", "ear", "a", "army"]
    words = subwords("erbearsweatmyajs", dictionary)

    expect(words).to eq(["bears", "ear", "a"])
  end
end
