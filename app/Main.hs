module Main where


convert :: Int -> [Int]
convert 0 = []
convert x = convert (x `div` 2) ++ [x `mod` 2]



main :: IO ()
main = putStrLn "Hello, Haskell!"
