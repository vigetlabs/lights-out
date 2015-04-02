Lights Out
==========

This programming challenge is based on a game from my childhood called *Lights Out*. From [Wikipedia][wiki]:

> The game consists of a 5 by 5 grid of lights. When the game starts, a random number or a stored pattern of these lights is switched on. Pressing any of the lights will toggle it and the adjacent lights. The goal of the puzzle is to switch all the lights off, preferably in as few button presses as possible.

For example:

<img src="http://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/LightsOutIllustration.svg/1460px-LightsOutIllustration.svg.png" />

We'll be using a 3x3 grid instead of 5x5. I've created a program in the project's root, `board.rb`. It takes two arguments:

1. An initial board state, expressed as nine ones (for on) and zeroes (for off). The first three characters represent the top row, the middle three the middle row, and the last three the last row. So for example, a board state of `010101011` would represent the following state:

        010
        101
        011

2. A optional series of button presses, expressed as digits 1-9, where 1 corresponds to the top left, 3 to the top right, 9 to the bottom right (like a phone).

So calls to `board.rb` will look something like this:

    > ./board.rb 010111010
    010
    111
    010
    > ./board.rb 010111010 7
    010
    011
    100
    > ./board.rb 010111010 73
    001
    010
    100
    > ./board.rb 010111010 5
    000
    000
    000

**The challenge** is to create a program in your language or languages of choice called `lights_out` that takes an initial board state and returns an efficient series of moves to turn all the lights off. For example:

    > ./lights_out 0000000000
    
    > ./lights_out 010111010
    5
    > ./lights_out 110001101
    179

To start:

1. Create a directory based on the name of your implementation language (e.g. `languages/C`)
2. Create a simple `Rakefile` that has, at a minimum, a `build` task within your language's namespace (e.g. `C:build`).  You should check the environment and fail fast if dependencies aren't met.
3. Create your implementation and run `rake` from the project root.

### Example Rakefile

```ruby
namespace :C do
  task :check do
    `which cc`
    raise "Please ensure that you have a valid C compiler" unless $?.success?
  end

  task :build => :check do
    path = File.dirname(__FILE__)
    `cd #{path}; make lights_out`
  end
end
```

[wiki]: http://en.wikipedia.org/wiki/Lights_Out_%28game%29
