# An object of this class will manage the whole idea of recommendation system
# It will basically just glue all the parts of the system together 

require './managers/sets_manager'
require './managers/hash_functions_manager'
require './engine/min_hash_signature'
require './utils/file_parser'

class RecommendationEngine
  
  # Initialize System components and generate Min Hash Signatures
  # @param set_manager: Sets Manager object
  # @param hash_manager: Hash functions Manager object
  # @param min_hash: Min hash signature object
  def initialize(sets_manager, hash_manager, min_hash)
  	@sets_manager = sets_manager
  	@hash_manager = hash_manager
  	@min_hash = min_hash
  	# build MinHash Signatures
  	@min_hash.compute_signatures
  end

  # Find similar Sets to provided set
  # @param set_id : set to find its similarities to other sets
  # @return An sorted array of sets and their similarities
  def find_similarities(set_id)
  	@min_hash.get_similar_sets set_id
  end

  # Get the recommendations for the current set 
  # ( i.e : a hash map with similarity as key and elemnts to recommend as value)
  # elemnts to recommand are just the elements that doesn't exists in the provided set
  # @param set_id : set to find recommendations for ( i.e. user to find products recommendations for)
  # @return Hash Map of similarities and elemnts to recommend
  def get_recommendations(set_id)
  	similarities = find_similarities(set_id)
  	recommendations = {}
  	similarities.each{|element|
  	  recommendations[element[1]] = Set.new if !recommendations.has_key? element[1]
      recommendations[element[1]] += @sets_manager.sets_difference(set_id,element[0])
  	} 
  	recommendations
  end

end