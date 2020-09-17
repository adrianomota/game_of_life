defmodule GameOfLife.GameTest do
  use ExUnit.Case, async: true

  alias GameOfLife.Game

  test "when glider exists returns next generation" do
    game =
      Game.new(size: 5)
      |> Game.activate_cell(3, 1)
      |> Game.activate_cell(4, 2)
      |> Game.activate_cell(2, 3)
      |> Game.activate_cell(3, 3)
      |> Game.activate_cell(4, 3)

    expected =
      Game.new(size: 5)
      |> Game.activate_cell(2, 2)
      |> Game.activate_cell(4, 2)
      |> Game.activate_cell(3, 3)
      |> Game.activate_cell(4, 3)
      |> Game.activate_cell(3, 4)

    game_on_gen2 = Game.advance_generation(game)

    assert 1 == game.generation
    assert 2 == game_on_gen2.generation
    assert expected.world == game_on_gen2.world
    assert [{1, game.world}] == game_on_gen2.previous_generations
  end
end
