require 'rspec'
require_relative '../lib/new_cell.rb'

describe 'new cell' do
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
