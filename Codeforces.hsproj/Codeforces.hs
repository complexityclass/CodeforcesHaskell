module Codeforces where
  
import Crypto.Hash.SHA1
import qualified
       Data.ByteString.Char8  as BS
import Data.Char
import Data.List
import Numeric
import System.Environment
import System.Exit
import System.IO

-- Utils for test problems solutions in haskell for mac
-- before submit change problemRead with getLine

bail msg
  = do
    { hPutStrLn stderr msg
    ; exitFailure
    }
    
lonelyFileOption = "expected file name after '--file'"
tooManyArguments = "too many arguments"

problemRead :: IO (String)
problemRead = do
    { args <- getArgs
    ; input <- case args of
        []                -> do 
                             { putStr "Enter text to hash: "
                             ; hFlush stdout
                             ; BS.getLine
                             }
        ["--file"]        -> bail lonelyFileOption
        ["--file", fname] -> BS.readFile $ "ProblemInputs/" ++ fname
        [str]             -> return $ BS.pack str
        _                 -> bail tooManyArguments
    ; let inputString = BS.unpack input
    ; return inputString }