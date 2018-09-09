module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Integral a => a -> Maybe Classification
classify x
  | x < 1     = Nothing
  | s == x    = Just Perfect
  | s < x     = Just Deficient
  | otherwise = Just Abundant
  where
    s = aliquotSum x

aliquotSum :: Integral a => a -> a
aliquotSum n = sum $ map sumOfSmallAndLargeFactor smallFactors
  where
    smallFactors = filter isDivisibleBy [1..q]
    q = floor (sqrt (fromIntegral n))
    isDivisibleBy y = n `rem` y == 0
    sumOfSmallAndLargeFactor x
      | x == 1 && y == 1 = 0
      | x == 1           = 1
      | x == y           = x
      | otherwise        = x + y
      where
        y = n `div` x
