# Game of Life

From the [wikipedia page][3]:

> "The Game of Life, also known simply as Life, is a cellular automaton devised by
> the British mathematician John Horton Conway in 1970. It is a zero-player
> game, meaning that its evolution is determined by its initial state,
> requiring no further input. One interacts with the Game of Life by creating an
> initial configuration and observing how it evolves. It is Turing complete and
> can simulate a universal constructor or any other Turing machine."

Se the [rules page][4] for more information.

## Setup

we are using `rbenv` for ruby versioning

```shell
brew install rbenv
```

make sure to install the correct `.ruby-version`

```shell
rbenv install <ruby_version>
```

we are using [bundler][1] for gems

```shell
gem install bundler
```

## Testing

we are using [rspec][2] for testing.

```shell
rspec
```

## Use This Ruby Gem

This repo has been published as a [Ruby Gem][5].

### How to Use:

This repo features the algorithm for Game of Life. The main way to use this is to call:

```
GameOfLife.tick(universe)
```

The `.tick(universe)` expects `universe` to be multiple arrays of `1`'s and `0`'s. For our purposes, `1` indicates the cell is `ALIVE` and `0` indicates the cell is `DEAD`.

The method `.tick(universe)` will give you the next iteration. You can call `tick` as many times as you like.

Note: See the test suite for example universes used for `.tick(universe)`.

[1]: https://bundler.io/
[2]: http://rspec.info/
[3]: https://en.wikipedia.org/wiki/Conway's_Game_of_Life
[4]: rules.md
[5]: https://rubygems.org/gems/tk_game_of_life
