defmodule GameOfLife.Grid do
  defstruct [:size, :cells]

  @type t :: %__MODULE__{
          size: pos_integer(),
          cells: tuple()
        }

  def new(size) do
    %__MODULE__{
      size: size,
      cells: init_cells(size)
    }
  end

  @spec active?(atom | %{cells: tuple}, pos_integer, pos_integer) :: any
  def active?(grid, x, y) do
    grid.cells
    |> elem(x - 1)
    |> elem(y - 1)
  end

  def will_thrive?(grid, x, y) do
    neighbours = active_neighbours(grid, x, y)
    active? = active?(grid, x, y)

    cond do
      active? and neighbours < 2 ->
        false

      active? and neighbours > 3 ->
        false

      not active? and neighbours == 3 ->
        true

      active? and neighbours in 2..3 ->
        true

      not active? ->
        false
    end
  end

  def activate(grid, x, y) do
    grid
    |> change_cell_state(x, y, true)
  end

  def deactivate(grid, x, y) do
    grid
    |> change_cell_state(x, y, false)
  end

  defp active_neighbours(grid, x, y) do
    grid
    |> neighbours(x, y)
    |> Enum.map(fn {x2, y2} -> active?(grid, x2, y2) end)
    |> Enum.count(&(&1 == true))
  end

  defp neighbours(grid, x, y) do
    limit = grid.size

    for x2 <- (x - 1)..(x + 1),
        y2 <- (y - 1)..(y + 1),
        x2 in 1..limit,
        y2 in 1..limit,
        x2 != x or y2 != y do
      {x2, y2}
    end
  end

  defp init_cells(size) do
    List.duplicate(false, size)
    |> List.to_tuple()
    |> List.duplicate(size)
    |> List.to_tuple()
  end

  defp change_cell_state(grid, x, y, value) do
    new_row =
      grid.cells
      |> elem(x - 1)
      |> put_elem(y - 1, value)

    cells = put_elem(grid.cells, x - 1, new_row)

    %__MODULE__{grid | cells: cells}
  end
end
