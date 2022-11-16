#!/usr/bin/ruby

require_relative "../os_command"

class PlugUpdate < OSCommand
  def mac
    update
  end

  def debian
    update
  end

  def update
    stream_command("sed '/plug#end()/{q}' ~/.config/nvim/init.vim > #{tmp_init_path}")
    stream_command("nvim -u #{tmp_init_path} +'PlugUpdate' +qa")
    stream_command("rm #{tmp_init_path}")
  end

  def tmp_init_path
    "/tmp/init-plug.vim"
  end

  def skip?
    true # This only matters for the init.vim config, _not_ init.lua
  end
end

PlugUpdate.run!
