import qualified Data.List as D
import Data.Time.Clock.POSIX (getPOSIXTime)
import System.Random

chsort :: (Show a, Ord a) => [a] -> [a]
chsort a = bounded_bubble a

bounded_bubble :: (Ord a) => [a] -> [a]
bounded_bubble a
    | not swapped_normal = a
    | not swapped_reverse = a1
    | otherwise = [hd] ++ (bounded_bubble b) ++ [lt]
    where (swapped_normal, a1) = bubble a False
          (swapped_reverse, a2) = reverse_bubble (take  (length a1 - 2) $ a1) (last . init $ a1) (last $ a1) [] False
          hd = head a2
          lt = last a2
          b = ((drop 1 . take (length a2 - 1)) a2)

bubble :: (Ord a) => [a] -> Bool -> (Bool, [a])
bubble (x1:x2:xs) f
    | x2 < x1 = (b1, x2:xs1)
    | otherwise = (b2, x1:xs2)
    where (b1, xs1) = bubble (x1:xs) True
          (b2, xs2) = bubble (x2:xs) f
bubble (x) f = (f, x)

reverse_bubble :: (Ord a) => [a] -> a -> a -> [a] -> Bool -> (Bool, [a])
reverse_bubble pre x1 x2 post f =
        if pre == [] then
                           if x1 > x2  then (True, x2:x1:post)
                                       else (f, x1:x2:post)
        else if x1 > x2 
                 then (reverse_bubble (init pre) (last pre)
                                        x2 (x1:post) True)
                 else (reverse_bubble (init pre) (last pre)
                                        x1 (x2:post) f)

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
        let sorted = chsort a
        putStrLn $ "Sorted " ++ (show . length) sorted ++ " items"
        t2 <- ms
        putStrLn $ "Sorted in " ++ show (t2 - t1)
        putStrLn $ "Validation: " ++
            if (sorted == D.sort a) then "SUCCESS" else "FAIL"
