# An Object of this class will represent a Hash Function
# The hash function is of the form ( (a*x + b ) % c ) where :
# a , b : randomly generated numbers
# x : the number that we want to compute its hash
# c : the upper limit that hash function should not return ( i.e. the number of elements )

class HashFunction

  # @param denominator : Integer represents Hash function upper limit
  # @param coefficient : Integer 
  # @param constant : Integer
  def initialize(denominator, coefficient = 1, constant = 0)
  	@coefficient = coefficient
  	@constant = constant
  	@denominator = denominator
  end

  # @param x : Integer , the number to calculate its hash
  # @return Integer , the hashing result
  def hash(x)
  	(@coefficient*x + @constant) % @denominator
  end

end