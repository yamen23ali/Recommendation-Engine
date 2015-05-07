# An Object of this class will represent a Manager for our Hash functions
# This manager is responsible for generating storing and retreiving hash functions
# The manager will store hash functions objects in simple array

require './utils/hash_function'

class HashFunctionsManager

	def initialize
		@hash_functions = []
	end

    # Generate Hash functions
    # @param functions_number : the number of functions to generate
    # @param denominator : the upper limit we want our hash function to return
	def generate_functions(functions_number, denominator)
		functions_number.times {
			@hash_functions <<  (HashFunction.new denominator , rand(100) , rand(1000))
		}
	end

    # @param index : the function index to return
    # @return : Hash function object
	def get_function(index)
		@hash_functions[index-1]
	end

    # @return : integer
	def functions_count
		@hash_functions.count
	end

end