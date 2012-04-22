class NifGenerator

  @@instance = new

  private_class_method :new

  attr_accessor :nifs_generated

  def self.instance
    @@instance
  end

  def validate value
    return false unless is_integer? value
    return false if value.length != 9
    calculate_check_digit(value)  == value[8,1].to_i
  end

  def generate
    generated_nif = (1 + rand(9)).to_s

   (1..7).to_a.each { generated_nif += (rand(10)).to_s }

   generated_nif += calculate_check_digit(generated_nif).to_s
  end

  def generate_unique
    if @nifs_generated.nil?
      @nifs_generated = []
    end

    generated_nif = generate

    while @nifs_generated.include? generated_nif
      generated_nif = generate
    end

    @nifs_generated << generated_nif

    generated_nif
  end

private

  def is_integer? value
    value =~ /\A(?:0|[1-9]\d*)\z/
  end

  def calculate_check_digit value
    control_sum  = 9*value[0,1].to_i + 8*value[1,1].to_i + 7*value[2,1].to_i + 6*value[3,1].to_i + 5*value[4,1].to_i + 4*value[5,1].to_i + 3*value[6,1].to_i + 2*value[7,1].to_i
    control_mod  = control_sum % 11
    check_number = 11 - control_mod
    check_number > 9 ? 0 : check_number
  end
end
