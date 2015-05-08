require_relative '../shared_context'

describe RecommendationEngine do
  
  include_context "build data"
  
  before(:each) do
  	@engine = RecommendationEngine.new @sets_manager , @functions , @min_hash
  end
  
  # Can't really expect a spicific output due to random nature of the algorithm
  # however due to our input we can expect to have [4,1.0] since S1 & S4 are identical
  it "Finds Similarities between this set and other sets" do
  	res = @engine.find_similarities(1)
    expect(res).to include([4,1.0])
  end

  # The same as above but can't really guess anyting here
  it "Gets Recommindations" do 
  	res = @engine.get_recommendations(1)
  	expect(res).to be_a Hash
  end

end