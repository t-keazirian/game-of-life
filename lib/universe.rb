class Universe
  attr_accessor :width, :height
  attr_accessor :live_cells

  def initialize(width, height)
    @width = width
    @height = height
    @live_cells = []
  end

  def cell_count
    @width * @height
  end

  def set_live_cell(cell)
    @live_cells << cell
  end

  def live_cell_count
    @live_cells.size
  end
end
