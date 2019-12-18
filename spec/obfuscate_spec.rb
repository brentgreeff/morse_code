require_relative '../lib/obfuscator'

RSpec.describe "Obfuscate" do

  it 'reads from stdin' do
    expect($stdin).to receive(:readlines).and_return(["HI"])
    expect(Obfuscator).to receive(:new).with(["HI"])

    load 'obfuscate'
  end

  it 'obfuscates' do
    expect { system %(./obfuscate < example/morse.txt) }
      .to output(a_string_including("2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1"))
      .to_stdout_from_any_process
  end
end
