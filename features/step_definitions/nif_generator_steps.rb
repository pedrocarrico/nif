require 'lib/nif_generator'

Given /^a NifGenerator$/ do
  @nif_generator = NifGenerator.instance
end

When /^I validate a valid nif$/ do
  valid_nif = '502874210'
  result = @nif_generator.validate(valid_nif)
end

When /^I validate a nif like "([^"]*)"$/ do |nif|
  result = @nif_generator.validate(nif)
end

When /^I generate a valid nif$/ do
  nif = NifGenerator.instance.generate
  result = @nif_generator.validate(nif)
end

Then /^I should see "([^"]*)"$/ do |result|
  result.should == "#{result}"
end
