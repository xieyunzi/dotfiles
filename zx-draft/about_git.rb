require 'rugged'
require 'byebug'

# repo = Rugged::Repository.new('')
repo = Rugged::Repository.discover(File.expand_path('~/.dotfiles'))
puts repo.path
puts repo.head
