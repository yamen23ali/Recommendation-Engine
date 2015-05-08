require_relative '../shared_context'

describe MinHashSignature do

 include_context "build data"
  
  # Can't really expect a spicific output due to random nature of the algorithm
  # however due to our input we can expect to have [4,1.0] since S1 & S4 are identical
  it "Computes Similarity successfuly" do
    @min_hash.compute_signatures
    expect(@min_hash.compute_similarity(1,4)).to eq 1.0
  end

  # Same as above
  it "Finds Similar sets" do
    expect(@min_hash.get_similar_sets(1)).to include([4, 1.0])
  end

end