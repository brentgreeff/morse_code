class Obfuscator

  def initialize(lines)
    @lines = lines
  end

  def to_s
    @lines.map(&method(:extract_mapping)).join("\n")
  end

  def extract_mapping(line)
    line.chomp.each_char.chunk(&:itself).map do |segment|
      if segment[0].eql? '.'
        segment[1].length
      elsif segment[0].eql? '-'
        ('A'.ord + segment[1].length - 1).chr
      else
        segment[0]
      end
    end.join
  end
end
