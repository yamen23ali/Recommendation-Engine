require './engine/recommendation_engine'

# This class will control input and output and components intialization

class Main

  def initialize_components(options)
    parser = FileParser.new
  	sets_manager = SetsManager.new
  	hash_manager = HashFunctionsManager.new
    
    # parse data file to sets
    file_data = parser.parse_to_sets options[:file_path] , options[:delimiter]
    # add parsed sets to our set manager
  	sets_manager.add_bulk file_data
  	# generate hash functions
  	hash_manager.generate_functions options[:functions_number] , options[:denominator]
  	
  	min_hash = MinHashSignature.new sets_manager , hash_manager
    
	@engine = RecommendationEngine.new sets_manager , hash_manager , min_hash
  end

  def run
    while (true) do
      puts " ** Welcome To Our Recommendation Engine **"
      puts " What Do You Want To Do ?! "
      puts " 1- Start New Engine "
      puts " 2- Recommand User Products"
      puts " 3- Print User Similarties"
      puts " 4- Exit"
      
      input = gets.chomp
      
      case input
      when "1"
  	    options = {delimiter: ";"}
	
	    puts "Enter File Path :"
	    options[:file_path] = gets.chomp
	
	    puts "Enter Hash Functions Number ( Permutations Number) :"
	    options[:functions_number] = gets.chomp.to_i

	    puts "Our Hash Function are of the form ( A*X + B % C) , Enter C :"
	    options[:denominator] = gets.chomp.to_i

	    raise "Invalid Denominator" if options[:denominator] ==0

	    initialize_components(options)

      when "2"
	    puts "Enter User Id :"
	    result = @engine.get_recommendations(gets.chomp)
	    puts "======================="
	    result.each do|similarty,set|
		  print "Products Ids : "
		  set.each {|elem| print elem + " "}
		  print " | Similarity Ratio : " + similarty.to_s 
		  puts ""
	    end
	    puts "======================="
      when "3"
	    puts "Enter User Id :"
	    result = @engine.find_similarities(gets.chomp)
	    puts "======================="
	    result.each do |elem|
		  print "User Id : " + elem[0]
		  print " | Similarity Ratio : " + elem[1].to_s
		  puts ""
	    end
	    puts "======================="
      else
  	    break
      end
    end
  end

end
 
begin
  program = Main.new
  program.run
rescue Exception => e
	puts  "An Error Occured Due to wrong input , the following message was raised :" 
	puts  e
end 


