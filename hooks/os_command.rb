require "open3"

class OSCommand
  def self.run!
    new.send(:run!)
  end

  def mac; end

  def debian; end

  def skip?
    false
  end

  private

  def run!
    return if skip?

    puts "Running #{self.class.name}"

    if mac?
      mac
    elsif debian?
      debian
    else
      raise "OS not supported"
    end
  end

  def mac?
    RUBY_PLATFORM.include? "darwin"
  end

  def debian?
    RUBY_PLATFORM.include?("linux") && !`which apt`.empty?
  end

  def stream_command(command_str)
    puts command_str
    status = nil
    Open3.popen2e(command_str) do |_stdin, stdout_and_stderr, wait_thr|
      stdout_and_stderr.each { |line| puts line }
      status = wait_thr.value
    end
    status
  end
end
