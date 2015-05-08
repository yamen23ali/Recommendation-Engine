require_relative '../spec_helper'

describe HashFunction do
  
  it "Gives a correct Hash value" do
  	hash_function = HashFunction.new 5 , 2 , 6
  	x = hash_function.hash(7)
    expect(x).to eq(0)
  end

  it "Runs with default values when no coefficient or constant are provided" do
  	hash_function = HashFunction.new 5 
  	x = hash_function.hash(7)
    expect(x).to eq(2)
  end

end