require 'rspec'
require_relative '../lib/game_of_life.rb'
require_relative '../lib/cell.rb'

  describe 'Rules' do
    describe "Any live cell with fewer than two live neighbors dies" do
      it "A cell with no neighbors dies" do
        test_universe =
          [
            [0, 0, 0],
            [0, 1, 0],
            [0, 0, 0]
          ]

        result = GameOfLife.tick(test_universe)

        expect(result[1][1]).to eq(Cell.dead)
      end

      [
        ["SW", [ [0, 0, 0], [0, 1, 0], [1, 0, 0] ]],
        ["S", [ [0, 0, 0], [0, 1, 0], [0, 1, 0] ]],
        ["SE", [ [0, 0, 0], [0, 1, 0], [0, 0, 1] ]],
        ["E", [ [0, 0, 0], [0, 1, 1], [0, 0, 0] ]],
        ["NE", [ [0, 0, 1], [0, 1, 0], [0, 0, 0] ]],
        ["N", [ [0, 1, 0], [0, 1, 0], [0, 0, 0] ]],
        ["NW", [ [1, 0, 0], [0, 1, 0], [0, 0, 0] ]],
        ["W", [ [0, 0, 0], [1, 1, 0], [0, 0, 0] ]]
      ].each do |name, test_universe|
      it "A cell with one #{name} neighbor dies" do
        result = GameOfLife.tick(test_universe)

        expect(result[1][1]).to eq(Cell.dead)
      end
    end

    describe 'Any live cell with two live neighbours survives.' do
      [
        ["N", "S", [[0, 1, 0], [0, 1, 0], [0, 1, 0]]],
        ["N", "E", [[0, 1, 0], [0, 1, 1], [0, 0, 0]]],
        ["N", "W", [[0, 1, 0], [1, 1, 0], [0, 0, 0]]],
        ["N", "NE", [[0, 1, 1], [0, 1, 0], [0, 0, 0]]],
        ["N", "NW", [[1, 1, 0], [0, 1, 0], [0, 0, 0]]],
        ["N", "SE", [[0, 1, 0], [0, 1, 0], [0, 0, 1]]],
        ["N", "SW", [[0, 1, 0], [0, 1, 0], [1, 0, 0]]],
        ["S", "E", [[0, 0, 0], [0, 1, 1], [0, 1, 0]]],
        ["S", "W", [[0, 0, 0], [1, 1, 0], [0, 1, 0]]],
        ["S", "NE", [[0, 0, 1], [0, 1, 0], [0, 1, 0]]],
        ["S", "NW", [[1, 0, 0], [0, 1, 0], [0, 1, 0]]],
        ["S", "SE", [[0, 0, 0], [0, 1, 0], [0, 1, 1]]],
        ["S", "SW", [[0, 0, 0], [0, 1, 0], [1, 1, 0]]],
        ["E", "W", [[0, 0, 0], [1, 1, 1], [0, 0, 0]]],
        ["E", "NE", [[0, 0, 1], [0, 1, 1], [0, 0, 0]]],
        ["E", "NW", [[1, 0, 0], [0, 1, 1], [0, 0, 0]]],
        ["E", "SE", [[0, 0, 0], [0, 1, 1], [0, 0, 1]]],
        ["E", "SW", [[0, 0, 0], [0, 1, 1], [1, 0, 0]]],
        ["W", "NE", [[0, 0, 1], [1, 1, 0], [0, 0, 0]]],
        ["W", "NW", [[1, 0, 0], [1, 1, 0], [0, 0, 0]]],
        ["W", "SE", [[0, 0, 0], [1, 1, 0], [0, 0, 1]]],
        ["W", "SW", [[0, 0, 0], [1, 1, 0], [1, 0, 0]]],
        ["NE", "NW", [[1, 0, 1], [0, 1, 0], [0, 0, 0]]],
        ["NE", "SE", [[0, 0, 1], [0, 1, 0], [0, 0, 1]]],
        ["NE", "SW", [[0, 0, 1], [0, 1, 0], [1, 0, 0]]],
        ["NW", "SE", [[1, 0, 0], [0, 1, 0], [0, 0, 1]]],
        ["NW", "SW", [[1, 0, 0], [0, 1, 0], [1, 0, 0]]],
        ["SE", "SW", [[0, 0, 0], [0, 1, 0], [1, 0, 1]]]
      ].each do |name_one, name_two, test_universe|
        it "live cell with neighbors #{name_one} and #{name_two} survives" do
          result = GameOfLife.tick(test_universe)

          expect(result[1][1]).to eq(Cell.alive)
        end
      end
    end

    it 'Any live cell with three live neighbours survives.' do
        test_universe_one = [ [1, 1, 0], [1, 1, 0], [0, 0, 0] ]
        test_universe_two = [ [0, 0, 0], [0, 1, 1], [0, 1, 1] ]
        test_universe_three = [ [0, 0, 0], [1, 1, 0], [1, 1, 0] ]
        test_universe_four = [ [0, 1, 1], [0, 1, 1], [0, 0, 0] ]

        result_one = GameOfLife.tick(test_universe_one)
        result_two = GameOfLife.tick(test_universe_two)
        result_three = GameOfLife.tick(test_universe_three)
        result_four = GameOfLife.tick(test_universe_four)
  
        expect(result_one[1][1]).to eq(Cell.alive)
        expect(result_two[1][1]).to eq(Cell.alive)
        expect(result_three[1][1]).to eq(Cell.alive)
        expect(result_four[1][1]).to eq(Cell.alive)
    end

    it 'Any live cell with more than three live neighbours dies.' do
      test_universe_one = [ [1, 1, 1], [1, 1, 0], [0, 0, 0] ]
      test_universe_two = [ [0, 0, 0], [1, 1, 1], [0, 1, 1] ]
      test_universe_three = [ [0, 0, 0], [1, 1, 1], [1, 1, 0] ]
      test_universe_four = [ [0, 1, 1], [1, 1, 1], [0, 0, 0] ]

      result_one = GameOfLife.tick(test_universe_one)
      result_two = GameOfLife.tick(test_universe_two)
      result_three = GameOfLife.tick(test_universe_three)
      result_four = GameOfLife.tick(test_universe_four)

      expect(result_one[1][1]).to eq(Cell.dead)
      expect(result_two[1][1]).to eq(Cell.dead)
      expect(result_three[1][1]).to eq(Cell.dead)
      expect(result_four[1][1]).to eq(Cell.dead)
    end

    describe 'Any Cell.dead cell with three live neighbours becomes Cell.alive.' do
      it 'Any Cell.dead cell with less than three live neighbours does not come Cell.alive.' do
        test_universe_one = [ [0, 1, 0], [1, 0, 0], [0, 0, 0] ]
        test_universe_two = [ [0, 0, 0], [0, 0, 1], [0, 1, 0] ]
        test_universe_three = [ [0, 0, 0], [1, 0, 0], [0, 1, 0] ]
        test_universe_four = [ [0, 0, 1], [0, 0, 1], [0, 0, 0] ]

        result_one = GameOfLife.tick(test_universe_one)
        result_two = GameOfLife.tick(test_universe_two)
        result_three = GameOfLife.tick(test_universe_three)
        result_four = GameOfLife.tick(test_universe_four)
  
        expect(result_one[1][1]).to eq(Cell.dead)
        expect(result_two[1][1]).to eq(Cell.dead)
        expect(result_three[1][1]).to eq(Cell.dead)
        expect(result_four[1][1]).to eq(Cell.dead)
      end

      it 'Any Cell.dead cell with exactly three live neighbours becomes Cell.alive.' do
        test_universe_one = [ [1, 1, 0], [1, 0, 0], [0, 0, 0] ]
        test_universe_two = [ [0, 0, 0], [0, 0, 1], [0, 1, 1] ]
        test_universe_three = [ [0, 0, 0], [1, 0, 0], [1, 1, 0] ]
        test_universe_four = [ [0, 1, 1], [0, 0, 1], [0, 0, 0] ]

        result_one = GameOfLife.tick(test_universe_one)
        result_two = GameOfLife.tick(test_universe_two)
        result_three = GameOfLife.tick(test_universe_three)
        result_four = GameOfLife.tick(test_universe_four)
  
        expect(result_one[1][1]).to eq(Cell.alive)
        expect(result_two[1][1]).to eq(Cell.alive)
        expect(result_three[1][1]).to eq(Cell.alive)
        expect(result_four[1][1]).to eq(Cell.alive)
      end

      it 'Any Cell.dead cell with more than three live neighbours does not come Cell.alive.' do
        test_universe_one = [ [1, 1, 1], [1, 0, 0], [0, 0, 0] ]
        test_universe_two = [ [0, 0, 0], [1, 0, 1], [0, 1, 1] ]
        test_universe_three = [ [0, 0, 0], [1, 0, 1], [1, 1, 0] ]
        test_universe_four = [ [0, 1, 1], [1, 0, 1], [0, 0, 0] ]
  
        result_one = GameOfLife.tick(test_universe_one)
        result_two = GameOfLife.tick(test_universe_two)
        result_three = GameOfLife.tick(test_universe_three)
        result_four = GameOfLife.tick(test_universe_four)
  
        expect(result_one[1][1]).to eq(Cell.dead)
        expect(result_two[1][1]).to eq(Cell.dead)
        expect(result_three[1][1]).to eq(Cell.dead)
        expect(result_four[1][1]).to eq(Cell.dead)
      end
    end
  end
end
