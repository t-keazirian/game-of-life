require 'rspec'
require_relative '../lib/game_of_life.rb'

describe 'still lifes' do
    it 'block' do
      test_universe = [
        [0, 0, 0, 0],
        [0, 1, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0]
      ]
      result = GameOfLife.tick(test_universe)
      expect(result).to eq(test_universe)

      100.times do
        result = GameOfLife.tick(result)
      end
      expect(result).to eq(test_universe)
    end

    it 'Beehive' do
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