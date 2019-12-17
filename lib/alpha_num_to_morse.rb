require_relative 'morse_code'

class AlphaNumToMorse
  include Enumerable

  def initialize(input)
    @input = input.upcase
  end

  def to_s
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
end
