import qualified Data.List as D
import Data.Time.Clock.POSIX (getPOSIXTime)
import System.Random

chsort :: (Show a, Ord a) => [a] -> [a]
chsort a
    | not swapped_normal = a
    | not swapped_reverse = a1
    | otherwise = chsort $ reverse a2
    where (swapped_normal, a1) = bubble (<) a False
          (swapped_reverse, a2) = bubble (>) (reverse a) False

bubble :: (Ord a) => (a -> a -> Bool) -> [a] -> Bool -> (Bool, [a])
bubble op (x1:x2:xs) f
    | op x2 x1 = (b1, x2:xs1)
    | otherwise = (b2, x1:xs2)
    where (b1, xs1) = bubble op (x1:xs) True
          (b2, xs2) = bubble op (x2:xs) f
bubble op (x) f = (f, x)

main = do
        putStrLn "------------------"
        putStrLn "Cocktail shaker sort test"
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
        let sorted = cocktailSort a
        putStrLn $ "Sorted " ++ (show . length) sorted ++ " items"
        t2 <- ms
        putStrLn $ "Sorted in " ++ show (t2 - t1)
        putStrLn $ "Validation: " ++
            if (sorted == D.sort a) then "SUCCESS" else "FAIL"
