require 'timeout'
require "minitest/autorun"

class LightsOutTest < MiniTest::Test
  include Timeout

  CASES = {
    "000000000" => 0,
    "010111010" => 1,
    "110001101" => 3,
    "000000001" => 5,
    "100000101" => 8,
    "101010101" => 9
  }

  CASES.each do |board, moves|
    define_method "test_solution_to_#{board}" do
      timeout (ENV["TIMEOUT"] || 5).to_i do
        solution = `#{ENV["LANGUAGE_PATH"]}/lights_out #{board}`
        assert_equal "000\n000\n000", `./board.rb #{board} #{solution}`.strip
      end
    end

    define_method "test_length_of_solution_to_#{board}" do
      timeout (ENV["TIMEOUT"] || 5).to_i do
        solution = `#{ENV["LANGUAGE_PATH"]}/lights_out #{board}`.strip
        assert solution.length <= moves,
          "Solution to #{board} (#{solution}) longer than #{moves}"
      end
    end
  end
end
