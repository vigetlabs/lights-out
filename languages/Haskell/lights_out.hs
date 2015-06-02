import Data.Bits(xor)
import Data.Char(intToDigit, digitToInt)
import Data.List(subsequences, find)
import System.Environment(getArgs)
import Text.Printf(printf)

(|>) :: a -> (a -> b) -> b
(|>) = flip ($)

-- | Convert a string representing a binary number to its integer value
binToDec :: [Char] -> Int
binToDec = foldl (\acc x -> acc * 2 + digitToInt x) 0

-- | Pre-calculated bitmasks of the effects of each of the nine moves
masks :: [Int]
masks =  [0, 416, 464, 200, 308, 186, 89, 38, 23, 11]

-- | Apply a series of moves to a board
applyMoves :: Int -> [Int] -> Int
applyMoves board moves = map (masks !!) moves |> foldr xor board

-- | Is the given series of moves a valid solution?
validSolution :: Int -> [Int] -> Bool
validSolution board moves = applyMoves board moves == 0

-- | Given a board, return the series of moves to solve it
lightsOut :: Int -> [Int]
lightsOut board = case find (validSolution board) (subsequences [1..9]) of
  Just path -> path
  Nothing   -> board |> printf "Error solving board: %09b" |> error

main :: IO ()
main = do
  args <- getArgs
  args |> head |> binToDec |> lightsOut |> map intToDigit |> putStr
