require 'rspec'
require_relative '../lib/cell.rb'

describe 'Cell' do
  describe 'neighbors' do
    it 'can determine if a cell does not have a neighbor in the cardinal directions' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]
  
        expect(Cell.n_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(Cell.s_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(Cell.e_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(Cell.w_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(Cell.nw_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(Cell.ne_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(Cell.sw_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(Cell.se_neighbor?(test_universe, 1, 1)).to eq(false)
      end
  
    it 'can determine if a cell has a neighbor to the north' do
      test_universe =
        [
          [0, 1, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]
   
      expect(Cell.n_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the south' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 1, 0]
        ]
   
      expect(Cell.s_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the east' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 1],
          [0, 0, 0]
        ]
   
      expect(Cell.e_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the west' do
      test_universe =
        [
          [0, 0, 0],
          [1, 1, 0],
          [0, 0, 0]
        ]
   
      expect(Cell.w_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the north east' do
      test_universe =
        [
          [0, 0, 1],
          [0, 1, 0],
          [0, 0, 0]
        ]
   
      expect(Cell.ne_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the north west' do
      test_universe =
        [
          [1, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]
   
      expect(Cell.nw_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the southeast' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 1]
        ]
   
      expect(Cell.se_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the southwest' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [1, 0, 0]
        ]
   
      expect(Cell.sw_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  end

  describe 'neighbor count' do
    it 'a cell with no neighbors has a neighbor count of zero' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(0)
    end

    it 'a cell with one neighbor has a neighbor count of one' do
      test_universe =
        [
          [1, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(1)
    end

    it 'a cell with two neighbor has a neighbor count of two' do
      test_universe =
        [
          [1, 0, 0],
          [0, 1, 0],
          [0, 0, 1]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(2)
    end

    it 'a cell with three neighbors has a neighbor count of three' do
      test_universe =
        [
          [1, 1, 0],
          [0, 1, 0],
          [0, 0, 1]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(3)
    end

    it 'a cell with four neighbors has a neighbor count of four' do
      test_universe =
        [
          [1, 1, 1],
          [0, 1, 0],
          [0, 0, 1]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(4)
    end

    it 'a cell with five neighbors has a neighbor count of five' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 0],
          [0, 0, 1]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(5)
    end

    it 'a cell with six neighbors has a neighbor count of six' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 1],
          [0, 0, 1]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(6)
    end

    it 'a cell with seven  neighbors has a neighbor count of seven' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 1],
          [1, 0, 1]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(7)
    end

    it 'a cell with eight neighbors has a neighbor count of eight' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 1],
          [1, 1, 1]
        ]

      expect(Cell.neighbor_count(test_universe, 1, 1)).to eq(8)
    end

    it 'neighbors off the map are considered Cell.dead' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 1],
          [1, 1, 1]
        ]

      expect(Cell.neighbor_count(test_universe, 0, 0)).to eq(3)
      expect(Cell.neighbor_count(test_universe, 0, 1)).to eq(5)
      expect(Cell.neighbor_count(test_universe, 0, 2)).to eq(3)
      expect(Cell.neighbor_count(test_universe, 1, 0)).to eq(5)
      expect(Cell.neighbor_count(test_universe, 1, 2)).to eq(5)
      expect(Cell.neighbor_count(test_universe, 2, 0)).to eq(3)
      expect(Cell.neighbor_count(test_universe, 2, 1)).to eq(5)
      expect(Cell.neighbor_count(test_universe, 2, 2)).to eq(3)
    end
  end 
end
