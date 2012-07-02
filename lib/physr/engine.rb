class Engine
  attr_accessor :objects, :aabbs, :last_time, :time_scale

  def initialize args = {}
    defaults = {time_scale:1}
    opts = defaults.merge args
    @objects = @aabbs = []
    @last_time = nil
    @time_scale = opts[:time_scale]
  end

  def time_since_last
    unless @last_time
      @last_time = Time.now
      return 0
    end
    time = Time.now
    time_diff = time - @last_time
    @last_time = time
    time_diff / @time_scale
  end

  def update
    time = time_since_last
    return if time == 0
  end

  def aabb_collision
    @objects.each do |obj|
      @aabbs.each { |aabb| obj.aabb_colission aabb }
    end
  end

  def circle_collision
    circles = @objects.select { |obj| obj.instance_of? Circle }
    @objects.each do |obj|
      circles.each { |circle| obj.circle_collision circle }
    end
  end

  def add_circle args={}
    @objects.push Circle.new args
  end

  def add_aabb args={}
    @aabbs.push AABB.new args
  end
end
