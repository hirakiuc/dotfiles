require 'forwardable'
require 'logger'

require_relative './finder.rb'
require_relative './processor.rb'

class Options
  attr_accessor :src_dir, :dst_dir, :debug

  def initialize
    @debug = false
    @src_dir = Options::abspath('./files')
    @dst_dir = Options::abspath(ENV['HOME'])
  end

  def src_dir=(path)
    @src_dir = Options::abspath(path)
  end

  def dst_dir=(path)
    @dst_dir = Options::abspath(path)
  end

  def self.abspath(path)
    Pathname.new(path).expand_path
  end
end

class Setup
  attr_reader :options, :logger, :finder, :processor

  extend Forwardable
  def_delegators :@options, \
    :src_dir, :src_dir=, \
    :dst_dir, :dst_dir=, \
    :debug,   :debug=

  def self.configure
    s = Setup.new

    if block_given?
      yield s
    else
      throw new Exception("require block")
    end

    s
  end

  def initialize
    @options = Options.new
    @finder = Finder.new
  end

  def ignore(pattern)
    @finder.add_ignore_rule(pattern)
  end

  def run
    @processor = Processor.new(logger)

    @finder.find self.src_dir.to_s do |target|
      process(target)
    end
  end

  private

  def process(target)
    relative_path = target.relative_from(self.src_dir)
    link_path = (self.dst_dir.dup).join(relative_path).expand_path

    logger.info "#{target} to #{link_path}"

    @processor.process(target.path, link_path)
  end

  def logger
    @logger ||= Logger.new($stdout).tap do |log|
      log.level = \
      case self.debug
        when true then Logger::DEBUG
        else           Logger::INFO
      end
    end
  end
end
