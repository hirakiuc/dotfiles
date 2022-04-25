# vim:set ft=ruby

require 'pathname'

class TargetFile
  attr_reader :path

  def initialize(path)
    @path = Pathname.new(path).realpath
  end

  def relative_from(path)
    p = Pathname.new(path).realpath

    @path.relative_path_from(p)
  end

  def change_parent(from, to)
    relative_path = self.relative_path_from(from)

    to.join(relative_path).expand_path
  end

  def to_s
    @path.to_s
  end
end
