require 'yaml'

class MorseCode
  @mapping = YAML.load_file('mapping.yml')

  class << self

    def from_char(char)
      @mapping[char]
    end

    def valid_input
      @mapping.keys << ' '
    end
  end
end
