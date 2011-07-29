$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "houdini/version"
require "houdini/string"
require "houdini/regex_helper"
require "houdini/match_result"

module Houdini
  
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