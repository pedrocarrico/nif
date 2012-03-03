require 'lib/nif_generator'

describe "NifGenerator" do
  it "should validate a valid nif" do
    valid_nif = '502874210'
    nif_generator = NifGenerator.instance
    result = nif_generator.validate(valid_nif)

    result.should == true    
  end

  it "should not validate an invalid nif" do
    invalid_nif = '502874211'
    nif_generator = NifGenerator.instance
    result = nif_generator.validate(invalid_nif)

    result.should == false    
  end
  
  it "should generate a valid nif" do
    nif_generator = NifGenerator.instance
    nif = nif_generator.generate
    result = nif_generator.validate(nif)

    result.should == true    
  end    
end