# An Object of this class will represent Min Hash Signature algorithm
# The basic structure here is Hash Map of Hash Maps which will hold sets signatures 

class MinHashSignature
  
  # @param sets_manager : Instance of our sets manager containing all sets info
  # @param functions_manager : Instance of our functions manager containing all hash functions info
  def initialize(sets_manager, functions_manager)
  	@sets_manager = sets_manager
  	@functions_manager = functions_manager
  	@signatures = Hash.new

    # Initialize min signatures for all sets to Infinity
  	sets_manager.sets_ids.each do|id|
  		@signatures[id] = Hash.new
  		(1..functions_manager.functions_count).each do|function_number|
  			@signatures[id][function_number] = Float::INFINITY
  		end
  	end

  end

  # Apply Min Signature Algoritm , by looping through all sets members 
  # and applying hash functions for each member with corresponding sets that containes it
  def compute_signatures

  	member_number = 0
  	@sets_manager.all_members.each do |member|
  	  
  	  @sets_manager.sets_ids.each do|id|

  	  	next if !@sets_manager.set_includes?(id,member)

  	    (1..@functions_manager.functions_count).each do|function_number|

  	      new_signature = @functions_manager.get_function(function_number).hash(member_number)
  		  @signatures[id][function_number] = new_signature if new_signature < @signatures[id][function_number]

  		 end
  	  end
  	  member_number +=1
  	end
  end

  # Compute similarity between two sets based on thier Min Hash signature
  def compute_similarity(first_set_id, second_set_id)
  	#Get The mutual elemnt of the sets signature
  	mutual = @signatures[first_set_id].select{|function_number,value| 
  		value == @signatures[second_set_id][function_number] 
  	}
  	mutual.count.to_f / @functions_manager.functions_count.to_f
  end

  # Get sorted array of similatries to other sets
  # @param set_id : the set to compute its similarity to other sets
  # @retun : Array of paires ( [set_id,similarity value] ) sorted by descending order
  def get_similar_sets(set_id)
   similarities = {}
   @sets_manager.sets_ids.each{|id|
     similarities[id] = compute_similarity(set_id,id) unless id == set_id
   }
   similarities.sort_by {|_key, value| value}.reverse
  end

end