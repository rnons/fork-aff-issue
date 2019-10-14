## Dev

```
spago build
spago run
```

## The code

```purescript
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
```

## The output

Without `Aff.delay`, I get

```
'hanlder start'
'fork start'
'fork running\n'
'hanlder finish'
```

With `Aff.delay`, I get

```
'hanlder start'
'hanlder finish'
'fork start'
'fork running\n'
```

This is the desired behavior, however, not sure why `Aff.delay 0` is needed.
