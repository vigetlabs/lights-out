require "minitest/autorun"

class LightsOutTest < MiniTest::Test
  CASES = {
    "000000000" => 0,
    "010111010" => 1,
    "110001101" => 3
  }

  CASES.each do |board, moves|
    define_method "test_solution_to_#{board}" do
      solution = `#{ENV["LANGUAGE_PATH"]}/lights_out #{board}`
      assert_equal "000\n000\n000", `./runner.rb #{board} #{solution}`.strip
    end

    define_method "test_length_of_solution_to_#{board}" do
      solution = `#{ENV["LANGUAGE_PATH"]}/lights_out #{board}`.strip
      assert solution.length <= moves, "Solution to #{board} (#{solution}) longer than #{moves}"
    end
  end
end
