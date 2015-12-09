# what are the gems you use daily in REPL? Put them in ___daily_gems
___daily_gems  = %w[benchmark yaml json digest redis]

# ___pry_gems is for loading vendor plugins for Pry.
___pry_gems = %w[awesome_print hirb sketches byebug pry-stack_explorer]

# === EDITOR ===
Pry.editor = 'vim'

# == Pry-Nav - Using pry as a debugger ==
Pry.commands.alias_command 'c', 'continue' rescue nil
Pry.commands.alias_command 's', 'step' rescue nil
Pry.commands.alias_command 'n', 'next' rescue nil
Pry.commands.alias_command 'r!', 'reload!' rescue nil

# === CONVENIENCE METHODS ===
# Stolen from https://gist.github.com/807492
# Use Array.toy or Hash.toy to get an array or hash to play with

class Array
  ## Require many gems at once.
  # Input: array of gems' name
  # The side effect is requiring all of them.
  def ___require_gems
    missing = []
    self.each do |e|
      begin
        require e
      rescue LoadError => err
        missing << e
      end
    end
    if !missing.empty?
      puts 'Missing ' + missing.join(' ') + ' goodies :('
    end
  end

  ## Generate a toy of array to play with.
  # Array.toy => [1,2,3,4,5,6,7,8,9,10]
  # Array.toy { |i| i ** 2 }
  # => [0,1,4,9,16,25,36,49,64,81]
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  ### Generate a toy of hash to play with.
  # Hash.toy 3
  # => { 1 => "a", 2 => "b", 3 => "c" }
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

___daily_gems.___require_gems
___pry_gems.___require_gems

## Benchmark.measure abstraction.
# puts bm { "a"*1_000_000_000 }
def bm(&block)
  Benchmark.measure &block
end

# ==============================
#   pbcopy
# ==============================
# Create command 'pbcopy' : Copy the last returned value in the Mac OS clipboard
# options : -m : Multiline copy
# Usage :
#         a => [1, 2, 3]
#         pbcopy
#         [1, 2, 3]
#         pbcopy -m
#          [
#           1,
#           2,
#           3,
#          ]
if RUBY_PLATFORM =~ /darwin/i # OSX only.
  # The pbcopy manual page for Mac OS X
  # http://goo.gl/o3nGsr
  def pbcopy(str, opts = {})
    IO.popen('pbcopy', 'r+') { |io| io.print str }
  end

  Pry.config.commands.command "pbcopy", "Copy last returned object to clipboard, -m for multiline copy" do

    multiline = arg_string == '-m'
    pbcopy _pry_.last_result.ai(:plain => true,
                                :indent => 2,
                                :index => false,
                                :multiline => multiline)
    output.puts "Copied #{multiline ? 'multilined' : ''}!"
  end

  Pry.config.commands.alias_command 'cp', 'pbcopy'
end

puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
