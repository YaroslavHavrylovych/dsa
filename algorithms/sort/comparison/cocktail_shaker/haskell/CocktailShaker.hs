import qualified Data.List as D
import Data.Time.Clock.POSIX (getPOSIXTime)
import System.Random

chsort :: (Show a, Ord a) => [a] -> [a]
chsort a
    | not swapped_normal = a
    | not swapped_reverse = reverse a1
    | otherwise = chsort $ a2
    where (swapped_normal, a1) = passAndReverse (<) [] a False
          (swapped_reverse, a2) = passAndReverse (>) [] a1 False

passAndReverse :: (Ord a) => (a -> a -> Bool) -> [a] -> [a] -> Bool
    -> (Bool, [a])
passAndReverse op back (x1:x2:xs) f
    | op x2 x1 = passAndReverse op (x2:back) (x1:xs) True
    | otherwise = passAndReverse op (x1:back) (x2:xs) f
passAndReverse op back [x] f = (f, x:back)
passAndReverse op back [] f = (f, back)

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
        let sorted = chsort a
        putStrLn $ "Sorted " ++ (show . length) sorted ++ " items"
        t2 <- ms
        putStrLn $ "Sorted in " ++ show (t2 - t1)
        putStrLn $ "Validation: " ++
            if (sorted == D.sort a) then "SUCCESS" else "FAIL"
