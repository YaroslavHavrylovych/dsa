module CocktailShaker
( sort 
) where

sort :: (Show a, Ord a) => [a] -> [a]
sort a
    | not swapped_normal = a
    | not swapped_reverse = reverse a1
    | otherwise = sort $ a2
    where (swapped_normal, a1) = passAndReverse (<) [] a False
          (swapped_reverse, a2) = passAndReverse (>) [] a1 False

passAndReverse :: (Ord a) => (a -> a -> Bool) -> [a] -> [a] -> Bool
    -> (Bool, [a])
passAndReverse op back (x1:x2:xs) f
    | op x2 x1 = passAndReverse op (x2:back) (x1:xs) True
    | otherwise = passAndReverse op (x1:back) (x2:xs) f
passAndReverse op back [x] f = (f, x:back)
passAndReverse op back [] f = (f, back)
