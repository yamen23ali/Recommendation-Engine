require_relative '../spec_helper'

describe SetsManager do

  before (:each) do
    @set1 = Set.new [1,2]
    @set2 = Set.new [1,2,3]
    @set3 = Set.new [5,8]
    @sets_manager = SetsManager.new  
  end

  it "Adds a set successfuly" do
    @sets_manager.add(1,@set1)
    expect(@sets_manager.sets_count).to eq 1
  end

  it "Adds a bulk of sets successfuly" do
    bulk = {}
    bulk[1] = @set1
    bulk[2] = @set2
    @sets_manager.add_bulk(bulk)
    expect(@sets_manager.sets_count).to eq 2
  end

  it "Removes a set successfuly" do
    @sets_manager.add(1,@set1)
    expect(@sets_manager.sets_count).to eq 1
    @sets_manager.remove(1)
    expect(@sets_manager.sets_count).to eq 0
  end

  it "Returns a Set of All members in Manager" do
    @sets_manager.add(1,@set1)
    @sets_manager.add(2,@set2)
    @sets_manager.add(3,@set3)
    res = Set.new [1,2,3,5,8]
    diff = @sets_manager.all_members - res
    expect(diff.count).to eq 0
  end

  it "Checks for element existence in a set" do
    @sets_manager.add(1,@set1)
    expect(@sets_manager.set_includes?(1,2)).to eq true
  end

  it "Returns a list of all sets ids" do
    @sets_manager.add(1,@set1)
    @sets_manager.add(2,@set2)
    expect(@sets_manager.sets_ids).to eq [1,2]
  end

  it "Returns the difference of two sets based on their ID" do
    @sets_manager.add(1,@set1)
    @sets_manager.add(2,@set2)
    expect( @sets_manager.sets_difference(1,2).count ).to eq 1
  end

  it "Returns the number of sets in the manager" do
    @sets_manager.add(1,@set1)
    expect(@sets_manager.sets_count).to eq 1
  end

  it "Checks for sets existence" do
    @sets_manager.add(1,@set1)
    expect(@sets_manager.contains? 1).to eq true
    expect(@sets_manager.contains? 2).to eq false
  end

end