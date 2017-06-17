{- Basic additive cypher
   To do:
   - support negative shift
-}

import System.Environment
import Text.Read

printUsage :: IO ()
printUsage = putStrLn "Usage: additive -s <shift>"

shift :: Int -> String -> String
shift a = unlines . map (\line -> show a ++ ": " ++ line) . lines

handleArgs :: [String] -> IO ()
handleArgs ("-s":s:xs) =
    case readMaybe s :: Maybe Int of
        Just i -> interact (shift i)
        Nothing -> printUsage
handleArgs _ = printUsage

main = getArgs >>= handleArgs
