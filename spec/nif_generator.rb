require 'lib/nif_generator'

describe "NifGenerator" do
  it "should validade a valid Nif" do
    valid_nif = '502874210'
    nif_generator = NifGenerator.instance
    result = NifGenerator.instance.validate(valid_nif)

    result.should == true    
  end
end