require 'logger'

class Migrator
  attr_reader :options
  def initialize(options = { force: false })
    @options = options
  end

  #
  #
  # @param src [Pathname]
  # @param dst [Pathname]
  def renew(src, dst)
    logger.debug "#{src} => #{dst}"

    if dst.exist?
      unless dst.symlink?
        logger.warn "Skip to update a symlink to #{src}."
        logger.warn "  => #{dst} is not symlink..."
        return
      end

      unless force?
        logger.info "Skip #{src}."
        return
      end

      dst.unlink
      logger.info "Remove #{dst}."
    end

    File.symlink(src, dst)
    logger.info "Create symlink: #{src} to #{dst}."
  end

  private

  def force?
    options[:force]
  end

  def logger
    @logger ||= Logger.new($stdout).tap do |log|
      log.level = Logger::DEBUG
    end
  end
end
