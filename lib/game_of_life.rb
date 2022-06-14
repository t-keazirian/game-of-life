
class GameOfLife
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def size
    @width * @height
  end

  def set_live_cell(universe, cell)
    universe << cell
    universe
  end

  def live_cell_count(universe)
    universe.size
  end

  def tick(universe)
    new_universe = []

    (0..width).each do |x|
      (0..height).each do |y|
        cell = Cell.new(x, y)
        neighbor_count = cell.neighbor_count(universe)
        if neighbor_count == 3
            new_universe << cell
        end
        if neighbor_count == 2 and universe.include?(cell)
            new_universe << cell
        end 
      end
    end
    
    return new_universe
  end
end

