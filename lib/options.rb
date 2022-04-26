class Options
  attr_accessor :src_dir, :dst_dir, :debug, :ignores

  def initialize
    @debug = false
    @src_dir = Options::abspath('./files')
    @dst_dir = Options::abspath(ENV['HOME'])
    @ignores = []
  end

  def src_dir=(path)
    @src_dir = Options::abspath(path)
  end

  def dst_dir=(path)
    @dst_dir = Options::abspath(path)
  end

  def ignore(pattern)
    @ignores << pattern
  end

  def self.abspath(path)
    Pathname.new(path).expand_path
  end
end
