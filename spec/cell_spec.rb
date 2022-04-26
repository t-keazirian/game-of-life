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

  it 'is equal to another cell if their x and y coordinates are equal' do
    first_cell_1_1 = Cell.new(1, 1)
    second_cell_1_1 = Cell.new(1, 1)

    equality = first_cell_1_1 == second_cell_1_1

    expect(equality).to be(true)
  end

  it 'is not equal to another cell if their x coordinates are not equal' do
    cell_1_1 = Cell.new(1, 1)
    cell_2_1 = Cell.new(2, 1)

    equality = cell_1_1 == cell_2_1

    expect(equality).to be(false)
  end 

  it 'is not equal to another cell if their y coordinates are not equal' do
    cell_1_1 = Cell.new(1, 1)
    cell_1_2 = Cell.new(1, 2)

    equality = cell_1_1 == cell_1_2

    expect(equality).to be(false)
  end  

  it 'is not equal to another cell if their x and y coordinates are not equal' do
    cell_1_1 = Cell.new(1, 1)
    cell_2_2 = Cell.new(2, 2)

    equality = cell_1_1 == cell_2_2

    expect(equality).to be(false)
  end 
end
