RSpec.describe "running the script" do

  it 'displays an error for missing arguments' do
    expect { system %(./code) }
      .to output(a_string_including("missing argument:"))
      .to_stderr_from_any_process
  end

  it 'reads input from a file' do
    expect { system %(./code -f example/message.txt) }
      .to output(a_string_including(results))
      .to_stdout_from_any_process
  end

  it 'reads input from the command line' do
    expect { system %(./code -m "HELLO\nI AM IN TROUBLE") }
      .to output(a_string_including(results))
      .to_stdout_from_any_process
  end

  def results
  <<~HEREDOC
    ....|.|.-..|.-..|---
    ../.-|--/..|-./-|.-.|---|..-|-...|.-..|.
  HEREDOC
  end

  context 'with invalid input' do

    it 'displays an error for missing file' do
      expect { system %(./code -f does-not-exist) }
        .to output(a_string_including("No such file or directory"))
        .to_stderr_from_any_process
    end

    it 'displays an error for blank file' do
      expect { system %(./code -f example/blank.txt) }
        .to output(a_string_including("Input file is empty"))
        .to_stderr_from_any_process
    end
  end

  context 'with invalid characters' do

    it 'displays a warning' do
      expect { system %(./code -m "X!X-") }
        .to output(a_string_including('Invalid characters ["!", "-"] ignored'))
        .to_stdout_from_any_process
    end

    it 'only encodes the valid characters' do
      expect { system %(./code -m "X!X!") }
        .to output(a_string_including("-..-|-..-"))
        .to_stdout_from_any_process
    end
  end
end
