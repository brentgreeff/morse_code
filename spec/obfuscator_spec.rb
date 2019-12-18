require_relative '../lib/obfuscator'

RSpec.describe Obfuscator do

  it 'replaces a single dot with a 1' do
    expect( Obfuscator.new(['.']).to_s ).to eq '1'
  end

  it 'replaces consecutive dots with a number' do
    expect( Obfuscator.new(['...']).to_s ).to eq '3'
  end

  it 'replaces the number of consecutive dashes with the letter of the alphabet at that position' do
    expect( Obfuscator.new(['---']).to_s ).to eq 'C'
  end

  it 'replaces a single dash with A' do
    expect( Obfuscator.new(['-']).to_s ).to eq 'A'
  end

  it 'preserves forward slashes' do
    expect( Obfuscator.new(['../.-']).to_s ).to eq '2/1A'
  end

  it 'works with multiple lines' do
    expect( Obfuscator.new([".\n", "-\n"]).to_s ).to eq "1\nA"
  end
end
