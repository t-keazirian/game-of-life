require 'rspec'
require_relative '../lib/life.rb'

describe 'hello_world' do
  it 'prints a hello message' do
    expect(GameOfLife.hello_world).to eq("Hello, World!")
  end
end

describe 'The Universe' do
  [
    [1, 1, 1],
    [2, 2, 4],
    [4, 4, 16],
    [50, 50, 2500],
    [1000, 1000, 1000000]
  ].each do |test_width, test_height, expected_cell_count|
    it "is a grid of cells #{test_width}x#{test_height} cells of size #{expected_cell_count}" do
      universe = Universe.new(test_width, test_height)

      actual_cell_count = universe.cell_count()

      expect(expected_cell_count).to eq(actual_cell_count)
    end
  end
end
