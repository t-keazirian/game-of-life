require 'rspec'
require_relative '../lib/game_of_life.rb'

describe 'GameOfLife' do
  [
    [1, 1, 1],
    [2, 2, 4],
    [4, 4, 16],
    [50, 50, 2500],
    [1000, 1000, 1000000]
  ].each do |test_width, test_height, expected_cell_count|
    it "is a grid of cells #{test_width}x#{test_height} cells of size #{expected_cell_count}" do
      test_game = GameOfLife.new(test_width, test_height)

      actual_cell_count = test_game.size

      expect(actual_cell_count).to eq(expected_cell_count)
    end
  end

  # 9 cell universe:
   #   0 1 2
   # 2 . C .
   # 1 . C C
   # 0 . . .
  it 'can add cells to a universe' do
    test_universe = []
    test_game = GameOfLife.new(3, 3)
    test_cell1 = Cell.new(1, 1)
    test_cell2 = Cell.new(2, 1)
    test_cell3 = Cell.new(1, 2)
    expected_live_cell_count = 3
    test_universe = test_game.set_live_cell(test_universe, test_cell1)
    test_universe = test_game.set_live_cell(test_universe, test_cell2)
    test_universe = test_game.set_live_cell(test_universe, test_cell3)

    actual_live_cell_count = test_game.live_cell_count(test_universe)

    expect(actual_live_cell_count).to eq(expected_live_cell_count)
  end

  describe 'Rules' do
    describe "Any live cell with fewer than two live neighbors dies" do
        it "A cell with no neighbors dies" do
          test_game = GameOfLife.new(3, 3)
          test_cell = Cell.new(1, 1)
          test_universe = [test_cell]

          result = test_game.tick(test_universe)

          expect(result).not_to include(test_cell)
        end

        [
            ["SW", Cell.new(0, 0)],
            ["S", Cell.new(1, 0)],
            ["SE", Cell.new(2, 0)],
            ["E", Cell.new(2, 1)],
            ["NE", Cell.new(2, 2)],
            ["N", Cell.new(1, 2)],
            ["NW", Cell.new(0, 2)],
            ["W", Cell.new(0, 1)]
        ].each do |n1_name, n1_cell|
            it "A cell with one #{n1_name} neighbor dies" do
            test_game = GameOfLife.new(3, 3)
            test_cell = Cell.new(1, 1)
            test_universe = [test_cell, n1_cell]

            result = test_game.tick(test_universe)

            expect(result).not_to include(test_cell)
            end
        end
    end

    describe 'Any live cell with two live neighbours survives.' do
      [
        ["N", Cell.new(1, 2), "S", Cell.new(1, 0)],
        ["N", Cell.new(1, 2), "E", Cell.new(2, 1)],
        ["N", Cell.new(1, 2), "W", Cell.new(0, 1)],
        ["N", Cell.new(1, 2), "NE", Cell.new(2, 2)],
        ["N", Cell.new(1, 2), "NW", Cell.new(0, 2)],
        ["N", Cell.new(1, 2), "SE", Cell.new(2, 0)],
        ["N", Cell.new(1, 2), "SW", Cell.new(0, 0)],
        ["S", Cell.new(1, 0), "E", Cell.new(2, 1)],
        ["S", Cell.new(1, 0), "W", Cell.new(0, 1)],
        ["S", Cell.new(1, 0), "NE", Cell.new(2, 2)],
        ["S", Cell.new(1, 0), "NW", Cell.new(0, 2)],
        ["S", Cell.new(1, 0), "SE", Cell.new(2, 0)],
        ["S", Cell.new(1, 0), "SW", Cell.new(0, 0)],
        ["E", Cell.new(2, 1), "W", Cell.new(0, 1)],
        ["E", Cell.new(2, 1), "NE", Cell.new(2, 2)],
        ["E", Cell.new(2, 1), "NW", Cell.new(0, 2)],
        ["E", Cell.new(2, 1), "SE", Cell.new(2, 0)],
        ["E", Cell.new(2, 1), "SW", Cell.new(0, 0)],
        ["W", Cell.new(0, 1), "NE", Cell.new(2, 2)],
        ["W", Cell.new(0, 1), "NW", Cell.new(0, 2)],
        ["W", Cell.new(0, 1), "SE", Cell.new(2, 0)],
        ["W", Cell.new(0, 1), "SW", Cell.new(0, 0)],
        ["NE", Cell.new(2, 2), "NW", Cell.new(0, 2)],
        ["NE", Cell.new(2, 2), "SE", Cell.new(2, 0)],
        ["NE", Cell.new(2, 2), "SW", Cell.new(0, 0)],
        ["NW", Cell.new(0, 2), "SE", Cell.new(2, 0)],
        ["NW", Cell.new(0, 2), "SW", Cell.new(0, 0)],
        ["SE", Cell.new(2, 0), "SW", Cell.new(0, 0)]
      ].each do |n1_name, n1_cell, n2_name, n2_cell|
        it "live cell with neighbors #{n1_name} and #{n2_name} survives" do
          test_game = GameOfLife.new(3, 3)
          test_cell = Cell.new(1, 1)
          test_universe = [test_cell, n1_cell, n2_cell]

          result = test_game.tick(test_universe)

          expect(result).to include(test_cell)
        end
      end
    end

    it 'Any live cell with three live neighbours survives.' do
      100.times do
        test_game = GameOfLife.new(3, 3)
        test_cell = Cell.new(1, 1)
        
        test_universe = [test_cell]
        test_universe << get_random_neighbor(test_cell, test_universe)
        test_universe << get_random_neighbor(test_cell, test_universe)
        test_universe << get_random_neighbor(test_cell, test_universe)

        result = test_game.tick(test_universe)
  
        expect(result).to include(test_cell)
      end
    end

    it 'Any live cell with more than three live neighbours dies.' do
      100.times do
        test_game = GameOfLife.new(3, 3)
        test_cell = Cell.new(1, 1)

        test_universe = [test_cell]
        test_universe << get_random_neighbor(test_cell, test_universe)
        test_universe << get_random_neighbor(test_cell, test_universe)
        test_universe << get_random_neighbor(test_cell, test_universe)
        test_universe << get_random_neighbor(test_cell, test_universe)
  
        result = test_game.tick(test_universe)
  
        expect(result).not_to include(test_cell)
      end
    end

    describe 'Any dead cell with three live neighbours becomes alive.' do
      it 'Any dead cell with less than three live neighbours does not come alive.' do
        100.times do
          test_game = GameOfLife.new(3, 3)
          test_cell = Cell.new(1, 1)

          test_universe = []
          test_universe << get_random_neighbor(test_cell, test_universe)
          test_universe << get_random_neighbor(test_cell, test_universe)

          result = test_game.tick(test_universe)
  
          expect(result).not_to include(test_cell)
        end
      end

      it 'Any dead cell with exactly three live neighbours becomes alive.' do
        100.times do
          test_game = GameOfLife.new(3, 3)
          test_cell = Cell.new(1, 1)

          test_universe = []
          test_universe << get_random_neighbor(test_cell, test_universe)
          test_universe << get_random_neighbor(test_cell, test_universe)
          test_universe << get_random_neighbor(test_cell, test_universe)

          result = test_game.tick(test_universe)
  
          expect(result).to include(test_cell)
        end
      end

      it 'Any dead cell with more than three live neighbours does not come alive.' do
        100.times do
          test_game = GameOfLife.new(3, 3)
          test_cell = Cell.new(1, 1)

          test_universe = []
          test_universe << get_random_neighbor(test_cell, test_universe)
          test_universe << get_random_neighbor(test_cell, test_universe)
          test_universe << get_random_neighbor(test_cell, test_universe)
          test_universe << get_random_neighbor(test_cell, test_universe)

          result = test_game.tick(test_universe)
  
          expect(result).not_to include(test_cell)
        end
      end


    end
  end

  private

  def random_cell
    x = (rand() * 3).to_i
    y = (rand() * 3).to_i

    Cell.new(x, y)
  end

  def get_random_neighbor(cell, test_universe)
    new_cell = random_cell
    while test_universe.include?(new_cell) or new_cell == cell
        new_cell = random_cell
    end

    new_cell
  end
end
