require 'test/unit'
require 'nif_generator'

class NifGeneratorTest < Test::Unit::TestCase
  def test_should_validate_correct_nif
    valid_nif = '502874210'
    assert_equal true, NifGenerator.instance.validate(valid_nif), "Nif #{valid_nif} should be valid"
  end
 
  def test_should_not_validate_incorrect_nif
    invalid_nif = '2024230'
    assert_equal false, NifGenerator.instance.validate(invalid_nif), "Nif #{invalid_nif} should not be valid"
  end
  
  def test_should_generate_valid_nif
    generated_nif = NifGenerator.instance.generate
    assert_equal true, NifGenerator.instance.validate(generated_nif), "Nif #{generated_nif} should be valid"
  end

  def test_should_generate_valid_unique_nif
    generated_nif = NifGenerator.instance.generate_unique
    assert_equal true, NifGenerator.instance.validate(generated_nif), "Nif #{generated_nif} should be valid"
  end  
end
