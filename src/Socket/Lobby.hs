{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Socket.Lobby where

import Control.Monad (void)
import Control.Monad.Except
import Control.Monad.Logger (LoggingT, runStdoutLoggingT)
import Control.Monad.Reader
import Control.Monad.Reader (runReaderT)
import Data.ByteString.Char8 (pack, unpack)
import Data.Int (Int64)
import Data.List (unfoldr)
import Data.Map.Lazy (Map)
import qualified Data.Map.Lazy as M
import Data.Maybe
import Data.Maybe
import Data.Text (Text)
import Database.Redis (Redis, connect, runRedis, setex)
import qualified Database.Redis as Redis

import Database
import Schema
import Socket.Clients
import Socket.Types
import Types
  {-
addNewTableToLobby lobby table = do
    let newLobby = M.insert table lobby
    res <- runRedis $ multiExec $ do
        res1 <- set "lobby" (show newLobby)
        res2 <- set "c" "d"
        return (res1, res2, ...)


(check res, and then all r1, r2 ... for errors)

-}
