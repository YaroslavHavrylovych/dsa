import qualified Data.List as D
import Data.Time.Clock.POSIX (getPOSIXTime)
import System.Random

sort :: (Show a, Ord a) => [a] -> [a]
sort a = csort a 0 (length a) False

csort :: (Ord a) => [a] -> Int -> Int -> Bool -> [a]
csort a i gap f
    | gap == 1 && f = a
    | gap == 1 = csort na 0 1 (not nf)
    | otherwise = csort na 0 ngap False
    where (nf, na) = (csort_gap a 0 ngap False)
          ngap = max (floor (realToFrac gap * 0.7)) 1

csort_gap :: (Ord a) => [a] -> Int -> Int -> Bool -> (Bool, [a])
csort_gap a i gap f
    | i + gap >= length a = (f, a)
    | otherwise = if (a !! i) > (a !! ni) then csort_gap res ni gap True
                                    else csort_gap a ni gap f
    where ni = i + gap
          pre = take i a
          mid = (take (gap-1) . drop (i+1)) a
          post = drop (i+gap+1) a
          res = pre ++ [a !! ni] ++ mid ++ [a !! i] ++ post

main = do
        putStrLn "------------------"
        putStrLn "Comb sort test"
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
        --putStrLn "big random"
        --testArraySort (take 10000 $ randomRs(1,100) (mkStdGen 14) :: [Int])
        --putStrLn "big sorted"
        --testArraySort [x | x <- [1..10000]]
        --putStrLn "big sorted in reverse order"
        --testArraySort [x | x <- [10000,9999..1]]

testArraySort :: (Show a, Ord a) => [a] -> IO()
testArraySort a = do
        let ms = round . (1000 *) <$> getPOSIXTime
        t1 <- ms
        let sorted = sort a
        putStrLn $ "Sorted " ++ (show . length) sorted ++ " items"
        t2 <- ms
        putStrLn $ "Sorted in " ++ show (t2 - t1)
        putStrLn $ "Validation: " ++
            if (sorted == D.sort a) then "SUCCESS" else "FAIL"
