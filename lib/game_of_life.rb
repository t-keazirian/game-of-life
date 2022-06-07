
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

    universe.each do |cell|
        if cell.neighbor_count(universe) < 2
            # cell DIES
        else
            new_universe << cell
        end
    end
    
    return new_universe
  end
end

