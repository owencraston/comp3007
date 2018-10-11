import Codec.BMP
import GHC.Word
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

-- showAsASCIIArt :: [[(Int, Int, Int)]] -> IO ()
-- showAsASCIIArt pixels = Prelude.putStr (unlines (showAsASCIIArt' pixels) )

