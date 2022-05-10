OFFSET = 1

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

  def n_neighbor?(universe, cell)
    return universe_contains_neighbor(universe, n_neighbor(cell))
  end

  def s_neighbor?(universe, cell)
    return universe_contains_neighbor(universe, s_neighbor(cell))
  end

  def e_neighbor?(universe, cell)
    return universe_contains_neighbor(universe, e_neighbor(cell))
  end

  def w_neighbor?(universe, cell)
    return universe_contains_neighbor(universe, w_neighbor(cell))
  end

  def nw_neighbor?(universe, cell)
    return universe_contains_neighbor(universe, nw_neighbor(cell))
  end

  def ne_neighbor?(universe, cell)
    return universe_contains_neighbor(universe, ne_neighbor(cell))
  end

  def sw_neighbor?(universe, cell)
    return universe_contains_neighbor(universe, sw_neighbor(cell))
  end

  def se_neighbor?(universe, cell)
    return universe_contains_neighbor(universe, se_neighbor(cell))
  end

  def neighbor_count(universe, cell)
    [ n_neighbor?(universe, cell), s_neighbor?(universe, cell),
      e_neighbor?(universe, cell), w_neighbor?(universe, cell),
      ne_neighbor?(universe, cell), nw_neighbor?(universe, cell),
      se_neighbor?(universe, cell), sw_neighbor?(universe, cell)
    ].count(true)
  end
  
  private

  def universe_contains_neighbor(universe, neighbor_cell)
    universe.each do |live_cell|
      return true if live_cell == neighbor_cell
    end

    return false
  end

  def n_neighbor(cell)
    Cell.new(cell.x, cell.y + OFFSET)
  end
  
  def s_neighbor(cell)
    Cell.new(cell.x, cell.y - OFFSET)
  end

  def e_neighbor(cell)
    Cell.new(cell.x + OFFSET, cell.y)
  end

  def w_neighbor(cell)
    Cell.new(cell.x - OFFSET, cell.y)
  end

  def nw_neighbor(cell)
    Cell.new(cell.x - OFFSET, cell.y + OFFSET)
  end

  def ne_neighbor(cell)
    Cell.new(cell.x + OFFSET, cell.y + OFFSET)
  end

  def sw_neighbor(cell)
    Cell.new(cell.x - OFFSET, cell.y - OFFSET)
  end

  def se_neighbor(cell)
    Cell.new(cell.x + OFFSET, cell.y - OFFSET)
  end
end
