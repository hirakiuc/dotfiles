require 'fileutils'

class Processor
  attr_accessor :logger, :force

  def initialize(logger, options)
    @logger = logger
    @force = options[:force] || false
  end

  def process(src, dst)
    ensure_directory dst.parent

    if dst.exist?
      if dst.directory?
        @logger.error "Skip updating a symlink to #{dst}."
        @logger.error "  => #{dst} is not a file..."
        return
      end

      unless @force
        @logger.info "Skip updating the existing file: '#{dst}'"
        return
      end

      dst.unlink
      logger.debug "Removed #{dst}."
    end

    dst.make_symlink(src)
    @logger.debug "Create a symlink #{src} to #{dst}."
  rescue => e
    @logger.error("failed to make a symbolic link:#{e}")
  end

  private

  def ensure_directory(dir)
    return if dir.exist?

    begin
      dir.mkpath
    rescue => e
      @logger.error('failed to create target directory', dir.to_s)
      throw e
    end
  end
end
