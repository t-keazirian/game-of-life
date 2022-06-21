require 'rspec'
require_relative '../lib/new_cell.rb'

describe 'new cell' do
  describe 'neighbors' do
    it 'can determine if a cell does not have a neighbor in the cardinal directions' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]
  
        expect(NewCell.n_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(NewCell.s_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(NewCell.e_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(NewCell.w_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(NewCell.nw_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(NewCell.ne_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(NewCell.sw_neighbor?(test_universe, 1, 1)).to eq(false)
        expect(NewCell.se_neighbor?(test_universe, 1, 1)).to eq(false)
      end
  
    it 'can determine if a cell has a neighbor to the north' do
      test_universe =
        [
          [0, 1, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]
   
      expect(NewCell.n_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the south' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 1, 0]
        ]
   
      expect(NewCell.s_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the east' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 1],
          [0, 0, 0]
        ]
   
      expect(NewCell.e_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the west' do
      test_universe =
        [
          [0, 0, 0],
          [1, 1, 0],
          [0, 0, 0]
        ]
   
      expect(NewCell.w_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the north east' do
      test_universe =
        [
          [0, 0, 1],
          [0, 1, 0],
          [0, 0, 0]
        ]
   
      expect(NewCell.ne_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the north west' do
      test_universe =
        [
          [1, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]
   
      expect(NewCell.nw_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the southeast' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 1]
        ]
   
      expect(NewCell.se_neighbor?(test_universe, 1, 1)).to eq(true)
    end
  
    it 'can determine if a cell has a neighbor to the southwest' do
      test_universe =
        [
          [0, 0, 0],
          [0, 1, 0],
          [1, 0, 0]
        ]
   
      expect(NewCell.sw_neighbor?(test_universe, 1, 1)).to eq(true)
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

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(0)
    end

    it 'a cell with one neighbor has a neighbor count of one' do
      test_universe =
        [
          [1, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(1)
    end

    it 'a cell with two neighbor has a neighbor count of two' do
      test_universe =
        [
          [1, 0, 0],
          [0, 1, 0],
          [0, 0, 1]
        ]

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(2)
    end

    it 'a cell with three neighbors has a neighbor count of three' do
      test_universe =
        [
          [1, 1, 0],
          [0, 1, 0],
          [0, 0, 1]
        ]

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(3)
    end

    it 'a cell with four neighbors has a neighbor count of four' do
      test_universe =
        [
          [1, 1, 1],
          [0, 1, 0],
          [0, 0, 1]
        ]

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(4)
    end

    it 'a cell with five neighbors has a neighbor count of five' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 0],
          [0, 0, 1]
        ]

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(5)
    end

    it 'a cell with six neighbors has a neighbor count of six' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 1],
          [0, 0, 1]
        ]

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(6)
    end

    it 'a cell with seven  neighbors has a neighbor count of seven' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 1],
          [1, 0, 1]
        ]

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(7)
    end

    it 'a cell with eight neighbors has a neighbor count of eight' do
      test_universe =
        [
          [1, 1, 1],
          [1, 1, 1],
          [1, 1, 1]
        ]

      expect(NewCell.neighbor_count(test_universe, 1, 1)).to eq(8)
    end
  end 
end
