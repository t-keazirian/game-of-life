OFFSET = 1

class Cell
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def == other
    x == other.x && y == other.y
  end

  def to_s
    "(#{x}, #{y})"
  end

  def neighbor_count(universe)
    [ n_neighbor?(universe), s_neighbor?(universe),
      e_neighbor?(universe), w_neighbor?(universe),
      ne_neighbor?(universe), nw_neighbor?(universe),
      se_neighbor?(universe), sw_neighbor?(universe)
    ].count(true)
  end

  def n_neighbor?(universe)
    return universe_contains_neighbor(universe, Cell.new(@x, @y + OFFSET))
  end

  def s_neighbor?(universe)
    return universe_contains_neighbor(universe, Cell.new(@x, @y - OFFSET))
  end

  def e_neighbor?(universe)
    return universe_contains_neighbor(universe, Cell.new(@x + OFFSET, @y))
  end

  def w_neighbor?(universe)
    return universe_contains_neighbor(universe,  Cell.new(@x - OFFSET, @y))
  end

  def nw_neighbor?(universe)
    return universe_contains_neighbor(universe, Cell.new(@x - OFFSET, @y + OFFSET))
  end

  def ne_neighbor?(universe)
    return universe_contains_neighbor(universe, Cell.new(@x + OFFSET, @y + OFFSET))
  end

  def sw_neighbor?(universe)
    return universe_contains_neighbor(universe, Cell.new(@x - OFFSET, @y - OFFSET))
  end

  def se_neighbor?(universe)
    return universe_contains_neighbor(universe, Cell.new(@x + OFFSET, @y - OFFSET))
  end

  private

  def universe_contains_neighbor(universe, neighbor_cell)
    universe.each do |live_cell|
      return true if live_cell == neighbor_cell
    end

    return false
  end
end

