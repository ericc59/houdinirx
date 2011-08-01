$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "houdinirx/version"
require "houdinirx/string"
require "houdinirx/regex_helper"
require "houdinirx/match_result"

module Houdinirx
  
  class << self
    def [](name)
      definitions[name]
    end
    
    def define(name, regex)
      definitions[name] = regex
    end
    
    def definitions
      @@def ||= {}
    end
  end
  
end