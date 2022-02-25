#!/usr/bin/ruby

require_relative "../os_command"

class FetchOhMyTmux < OSCommand
  def mac
    fetch_oh_my_tmux
  end

  def debian
    fetch_oh_my_tmux
  end

  def fetch_oh_my_tmux
    `git clone https://github.com/gpakosz/.tmux.git #{File.expand_path("~/.tmux")}`
    `ln -s -f #{File.expand_path("~/.tmux/.tmux.conf")} #{File.expand_path("~/.tmux.conf")}`
  end

  def skip?
    Dir.exists?(File.expand_path("~/.tmux"))
  end
end

FetchOhMyTmux.run!
