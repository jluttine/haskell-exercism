module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = (mod' 400 == 0) || ((mod' 100 /= 0) && (mod' 4 == 0))
  where mod' = mod year
