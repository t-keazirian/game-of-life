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

  describe 'neighbors' do
    before do
      @test_game = GameOfLife.new(3, 3)
      @test_cell = Cell.new(1, 1)
      @one_cell_universe = @test_game.set_live_cell([],  @test_cell)
    end

    it 'can determine if a cell does not have a neighbor in the cardinal directions' do
      expect(@test_cell.n_neighbor?(@one_cell_universe)).to eq(false)
      expect(@test_cell.s_neighbor?(@one_cell_universe)).to eq(false)
      expect(@test_cell.e_neighbor?(@one_cell_universe)).to eq(false)
      expect(@test_cell.w_neighbor?(@one_cell_universe)).to eq(false)
      expect(@test_cell.nw_neighbor?(@one_cell_universe)).to eq(false)
      expect(@test_cell.ne_neighbor?(@one_cell_universe)).to eq(false)
      expect(@test_cell.sw_neighbor?(@one_cell_universe)).to eq(false)
      expect(@test_cell.se_neighbor?(@one_cell_universe)).to eq(false)
    end

    # north neighbor:
    #   0 1 2
    # 2 . N .
    # 1 . C .
    # 0 . . .
    it 'can determine if a cell has a neighbor to the north' do
      test_neighbor = Cell.new(1, 2)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)

      expect(@test_cell.n_neighbor?(test_universe)).to eq(true)
    end

    # south neighbor:
    #   0 1 2
    # 2 . . .
    # 1 . C .
    # 0 . N .
    it 'can determine if a cell has a neighbor to the south' do
      test_neighbor = Cell.new(1, 0)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)

      expect(@test_cell.s_neighbor?(test_universe)).to eq(true)
    end

    # east neighbor:
    #   0 1 2
    # 2 . . .
    # 1 . C N
    # 0 . . .
    it 'can determine if a cell has a neighbor to the east' do
      test_neighbor = Cell.new(2, 1)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)

      expect(@test_cell.e_neighbor?(test_universe)).to eq(true)
    end

    # west neighbor:
    #   0 1 2
    # 2 . . .
    # 1 N C .
    # 0 . . .
    it 'can determine if a cell has a neighbor to the west' do
      test_neighbor = Cell.new(0, 1)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)

      expect(@test_cell.w_neighbor?(test_universe)).to eq(true)
    end

    # nw neighbor:
    #   0 1 2
    # 2 N . .
    # 1 . C .
    # 0 . . .
    it 'can determine if a cell has a neighbor to the nw' do
      test_neighbor = Cell.new(0, 2)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)

      expect(@test_cell.nw_neighbor?(test_universe)).to eq(true)
    end

    # ne neighbor:
    #   0 1 2
    # 2 . . N
    # 1 . C .
    # 0 . . .
    it 'can determine if a cell has a neighbor to the ne' do
      test_neighbor = Cell.new(2, 2)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)

      expect(@test_cell.ne_neighbor?(test_universe)).to eq(true)
    end

    # sw neighbor:
    #   0 1 2
    # 2 . . .
    # 1 . C .
    # 0 N . .
    it 'can determine if a cell has a neighbor to the sw' do
      test_neighbor = Cell.new(0, 0)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)

      expect(@test_cell.sw_neighbor?(test_universe)).to eq(true)
    end


    # se neighbor:
    #   0 1 2
    # 2 . . .
    # 1 . C .
    # 0 . . N
    it 'can determine if a cell has a neighbor to the se' do
      test_neighbor = Cell.new(2, 0)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)

      expect(@test_cell.se_neighbor?(test_universe)).to eq(true)
    end
  end

  describe 'neighbor counts' do
    before do
     @test_game = GameOfLife.new(3, 3)
     @test_cell = Cell.new(1, 1)
     @one_cell_universe = @test_game.set_live_cell([],  @test_cell)
    end

    it 'a cell with no neighbors has a neighbor count of zero' do
      expect(@test_cell.neighbor_count(@one_cell_universe)).to eq(0)
    end

    it 'a cell with one neighbor has a neighbor count of one' do
      test_universe = [Cell.new(0, 0)]

      expect(@test_cell.neighbor_count(test_universe)).to eq(1)
    end

    it 'a cell with two neighbors has a neighbor count of two' do
      test_universe = [Cell.new(0, 0), Cell.new(1, 0)]

      expect(@test_cell.neighbor_count(test_universe)).to eq(2)
    end

    it 'a cell with three neighbors has a neighbor count of three' do
      test_universe = [Cell.new(0, 0), Cell.new(1, 0), Cell.new(2, 0)]

      expect(@test_cell.neighbor_count(test_universe)).to eq(3)
    end

    it 'a cell with four neighbors has a neighbor count of four' do
      test_universe = [Cell.new(0, 0), Cell.new(1, 0), Cell.new(2, 0), Cell.new(0, 1)]

      expect(@test_cell.neighbor_count(test_universe)).to eq(4)
    end

    it 'a cell with five neighbors has a neighbor count of five' do
      test_universe = [
        Cell.new(0, 0),
        Cell.new(1, 0),
        Cell.new(2, 0),
        Cell.new(0, 1),
        Cell.new(2, 1)
      ]

      expect(@test_cell.neighbor_count(test_universe)).to eq(5)
    end

    it 'a cell with six neighbors has a neighbor count of six' do
       test_universe = [
        Cell.new(0, 0),
        Cell.new(1, 0),
        Cell.new(2, 0),
        Cell.new(0, 1),
        Cell.new(2, 1),
        Cell.new(0, 2)
      ]

      expect(@test_cell.neighbor_count(test_universe)).to eq(6)
    end

    it 'a cell with seven neighbors has a neighbor count of seven' do
       test_universe = [
        Cell.new(0, 0),
        Cell.new(1, 0),
        Cell.new(2, 0),
        Cell.new(0, 1),
        Cell.new(2, 1),
        Cell.new(0, 2),
        Cell.new(1, 2)
      ]

      expect(@test_cell.neighbor_count(test_universe)).to eq(7)
    end

    it 'a cell with eight neighbors has a neighbor count of eight' do
       test_universe = [
        Cell.new(0, 0),
        Cell.new(1, 0),
        Cell.new(2, 0),
        Cell.new(0, 1),
        Cell.new(2, 1),
        Cell.new(0, 2),
        Cell.new(1, 2),
        Cell.new(2, 2)
      ]

      expect(@test_cell.neighbor_count(test_universe)).to eq(8)
    end
  end
end

