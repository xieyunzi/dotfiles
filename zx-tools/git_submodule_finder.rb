Dir["#{Dir.pwd}/*"].each do |subdir|
  next unless File.directory?(subdir)

  Dir.chdir subdir
  # puts `git remote -v`
  remote_url = `git config --get remote.origin.url`.strip
  fail puts(subdir) if remote_url == ''
  name = remote_url.sub('https://github.com/', '').sub(/\.git$/, '')
  path = name.split('/').last

  puts "[submodule \"#{name}\"]"
  puts "  path = #{path}"
  puts "  url = #{remote_url}"
end
