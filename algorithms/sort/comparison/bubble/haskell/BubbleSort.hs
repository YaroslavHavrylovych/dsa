import qualified Data.List as D
import Data.Time.Clock.POSIX (getPOSIXTime)
import System.Random

bsort :: (Show a, Ord a) => [a] -> [a]
bsort a = counted_bubble a 0 (length a - 1)

counted_bubble :: (Ord a) => [a] -> Int -> Int -> [a]
counted_bubble a i n
    | i == n = a
    | otherwise = counted_bubble (bubble a) (i+1) n

bubble :: (Ord a) => [a] -> [a]
bubble (x1:x2:xs)
    | x1 < x2 = x1:bubble(x2:xs)
    | otherwise = x2:bubble(x1:xs)
bubble (x) = (x)

main = do
        putStrLn "------------------"
        putStrLn "Bubble sort test"
        putStrLn "small random"
        testArraySort (take 50 $ randomRs(1,100) (mkStdGen 11) :: [Int])
        putStrLn "small sorted"
        testArraySort [x | x <- [1..50]]
        putStrLn "small sorted in reverse order"
        testArraySort [x | x <- [50,49..1]]
        putStrLn "medium random"
        testArraySort (take 1000 $ randomRs(1,100) (mkStdGen 13) :: [Int])
        putStrLn "medium sorted"
        testArraySort [x | x <- [1..1000]]
        putStrLn "medium sorted in reverse order"
        testArraySort [x | x <- [1000,999..1]]
        putStrLn "big random"
        testArraySort (take 10000 $ randomRs(1,100) (mkStdGen 14) :: [Int])
        putStrLn "big sorted"
        testArraySort [x | x <- [1..10000]]
        putStrLn "big sorted in reverse order"
        testArraySort [x | x <- [10000,9999..1]]

testArraySort :: (Show a, Ord a) => [a] -> IO()
testArraySort a = do
        let ms = round . (1000 *) <$> getPOSIXTime
        t1 <- ms
        let sorted = bsort a
        putStrLn $ "Sorted " ++ (show . length) sorted ++ " items"
        t2 <- ms
        putStrLn $ "Sorted in " ++ show (t2 - t1)
        putStrLn $ "Validation: " ++
            if (sorted == D.sort a) then "SUCCESS" else "FAIL"
