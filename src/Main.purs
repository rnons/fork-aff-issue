module Main where

import Prelude

import Debug.Trace (traceM)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff as Aff
import Effect.Class (liftEffect)
import Effect.Console (log)
import Node.Buffer as Buffer
import Node.ChildProcess as ChildProcess
import Node.Encoding (Encoding(..))

handler :: Aff Unit
handler = do
  traceM "hanlder start"
  void $ Aff.forkAff $ do
    -- output is differnt with / without Aff.delay
    -- Aff.delay $ Aff.Milliseconds 0.0
    traceM "fork start"
    buffer <- liftEffect $ ChildProcess.execSync
      "echo fork running"
      ChildProcess.defaultExecSyncOptions
    liftEffect $ Buffer.toString UTF8 buffer >>= \msg ->
      traceM msg
  traceM "hanlder finish"

app :: Aff Unit
app = do
  handler

main :: Effect Unit
main = do
  Aff.launchAff_ app
