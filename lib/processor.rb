require 'fileutils'

class Processor
  attr_accessor :logger

  def initialize(logger)
    @logger = logger
  end

  def process(src, dst)
    ensure_directory dst.parent

    if dst.exist?
      if dst.directory?
        @logger.error "Skip updating a symlink to #{dst}."
        @logger.error "  => #{dst} is not a file..."
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
