# vim:set ft=ruby

require 'find'

require_relative './target.rb'

class Filter
  attr_reader :rules

  def initialize
    @rules = []
  end

  def add_rule(rule)
    @rules << rule
  end

  def match?(path)
    @rules.any? do |rule|
      match_against_rule?(rule, path)
    end
  end

  private

  def match_against_rule?(rule, path)
    case rule
    when Regexp then rule.match?(path)
    when String then path.start_with?(rule)
    else false # unsupported case
    end
  end
end

class Finder
  attr_reader :filter

  def initialize
    @filter = Filter.new
  end

  def add_ignore_rule(rule)
    @filter.add_rule(rule)
  end
  
  def find(path)
    root = path

    Find.find(path) do |p|
      if FileTest.directory?(p)
        if File.basename(p) == "."
          Find.prune
        else
          next
        end
      end

      yield TargetFile.new(p) unless @filter.match?(p)
    end
  end
end
