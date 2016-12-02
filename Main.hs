{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Main where

import           Data.Proxy
import qualified Network.Wai.Handler.Warp as W
import           Servant.API
import           Servant.Server

---

-- | Our API as a type.
type API = Get '[PlainText] String

api :: Proxy API
api = Proxy

-- | Handler functions (only one).
server :: Server API
server = pure "Hello, Docker!"

-- | "Serve this api via these handlers."
app :: Application
app = serve api server

main :: IO ()
main = W.run 8081 app
