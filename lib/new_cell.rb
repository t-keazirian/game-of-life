OFFSET = 1
ALIVE = 1
DEAD = 0

class NewCell
  def self.n_neighbor?(universe, row, spot)
    return universe[row - OFFSET][spot] == ALIVE
  end

  def self.s_neighbor?(universe, row, spot)
    return universe[row + OFFSET][spot] == ALIVE
  end

  def self.e_neighbor?(universe, row, spot)
    return universe[row][spot + OFFSET] == ALIVE
  end

  def self.w_neighbor?(universe, row, spot)
    return universe[row][spot - OFFSET] == ALIVE
  end

  def self.nw_neighbor?(universe, row, spot)
    return universe[row - OFFSET][spot - OFFSET] == ALIVE
  end

  def self.ne_neighbor?(universe, row, spot)
    return universe[row - OFFSET][spot + OFFSET] == ALIVE
  end

  def self.se_neighbor?(universe, row, spot)
    return universe[row + OFFSET][spot + OFFSET] == ALIVE
  end

  def self.sw_neighbor?(universe, row, spot)
    return universe[row + OFFSET][spot - OFFSET] == ALIVE
  end
end