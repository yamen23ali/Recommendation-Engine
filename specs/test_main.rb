require 'pry-debugger'
require_relative '../utils/hash_function'
describe Array do
  it "can be created with no arguments" do
    binding.pry
    expect(10).to_eq 10
  end

  it "can be created with a specific size" do
    Array.new(10).size.must_equal 10
  end
end