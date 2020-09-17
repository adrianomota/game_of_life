defmodule GameOfLifeTest do
  use ExUnit.Case, async: true

  alias GameOfLife.Grid

  test "new/1 when create a grid returns a specified size" do
    expected_size = 200

    grid = Grid.new(200)

    assert expected_size == grid.size
  end

  test "new/1 when initialize a multidimensional array returns a array size" do
    size = 3

    grid = Grid.new(size)

    expected_grid = {
      {false, false, false},
      {false, false, false},
      {false, false, false}
    }

    assert expected_grid == grid.cells
  end

  test "activate/3 when will activate to specified cell returns multidimensional array true element" do
    size = 3

    grid =
      Grid.new(size)
      |> Grid.activate(1, 1)
      |> Grid.activate(2, 2)
      |> Grid.activate(3, 2)

    expected_grid = {
      {true, false, false},
      {false, true, false},
      {false, true, false}
    }

    assert expected_grid == grid.cells
  end

  test "deactivate/3 when will deactivate to specified cell returns multidimensional array true element" do
    size = 3

    grid =
      Grid.new(size)
      |> Grid.activate(1, 1)
      |> Grid.activate(2, 2)
      |> Grid.activate(3, 2)
      |> Grid.deactivate(2, 2)
      |> Grid.deactivate(3, 2)

    expected_grid = {
      {true, false, false},
      {false, false, false},
      {false, false, false}
    }

    assert expected_grid == grid.cells
  end
end
