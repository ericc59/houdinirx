class String
  def hmatch(options=nil, &block)
    regex_helper = Houdini::RegexHelper.new()
    regex_helper.instance_eval(&block)
    regex_helper.match(self)
  end
  
  def hscan(options=nil, &block)
    regex_helper = Houdini::RegexHelper.new()
    regex_helper.instance_eval(&block)
    regex_helper.scan(self)
  end
end