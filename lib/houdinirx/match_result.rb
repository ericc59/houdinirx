module Houdini
  class MatchResult
    
    attr_accessor :match, :captures
    
    def initialize(match, captures)
      @match = match

      raise RuntimeError, "Regex failed" if @match.nil?
      @captures = captures.collect {|c| c.to_sym }
    end
    
    def to_hash
      {}.tap do |attributes|
        captures.each { |c| attributes[c] = value_for(c) }
      end
    end
    
    def method_missing(method, *args, &block)
      value = value_for(method)
      
      if value
        return value
      else
        raise RuntimeError, "#{method} not captured"
      end
    end
    
    protected
    def value_for(name)
      index = @captures.index(name)
      return nil if index == nil
      if @match.class == MatchData
        @match.captures[index]
      else
        @match[index]
      end
    end
    
  end
end