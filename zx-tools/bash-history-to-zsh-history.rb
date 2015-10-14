#!/usr/bin/env ruby

#################################################################
# = This script transfers bash history to zsh history
# = Change bash and zsh history files, if you don't use defaults
#
# = Usage: ruby bash_to_zsh_history.rb
#
# = Author: Ankit Goyal
#################################################################

# change if you don't use default values
BASH_HISTORY_FILE_PATH="#{ENV['HOME']}/.bash_history"
ZSH_HISTORY_FILE_PATH="#{ENV['HOME']}/.zsh_history"

# Read the bash history file
bash_hist_file = File.read(BASH_HISTORY_FILE_PATH)

# Get the list of commands from bash history hile
command_list = bash_hist_file.split("\n")

# Open the zsh history file
zsh_hist_file = File.open(ZSH_HISTORY_FILE_PATH, "a")

# Get timestamp required for zsh history file format and update the history file
time = Time.now.to_i
command_list.each do |command|
  time += 1
  zsh_hist_file.write(": #{time}:0;#{command}\n")
end

# Close the file
zsh_hist_file.close
