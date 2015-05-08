require_relative 'spec_helper'

RSpec.shared_context "build data" do
   before (:each) do
    @sets_manager = SetsManager.new
    @sets_manager.add(1,Set.new([0,3]))
    @sets_manager.add(2,Set.new([2]))
    @sets_manager.add(3,Set.new([1,3,4]))
    @sets_manager.add(4,Set.new([0,3]))

    @functions = HashFunctionsManager.new
    @functions.add_function(HashFunction.new 5 , 1 , 1)
    @functions.add_function(HashFunction.new 5 , 3 , 1)

    @min_hash = MinHashSignature.new @sets_manager , @functions
  end
end