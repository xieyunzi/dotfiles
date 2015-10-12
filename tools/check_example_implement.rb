class ImplementFile
  EXT_NAME = '.example'

  def initialize(full_path)
    @full_path = full_path
    @real_path = File.realpath(@full_path)
    @implement_full_path =
      @full_path.sub(/#{Regexp.escape(EXT_NAME)}$/, '')
  end

  def implement?
    File.exist? @implement_full_path
  end

  def up_to_date?
    File.mtime(@implement_full_path).to_i - File.mtime(@real_path).to_i > 0
  end

  def report
    is_implemented = implement?
    is_up_to_date = is_implemented && up_to_date?

    {
      full_path: @full_path,
      real_path: @real_path,
      implemented: is_implemented,
      up_to_date: is_up_to_date
    }
  end
end

result =
  Dir["#{Dir.home}/.*#{ImplementFile::EXT_NAME}"].map do |full_path|
    ImplementFile.new(full_path).report.to_a.map { |r| r.to_s }
  end

puts result
