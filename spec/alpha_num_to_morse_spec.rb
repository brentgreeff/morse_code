require_relative '../lib/alpha_num_to_morse'

RSpec.describe AlphaNumToMorse do
  let(:encode) do
    AlphaNumToMorse.new( input ).to_s
  end

  context 'When the input is: I AM IN TROUBLE' do
    let(:input) { 'I AM IN TROUBLE' }

    it 'encodes correctly' do
      expect( encode ).to eq '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
    end
  end

  context 'When the input contains punctuation' do
    let(:input) { 'H,I.' }

    it 'encodes commas and fullstops' do
      expect( encode ).to eq '....|--..--|..|.-.-.-'
    end
  end

  context 'When the input contains numbers' do
    let(:input) { '09' }

    it 'encodes the numbers' do
      expect( encode ).to eq '-----|----.'
    end
  end

  context 'When input is in lowercase' do
    let(:input) { 'i am' }

    it 'encodes the same as uppercase' do
      expect( encode ).to eq '../.-|--'
    end
  end
end
