import Data.Bits(xor)
import Data.Char(intToDigit, digitToInt)
import Data.List(subsequences, find)
import System.Environment(getArgs)
import Text.Printf(printf)

(|>) :: a -> (a -> b) -> b
(|>) = flip ($)

binToDec :: [Char] -> Int
binToDec = foldl (\acc x -> acc * 2 + digitToInt x) 0

applyMoves :: Int -> [Int] -> Int
applyMoves board moves = foldr xor board masks
  where masks = map ([0, 416, 464, 200, 308, 186, 89, 38, 23, 11] !!) moves

validSolution :: Int -> [Int] -> Bool
validSolution board moves = (applyMoves board moves) == 0

lightsOut :: Int -> [Int]
lightsOut board = case find (validSolution board) (subsequences [1..9]) of
  Just path -> path
  Nothing   -> board |> printf "Error solving board: %09b" |> error

main :: IO ()
main = do
  args <- getArgs
  args |> head |> binToDec |> lightsOut |> map intToDigit |> putStr
