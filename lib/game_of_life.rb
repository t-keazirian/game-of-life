require_relative '../lib/new_cell.rb'

ALIVE = 1
DEAD = 0

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

  def self.new_tick(universe)
    new_universe = []

    width = universe.size - 1
    height = universe[0].size - 1
    (0..width).each do |row|
      new_row = []
      (0..height).each do |spot|
        neighbor_count = NewCell.neighbor_count(universe, row, spot)
        if neighbor_count == 3
          new_row << ALIVE
        elsif neighbor_count == 2 and (universe[row][spot] == ALIVE)
          new_row << ALIVE 
        else
          new_row << DEAD
        end 
      end
      new_universe << new_row
    end
    
    return new_universe
  end
end
