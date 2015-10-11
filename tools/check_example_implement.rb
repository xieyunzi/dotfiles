class ExampleCheck
  EXT_NAME = '.example'

  def initialize(full_path)
    @full_path = full_path
  end

  def implement?
    implement_full_path = @full_path.sub(/#{Regexp.escape(EXT_NAME)}$/, '')
    File.exist? implement_full_path
  end
end

result =
  Dir["#{Dir.home}/.*#{ExampleCheck::EXT_NAME}"].map do |full_path|
    example_check = ExampleCheck.new full_path
    check = example_check.implement? ? 'implemented' : 'none'
    [full_path, check]
  end

puts result
