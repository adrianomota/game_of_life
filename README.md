# GameOfLife

[![Actions Status](https://github.com/adrianomota/game_of_life/workflows/CI/badge.svg)](https://github.com/{adrianomota/game_of_life/CI)

O jogo da vida de Conway é um sistema de automação celular usado para
exemplificar como a interação entre entidades influência na sua progressão.

O jogo é uma implementado como um mapa/mundo bi-dimensional onde cada célula
ocupa um espaço no plano cartesiano e se encontra em estado ativo ou inativo.

!{RODO: Imagem()}

## Running

Cada "jogo" pode ser iniciado rodando `GameOfLife.game.new(options)`

## Instalation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `game_of_life` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:game_of_life, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/game_of_life](https://hexdocs.pm/game_of_life).
