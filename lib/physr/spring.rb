class Spring
  attr_accessor :spring_constant, :length

  def initialize args={}
    defaults = {spring_constant: 1, length: 100}
    opts = defaults.merge args

    @spring_constant = opts[:spring_constant]
    @length = opts[:length]
  end
end
