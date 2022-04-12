require 'rspec'
require_relative '../lib/universe.rb'

describe 'A Universe' do
  [
    [1, 1, 1],
    [2, 2, 4],
    [4, 4, 16],
    [50, 50, 2500],
    [1000, 1000, 1000000]
  ].each do |test_width, test_height, expected_cell_count|
    it "is a grid of cells #{test_width}x#{test_height} cells of size #{expected_cell_count}" do
      universe = Universe.new(test_width, test_height)

      actual_cell_count = universe.cell_count

      expect(actual_cell_count).to eq(expected_cell_count)
    end
  end

  # cell gird idea:
   #   0 1 2
   # 0 . . .
   # 1 . A A
   # 2 . . .
  it 'can set a cell as live' do
    universe = Universe.new(3, 3)
    test_cell = Cell.new(1, 1)
    universe.set_live_cell(test_cell)
    expected_live_cell_count = 1

    actual_live_cell_count = universe.live_cell_count

    expect(actual_live_cell_count).to eq(expected_live_cell_count)
  end

  it 'can set two cells as live' do
    universe = Universe.new(3, 3)
    cell1 = Cell.new(1, 1)
    cell2 = Cell.new(2, 1)
    universe.set_live_cell(cell1)
    universe.set_live_cell(cell2)
    expected_live_cell_count = 2

    actual_live_cell_count = universe.live_cell_count

    expect(actual_live_cell_count).to eq(expected_live_cell_count)
  end

  it 'can set many cells as live' do
    universe = Universe.new(3, 3)
    cell1 = Cell.new(1, 1)
    cell2 = Cell.new(2, 1)
    cell3 = Cell.new(2, 1)
    cell4 = Cell.new(2, 1)
    universe.set_live_cell(cell1)
    universe.set_live_cell(cell2)
    universe.set_live_cell(cell3)
    universe.set_live_cell(cell4)
    expected_live_cell_count = 4

    actual_live_cell_count = universe.live_cell_count

    expect(actual_live_cell_count).to eq(expected_live_cell_count)
  end
end
