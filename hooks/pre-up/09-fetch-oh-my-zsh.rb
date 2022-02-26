#!/usr/bin/ruby

require_relative "../os_command"

class FetchOhMyZsh < OSCommand
  def mac
    fetch_oh_my_zsh
  end

  def debian
    fetch_oh_my_zsh
  end

  def fetch_oh_my_zsh
    stream_command('sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
  end

  def skip?
    Dir.exists?(File.expand_path("~/.oh-my-zsh"))
  end
end

FetchOhMyZsh.run!
