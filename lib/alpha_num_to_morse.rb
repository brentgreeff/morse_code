require_relative 'morse_code'

class AlphaNumToMorse
  include Enumerable

  def initialize(input)
    @input = strip_invalid input.upcase
  end

  def to_s
    # spaces result in double pipe characters on join
    to_a.join('|').gsub('||', '/')
  end

  def each
    @input.each_char do |char|
      yield to_morse char
    end
    self
  end

  def to_morse(char)
    MorseCode.from_char(char)
  end

  private

  def strip_invalid(input)
    invalid = input.chars - MorseCode.valid_input
    puts "Invalid characters #{invalid} ignored" unless invalid.empty?

    input.gsub(/[^#{MorseCode.valid_input.join}]/, '')
  end
end
