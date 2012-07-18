require 'coverage_helper' if ENV['COVERAGE'] == 'on'
require 'nif'

describe "NifGenerator" do
  it "should validate a valid nif" do
    valid_nif = '502874210'
    result = Nif::Validator.validate(valid_nif)
    
    result.should == true
  end
  
  it "should not validate an invalid nif" do
    invalid_nif = '502874211'
    result = Nif::Validator.validate(invalid_nif)
    
    result.should == false
  end
  
  it "should generate a valid nif" do
    nif = Nif::Generator.generate
    result = Nif::Validator.validate(nif)
    
    result.should == true
  end
end
