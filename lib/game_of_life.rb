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

  def north_neighbor?(universe, cell)
    north_cell = Cell.new(cell.x, cell.y + 1)
    universe.each do |live_cell|
      return true if live_cell == north_cell
    end

    return false
  end

  def live_cell_count(universe)
    universe.size
  end
end
