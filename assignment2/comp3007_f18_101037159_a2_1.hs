import Codec.BMP
import GHC.Word
import GHC.List as List
import Data.ByteString

-- For this code to work you will need to have installed the package "bmp-1.2.6.3"
-- You can do this using the cabal package manager (as demonstrated in class)
-- or you can follow a procedure similar to the one detailed below:
--
-- 1. Download bmp-1.2.6.3.tar.gz from http://hackage.haskell.org/package/bmp
-- 2. Extract the folder bmp-1.2.6.3
-- 3. Open a terminal (with administrator rights) and do the following:
--    a. cd into bmp-1.2.6.3
--    b. runhaskell Setup configure
--    c. runhaskell Setup build
--    d. runhaskell Setup install

loadBitmapIntoIt :: FilePath -> IO ([(Int, Int, Int)], Int, Int)
loadBitmapIntoIt filename = do
  (Right bmp) <- readBMP filename
  return ((parseIntoRGBVals (convertToIntList (unpack (unpackBMPToRGBA32 bmp)))), (fst (bmpDimensions bmp)), (snd (bmpDimensions bmp)))

convertToIntList :: [Word8] -> [Int]
convertToIntList [] = []
convertToIntList (h:t) = (fromIntegral (toInteger h)) : (convertToIntList t)

parseIntoRGBVals :: [Int] -> [(Int, Int, Int)]
parseIntoRGBVals [] = []
parseIntoRGBVals (h:i:j:_:t) = (h,i,j) : (parseIntoRGBVals t)

-- if you haven't written showAsASCIIArt' yet, then comment out the function below

showAsASCIIArt :: [[(Int, Int, Int)]] -> IO ()
showAsASCIIArt pixels = Prelude.putStr (unlines (showAsASCIIArt' pixels) )


-- convertToList :: ([(Int, Int, Int)], Int, Int) -> [[(Int, Int, Int)]]
-- convertToList is the function I have written to address requirement (a)

convertToList :: ([(Int, Int, Int)], Int, Int) -> [[(Int, Int, Int)]]
convertToList (_, _, 0) = []
convertToList (l, w, h) = convertToList (List.drop w l , w, h - 1) ++ [List.take w l]  


-- cleanQRList :: [[(Int, Int, Int)]]-> [[(Int, Int, Int)]]
-- cleanQRList is the function I have written to address requirement (b)

-- is a helper finction thate takes one list and chnages the rgb values to black or white
cleanQRRow :: [(Int, Int, Int)] -> [(Int, Int, Int)]
cleanQRRow [] = []
cleanQRRow ((0, 0, 0) : l) = (0, 0, 0) : cleanQRRow l
cleanQRRow ((_) : l) = (255, 255, 255) : cleanQRRow l

cleanQRList :: [[(Int, Int, Int)]]-> [[(Int, Int, Int)]]
cleanQRList [] = []
cleanQRList (x: xs) = cleanQRRow x : cleanQRList xs


-- showAsASCIIArt' :: [[(Int, Int, Int)]] -> [[Char]]
-- showAsASCIIArt is the function I have written to address requirement (c)

-- showAsASCIIArtRow is a helper function that converts a row into ascii
showASCIIArtRow :: [(Int, Int, Int)] -> [Char]
showASCIIArtRow [] = []
showASCIIArtRow ((0, 0, 0) : xs) = '▓' : showASCIIArtRow xs
showASCIIArtRow ((255, 255, 255) : xs) = '░' : showASCIIArtRow xs

showAsASCIIArt' :: [[(Int, Int, Int)]] -> [[Char]]
showAsASCIIArt' [] = []
showAsASCIIArt' (x:xs) = showASCIIArtRow x : showAsASCIIArt' xs
