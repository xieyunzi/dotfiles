class ImplementFile
  EXT_NAME = '.example'

  def initialize(full_path)
    @full_path = full_path
    @implement_full_path =
      full_path.sub(/#{Regexp.escape(EXT_NAME)}$/, '')
  end

  def implement?
    File.exist? @implement_full_path
  end

  def out_of_date?
    File.mtime(@full_path).to_i - File.mtime(@implement_full_path).to_i > 0
  end
end

result =
  Dir["#{Dir.home}/.*#{ImplementFile::EXT_NAME}"].map do |full_path|
    implement_file = ImplementFile.new full_path

    is_implemented = implement_file.implement? ? 'implemented' : 'not_implemented'
    is_out_of_date = implement_file.out_of_date? ? 'out_of_date' : 'up_to_date'

    [full_path, is_implemented, is_out_of_date]
  end

puts result
