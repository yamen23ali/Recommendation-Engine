require_relative '../spec_helper'

describe FileParser do
  
  let(:data) {"1;2\n1;3\n2;4\n"}

  it "should parse file contents and return a result" do
    allow(File).to receive(:open).with('test_file','r').and_return( StringIO.new(data) )
    parser = FileParser.new
    expected_set = Set.new ["2" ,"3"]
    
    result = parser.parse_to_sets("test_file",";")
    diff = result["1"] - expected_set

    expect(diff.count).to eq(0)
  end
  
end