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
aliquotSum = sum . factors

factors :: Integral a => a -> [a]
factors x = filter isDivisibleBy [1..(x-1)]
  where isDivisibleBy y = x `rem` y == 0
