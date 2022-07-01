OFFSET = 1

class Cell
  def self.alive 
    1
  end

  def self.dead
    0
  end

  def self.neighbor_count(universe, row, spot)
    [ n_neighbor?(universe, row, spot), s_neighbor?(universe, row, spot),
      e_neighbor?(universe, row, spot), w_neighbor?(universe, row, spot),
      ne_neighbor?(universe, row, spot), nw_neighbor?(universe, row, spot),
      se_neighbor?(universe, row, spot), sw_neighbor?(universe, row, spot)
    ].count(true)
  end

  def self.n_neighbor?(universe, row, spot)
    return false if row - OFFSET < 0
    return universe[row - OFFSET][spot] == alive
  end

  def self.s_neighbor?(universe, row, spot)
    return false if row + OFFSET == universe.size
    return universe[row + OFFSET][spot] == alive
  end

  def self.e_neighbor?(universe, row, spot)
    return false if spot + OFFSET == universe[row].size
    return universe[row][spot + OFFSET] == alive
  end

  def self.w_neighbor?(universe, row, spot)
    return false if spot - OFFSET < 0
    return universe[row][spot - OFFSET] == alive
  end

  def self.nw_neighbor?(universe, row, spot)
    return false if (row - OFFSET < 0) || (spot - OFFSET < 0)
    return universe[row - OFFSET][spot - OFFSET] == alive
  end

  def self.ne_neighbor?(universe, row, spot)
    return false if (row - OFFSET < 0) || (spot + OFFSET == universe[row].size)
    return universe[row - OFFSET][spot + OFFSET] == alive
  end

  def self.se_neighbor?(universe, row, spot)
    return false if (row + OFFSET == universe.size) || (spot + OFFSET == universe[row].size)
    return universe[row + OFFSET][spot + OFFSET] == alive
  end

  def self.sw_neighbor?(universe, row, spot)
    return false if (row + OFFSET == universe.size) || (spot - OFFSET < 0)
    return universe[row + OFFSET][spot - OFFSET] == alive
  end
end