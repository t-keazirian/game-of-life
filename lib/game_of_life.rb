require_relative '../lib/cell.rb'

class GameOfLife
  def self.tick(universe)
    new_universe = []

    width = universe.size - 1
    height = universe[0].size - 1
    (0..width).each do |row|
      new_row = []
      (0..height).each do |spot|
        neighbor_count = Cell.neighbor_count(universe, row, spot)
        if neighbor_count == 3
          new_row << Cell.alive
        elsif neighbor_count == 2 and (universe[row][spot] == Cell.alive)
          new_row << Cell.alive 
        else
          new_row << Cell.dead
        end 
      end
      new_universe << new_row
    end
    
    return new_universe
  end
end
