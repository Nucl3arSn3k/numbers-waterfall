

-- Just divides,no side effects 
binaryfunct :: Int -> [Int]
binaryfunct 0 = [0]           -- base case: when input is 0
binaryfunct x = binaryfunct (x `div` 2) ++ [x `mod` 2]

-- IO function - interacts with the world
main :: IO ()
main = do
  let result = binaryfunct 10
  print result