-- Additive cypher

import System.Environment
import Text.Read

printUsage :: IO ()
printUsage = putStrLn "Usage: additive -s <shift>"

processArgs :: [String] -> IO ()
processArgs ("-s":s:xs) =
    case readMaybe s :: Maybe Int of
        Just i -> putStrLn ("Shift is " ++ show i)
        Nothing -> printUsage
processArgs _ = printUsage

main = getArgs >>= processArgs
