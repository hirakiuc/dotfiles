require 'pathname'

class Path
  attr_reader :home, :cwd
  def initialize(home: '~', cwd: '.')
    @home = Pathname.new(home).expand_path
    @cwd  = Pathname.new(cwd).expand_path
  end

  @path = new

  def self.from_home(path)
    @path.home.join(path)
  end

  def self.from_cwd(path)
    @path.cwd.join(path)
  end
end
