RSpec.describe do

  context "running the script" do

    it 'displays an error for missing arguments' do
      expect { system %(./run) }
        .to output(a_string_including("missing argument:"))
        .to_stderr_from_any_process
    end

    it 'reads input from a file' do
      expect { system %(./run -f example/message.txt) }
        .to output(a_string_including(results))
        .to_stdout_from_any_process
    end

    it 'reads input from the command line', :focus do
      expect { system %(./run -m "HELLO\nI AM IN TROUBLE") }
        .to output(a_string_including(results))
        .to_stdout_from_any_process
    end

    def results
    <<~HEREDOC
      ....|.|.-..|.-..|---
      ../.-|--/..|-./-|.-.|---|..-|-...|.-..|.
    HEREDOC
    end
  end
end
