require_relative '../spec_helper'

describe HashFunctionsManager do

  before (:each) do
    @functions = HashFunctionsManager.new  
  end

  it "Generate functions successfuly" do
    @functions.generate_functions(3,5)
    expect(@functions.functions_count).to eq 3
  end

  it "Adds function successfuly" do
    hash_function = HashFunction.new 4 ,4 ,1 
    @functions.add_function hash_function
    expect(@functions.functions_count).to eq 1
  end

  it "Returns a Hash function from spicific index" do
    @functions.generate_functions(3,5)
    expect(@functions.get_function(0)).to be_a HashFunction
  end

  it "Returns functions count" do
    @functions.generate_functions(5,5)
    expect(@functions.functions_count).to eq 5
  end

end