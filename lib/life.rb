class GameOfLife
  def self.hello_world
    "Hello, World!"
  end
end

class Universe
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def cell_count
    @width * @height
  end
end
