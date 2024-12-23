module Main where
import Brick

convert :: Int -> [Int]
convert 0 = []
convert x = convert (x `div` 2) ++ [x `mod` 2]

ui :: Widget()
ui = str "Hey"

main :: IO ()
main = simpleMain ui
