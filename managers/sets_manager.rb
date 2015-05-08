# An Object of this class will represent a Manager for our Sets
# This manager is responsible for adding , deleteing , storing and retreiving sets info
# The manager will store sets as (key,value) pairs , where key is the set id and value is the set it self

require 'set'

class SetsManager
  
  def initialize
  	@sets = Hash.new
  end

  # @param set_id : represent unique identifier for the set
  # @param set : the actual set to store
  def add(set_id, set = Set.new)
  	@sets[set_id] = set
  end

  # @param data : Hash map of key : set_id , value : set
  def add_bulk(data)
    data.each{|key,value| add(key,value) }
  end

  def remove(set_id)
  	@sets.delete(set_id)
  end

  # Get all sets members in our manager
  # @return : Set containing all members
  def all_members
  	members = Set.new
  	@sets.each{ |id,set| members = members + set }
  	members
  end

  # Check for member exsitence in a set
  # @param set_id : the set to look into
  # @param member : the member to look for
  # @return boolean indicating the existence of the member in the set
  def set_includes?(set_id, member)
  	@sets[set_id].include? member
  end

  # Get list of all sets ids in the manager
  # @return array
  def sets_ids
    @sets.map{|id,set| id }
  end

  # Get the difference between 2 sets
  # @param first_set : the id of first set
  # @param first_set : the id of second set
  # @return Set representing the difference between the two sets
  def sets_difference(first_set,second_set)
    @sets[second_set] - @sets[first_set]
  end

  # Return the number of sets in this manager
  # @return integer
  def sets_count
    @sets.count
  end

  # Check if our manager contaies the reuqested set
  # @param set_id 
  # @return True or False
  def contains?(set_id)
    @sets.has_key? set_id
  end

end