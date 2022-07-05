require 'rspec'
require_relative '../../lib/game_of_life.rb'

describe 'Spaceships' do
    it 'glider' do
      init_glider = [
        [0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0],
        [1, 0, 1, 0, 0],
        [0, 1, 1, 0, 0],
        [0, 0, 0, 0, 0]
      ]
      moved_glider = [
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0],
        [0, 1, 0, 1, 0],
        [0, 0, 1, 1, 0]
      ]

      result = multi_tick(4, init_glider)

      expect(result).to eq(moved_glider)
    end

    it 'light weight spaceship' do
      init_spaceship = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 1, 0, 0, 1, 0],
        [0, 0, 0, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0, 0, 1, 0],
        [0, 0, 0, 1, 1, 1, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]
      ]
      moved_spaceship = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 1, 0, 0, 0],
        [0, 1, 0, 0, 0, 0, 0, 0, 0],
        [0, 1, 0, 0, 0, 1, 0, 0, 0],
        [0, 1, 1, 1, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]
      ]

      result = multi_tick(4, init_spaceship)

      expect(result).to eq(moved_spaceship)
    end
    private

    def multi_tick(ticks, universe)
        result = GameOfLife.tick(universe)
        (ticks - 1).times do
          result = GameOfLife.tick(result)
        end

        result
    end
end