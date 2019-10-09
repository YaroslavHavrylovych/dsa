module BubbleSort
( sort 
) where 

sort :: (Show a, Ord a) => [a] -> [a]
sort a = counted_bubble a 0 (length a - 1)

counted_bubble :: (Ord a) => [a] -> Int -> Int -> [a]
counted_bubble a i n
    | i == n = a
    | otherwise = counted_bubble (bubble a) (i+1) n

bubble :: (Ord a) => [a] -> [a]
bubble (x1:x2:xs)
    | x1 < x2 = x1:bubble(x2:xs)
    | otherwise = x2:bubble(x1:xs)
bubble (x) = (x)
