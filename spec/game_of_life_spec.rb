require 'rspec'
require_relative '../lib/game_of_life.rb'

describe 'GameOfLife' do
  [
    [1, 1, 1],
    [2, 2, 4],
    [4, 4, 16],
    [50, 50, 2500],
    [1000, 1000, 1000000]
  ].each do |test_width, test_height, expected_cell_count|
    it "is a grid of cells #{test_width}x#{test_height} cells of size #{expected_cell_count}" do
      test_game = GameOfLife.new(test_width, test_height)

      actual_cell_count = test_game.size

      expect(actual_cell_count).to eq(expected_cell_count)
    end
  end

  # 9 cell universe:
   #   0 1 2
   # 2 . C .
   # 1 . C C
   # 0 . . .
  it 'can add cells to a universe' do
    test_universe = []
    test_game = GameOfLife.new(3, 3)
    test_cell1 = Cell.new(1, 1)
    test_cell2 = Cell.new(2, 1)
    test_cell3 = Cell.new(1, 2)
    expected_live_cell_count = 3
    test_universe = test_game.set_live_cell(test_universe, test_cell1)
    test_universe = test_game.set_live_cell(test_universe, test_cell2)
    test_universe = test_game.set_live_cell(test_universe, test_cell3)

    actual_live_cell_count = test_game.live_cell_count(test_universe)

    expect(actual_live_cell_count).to eq(expected_live_cell_count)
  end

  describe 'neighbors' do
    before do
      @test_game = GameOfLife.new(3, 3)
      @test_cell = Cell.new(1, 1)
      @one_cell_universe = @test_game.set_live_cell([],  @test_cell)
    end

    it 'can determine if a cell does not have a neighbor in the cardinal directions' do
      expect(@test_game.n_neighbor?(@one_cell_universe, @test_cell)).to eq(false)
      expect(@test_game.s_neighbor?(@one_cell_universe, @test_cell)).to eq(false)
      expect(@test_game.e_neighbor?(@one_cell_universe, @test_cell)).to eq(false)
      expect(@test_game.w_neighbor?(@one_cell_universe, @test_cell)).to eq(false)
      expect(@test_game.nw_neighbor?(@one_cell_universe, @test_cell)).to eq(false)
      expect(@test_game.ne_neighbor?(@one_cell_universe, @test_cell)).to eq(false)
      expect(@test_game.sw_neighbor?(@one_cell_universe, @test_cell)).to eq(false)
      expect(@test_game.se_neighbor?(@one_cell_universe, @test_cell)).to eq(false)
    end
  
    # north neighbor:
    #   0 1 2
    # 2 . N .
    # 1 . C .
    # 0 . . .
    it 'can determine if a cell has a neighbor to the north' do
      test_neighbor = Cell.new(1, 2)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)
  
      expect(@test_game.n_neighbor?(test_universe, @test_cell)).to eq(true)
    end
  
    # south neighbor:
    #   0 1 2
    # 2 . . .
    # 1 . C .
    # 0 . N .
    it 'can determine if a cell has a neighbor to the south' do
      test_neighbor = Cell.new(1, 0)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)
  
      expect(@test_game.s_neighbor?(test_universe, @test_cell)).to eq(true)
    end
  
    # east neighbor:
    #   0 1 2
    # 2 . . .
    # 1 . C N
    # 0 . . .
    it 'can determine if a cell has a neighbor to the east' do
      test_neighbor = Cell.new(2, 1)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)
  
      expect(@test_game.e_neighbor?(test_universe, @test_cell)).to eq(true)
    end

    # west neighbor:
    #   0 1 2
    # 2 . . .
    # 1 N C .
    # 0 . . .
    it 'can determine if a cell has a neighbor to the west' do
      test_neighbor = Cell.new(0, 1)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)
  
      expect(@test_game.w_neighbor?(test_universe, @test_cell)).to eq(true)
    end 

    # nw neighbor:
    #   0 1 2
    # 2 N . .
    # 1 . C .
    # 0 . . .
    it 'can determine if a cell has a neighbor to the nw' do
      test_neighbor = Cell.new(0, 2)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)
  
      expect(@test_game.nw_neighbor?(test_universe, @test_cell)).to eq(true)
    end 

    # ne neighbor:
    #   0 1 2
    # 2 . . N
    # 1 . C .
    # 0 . . .
    it 'can determine if a cell has a neighbor to the ne' do
      test_neighbor = Cell.new(2, 2)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)
  
      expect(@test_game.ne_neighbor?(test_universe, @test_cell)).to eq(true)
    end 

    # sw neighbor:
    #   0 1 2
    # 2 . . .
    # 1 . C .
    # 0 N . .
    it 'can determine if a cell has a neighbor to the sw' do
      test_neighbor = Cell.new(0, 0)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)
  
      expect(@test_game.sw_neighbor?(test_universe, @test_cell)).to eq(true)
    end


    # se neighbor:
    #   0 1 2
    # 2 . . .
    # 1 . C .
    # 0 . . N
    it 'can determine if a cell has a neighbor to the se' do
      test_neighbor = Cell.new(2, 0)
      test_universe = @test_game.set_live_cell(@one_cell_universe, test_neighbor)
  
      expect(@test_game.se_neighbor?(test_universe, @test_cell)).to eq(true)
    end
  end
end
