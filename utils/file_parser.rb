# An object from this class will parse an file into corresponding Hash map
# The hash map will hold sets ids as keys and sets as values

class FileParser
  
  def initialize
  	@file_data = Hash.new
  end

  # parse the input file and converts it to sets
  # @param file_path : string represent the full file path
  # @param delimiter : string represent the delimiter separating set id from set elemnt 
  # ( i.e. : separating user id from product id)
  # @return hash map of sets ids and sets
  def parse_to_sets(file_path,delimiter)
  	file = File.open(file_path, "r")
    file.each_line do |line|
      user_id = strip_data(line.split(delimiter).first)
      product_id = strip_data(line.split(delimiter).last)

      @file_data[user_id] = Set.new if !@file_data.has_key? user_id
      @file_data[user_id].add product_id
    end
    file.close
    @file_data
  end

  private

  # Remove spaces from string
  # @param data : string
  # @return stripped string
  def strip_data(data)
  	data.strip! || data
  end

end