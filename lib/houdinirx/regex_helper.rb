module Houdini
  class RegexHelper
    attr_accessor :expressions, :match_string, :captures, :regexp
  
    def initialize
      @expressions = []
      @captures = []
      @regexp = nil
    end
  
    def r(*args)
      if args.size == 2
        @expressions << [args[1], args[0]]
      else
        expression = args.shift
        args.each do |name|
          @expressions << [name, expression]
        end
      end
    end
  
    def m(match_str)
      @match_string = match_str
    end
  
    def match(text, options=Regexp::IGNORECASE)
      @regexp = match_string.gsub(/\s/, "\\s*")
      replace_expressions!(@regexp)
      r = Regexp.new(@regexp, options)
      Houdini::MatchResult.new(text.match(r), @captures)
    end
    
    def scan(text, options=Regexp::IGNORECASE)
      @regexp = match_string.gsub(/\s/, "\\s*")
      replace_expressions!(@regexp)
      r = Regexp.new(@regexp, options)
      scans = text.scan(r)
      scans.collect {|scan| Houdini::MatchResult.new(scan, @captures) }
    end
    
    protected
    def replace_expressions!(regex)
      @expressions.each do |name, r|
        name = name.to_s
        if regex =~ /\(#{name}\)/
          @captures << name
        end
        if r.class == Symbol
          defined_regex = Houdini[r]
          raise "Regexp :#{r} undefined in Houdinirx.  Have you added it?" if defined_regex.nil?
          r = defined_regex.source
        end
        r = r.source if r.class == Regexp
        regex.gsub!(name, r)
      end
    end
  end
end