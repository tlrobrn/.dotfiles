#!/usr/bin/ruby

require_relative "../os_command"

class InstallLuaLanguageServer < OSCommand
  def mac
    install
  end

  def debian
    install
  end

  def install
    stream_command("curl -L https://github.com/sumneko/lua-language-server/releases/download/3.6.3/lua-language-server-3.6.3-linux-x64.tar.gz -o /tmp/lua-language-server.tar.gz")
    stream_command("mkdir ~/.local/share/lua-language-server")
    stream_command("tar -xvzf /tmp/lua-language-server.tar.gz -C ~/.local/share/lua-language-server/")
    stream_command("rm /tmp/lua-language-server.tar.gz")
    write_wrapper
    stream_command("chmod u+x #{wrapper_file_path}")
  end

  def write_wrapper
    File.open(wrapper_file_path, mode: "w") do |f|
      f.write <<~CONTENT.strip
        #!/bin/bash
        exec "$HOME/.local/share/lua-language-server/bin/lua-language-server" "$@"
      CONTENT
    end
  end

  def wrapper_file_path
    File.expand_path("~/.local/bin/lua-language-server")
  end

  def skip?
    File.exists?(wrapper_file_path)
  end
end

InstallLuaLanguageServer.run!
