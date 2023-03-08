require 'logger'

require_relative './finder'
require_relative './options'
require_relative './processor'

class Setup
  attr_reader :options, :logger, :finder, :processor

  def self.configure
    s = Setup.new

    if block_given?
      yield s.options
    else
      raise 'require block'
    end

    s
  end

  def initialize
    @options = Options.new
    @finder = Finder.new
  end

  def run
    opts = { force: @options.force }
    @processor = Processor.new(logger, opts)

    @finder.ignore_patterns(@options.ignores)

    @finder.find @options.src_dir.to_s do |target|
      process(target)
    end
  end

  private

  def process(target)
    relative_path = target.relative_from(@options.src_dir)
    link_path = (@options.dst_dir.dup).join(relative_path).expand_path

    logger.info "#{target} to #{link_path}"

    @processor.process(target.path, link_path)
  end

  def logger
    @logger ||= Logger.new($stdout).tap do |log|
      log.level = \
      case @options.debug
        when true then Logger::DEBUG
        else           Logger::INFO
      end
    end
  end
end
