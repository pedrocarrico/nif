module Nif
  class Generator
    def self.generate
      generated_nif = (1 + rand(9)).to_s

      (1..7).to_a.each { generated_nif += (rand(10)).to_s }

      generated_nif += NifGenerator.calculate_check_digit(generated_nif).to_s
    end

    def self.generate_unique
      if NifGenerator.instance.nifs_generated.nil?
        NifGenerator.instance.nifs_generated = []
      end

      generated_nif = generate

      while NifGenerator.instance.nifs_generated.include? generated_nif
        generated_nif = generate
      end

      NifGenerator.instance.nifs_generated << generated_nif

      generated_nif
    end
  end

  class Validator
    def self.validate value
      return false unless NifGenerator.is_integer? value
      return false if value.length != 9
      NifGenerator.calculate_check_digit(value)  == value[8,1].to_i
    end
  end

  class NifGenerator
    @@instance = new
    private_class_method :new

    attr_accessor :nifs_generated

    private

    def self.instance
      @@instance
    end

    def self.is_integer? value
      value =~ /\A(?:0|[1-9]\d*)\z/
    end

    def self.calculate_check_digit value
      control_sum  = 9*value[0,1].to_i + 8*value[1,1].to_i + 7*value[2,1].to_i + 6*value[3,1].to_i + 5*value[4,1].to_i + 4*value[5,1].to_i + 3*value[6,1].to_i + 2*value[7,1].to_i
      control_mod  = control_sum % 11
      check_number = 11 - control_mod
      check_number > 9 ? 0 : check_number
    end
  end
  
  if defined?(ActiveModel::EachValidator)
    class NifValidator < ActiveModel::EachValidator      
      def validate_each(record, attribute, value)
        record.errors.add(attribute, :invalid) unless Nif::Validator.validate(value)
      end      
    end
        
    I18n.load_path << File.join(File.dirname(__FILE__), "nif", "locale", 'en.yml')
  end
end
