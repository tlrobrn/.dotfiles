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
end
