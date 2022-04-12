require 'rspec'
require_relative '../lib/cell.rb'

describe 'a cell' do
  before do
    @x_coordinate = 1
    @y_coordinate = 2
    @test_cell = Cell.new(@x_coordinate, @y_coordinate)
  end

  it 'has an x coordinate' do
    expect(@test_cell.x).to eq(@x_coordinate)
  end

  it 'has an y coordinate' do
    expect(@test_cell.y).to eq(@y_coordinate)
  end
end