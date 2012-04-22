require 'test/unit'
require 'lib/nif_generator'

class NifGeneratorTest < Test::Unit::TestCase
  def test_should_validate_correct_nif
    valid_nif = '502874210'
    assert_equal true, Nif::Validator.validate(valid_nif), "Nif #{valid_nif} should be valid"
  end

  def test_should_not_validate_incorrect_nif
    invalid_nif = '2024230'
    assert_equal false, Nif::Validator.validate(invalid_nif), "Nif #{invalid_nif} should not be valid"
  end

  def test_should_generate_valid_nif
    generated_nif = Nif::Generator.generate
    assert_equal true, Nif::Validator.validate(generated_nif), "Nif #{generated_nif} should be valid"
  end

  def test_should_generate_valid_unique_nif
    generated_nif = Nif::Generator.generate_unique
    assert_equal true, Nif::Validator.validate(generated_nif), "Nif #{generated_nif} should be valid"
  end
end
