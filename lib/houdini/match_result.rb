module Houdini
  class MatchResult
    
    attr_accessor :match, :captures
    
    def initialize(match, captures)
      @match = match

      raise RuntimeError, "Regex failed" if @match.nil?
      @captures = captures.collect {|c| c.to_sym }
    end
    
    def method_missing(method, *args, &block)
      if @captures.include?(method)
        index = @captures.index(method)
        if @match.class == MatchData
          @match.captures[index]
        else
          @match[index]
        end
      else
        raise RuntimeError, "#{method} not captured"
      end
    end
    
  end
end