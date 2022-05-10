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
end
