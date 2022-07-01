require 'rspec'
require_relative '../lib/game_of_life.rb'

describe 'still lifes' do
    it 'block' do
      # ----
      # -00-
      # -00-
      # ----
      test_universe = [
        Cell.new(1, 1),
        Cell.new(1, 2),
        Cell.new(2, 1),
        Cell.new(2, 2)
      ]
      test_game = GameOfLife.new(4, 4)

      result = test_game.tick(test_universe)
      expect(result).to eq(test_universe)

      100.times do
        result = test_game.tick(result)
      end
      expect(result).to eq(test_universe)
    end

    xit 'block' do
      # ------
      # --00--
      # -0--0-
      # --00--
      # ------
      test_universe = [
        Cell.new(1, 2),
        Cell.new(2, 1),
        Cell.new(2, 3),
        Cell.new(3, 1),
        Cell.new(3, 3),
        Cell.new(4, 2)
      ]
      test_universe = [
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 1, 0, 0],
        [0, 1, 0, 0, 1, 0],
        [0, 0, 1, 1, 0, 0],
        [0, 0, 0, 0, 0, 0],
      ]

      result = GameOfLife.tick(test_universe)
      expect(result).to eq(test_universe)

      100.times do
        result = GameOfLife.tick(result)
      end
      expect(result).to eq(test_universe)
    end
end