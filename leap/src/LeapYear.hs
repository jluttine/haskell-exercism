module LeapYear (isLeapYear) where

isLeapYear :: Integral a => a -> Bool
isLeapYear year
  | divisibleBy 400 = True
  | divisibleBy 100 = False
  | divisibleBy 4 = True
  | otherwise = False
  where
    divisibleBy x = rem year x == 0
