require File.expand_path(File.dirname(__FILE__) + '/../../lib/nif')

Given /^a NifGenerator$/ do
  #TODO: get a valid instance?
end

When /^I validate a valid nif$/ do
  valid_nif = '502874210'
  result = Nif::Validator.validate(valid_nif)
end

When /^I validate a nif like "([^"]*)"$/ do |nif|
  result = Nif::Validator.validate(nif)
end

When /^I generate a valid nif$/ do
  nif = Nif::Generator.generate
  result = Nif::Validator.validate(nif)
end

Then /^I should see "([^"]*)"$/ do |result|
  result.should == "#{result}"
end
