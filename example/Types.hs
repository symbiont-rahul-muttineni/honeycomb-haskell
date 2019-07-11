module Types where

import Honeycomb.Trace.Types
import Honeycomb.Types
import RIO
import RIO.Process

-- | Command line arguments
data Options = Options
    { optionsVerbose :: !Bool
    , optionsApiKey  :: !String
    }

data App = App
    { appLogFunc        :: !LogFunc
    , appProcessContext :: !ProcessContext
    , appOptions        :: !Options
    -- Add other app-specific configuration information here
    , appHoney          :: !Honey
    , appSpanContext    :: !(Maybe SpanContext)
    }

instance HasLogFunc App where
    logFuncL = lens appLogFunc (\x y -> x { appLogFunc = y })
instance HasProcessContext App where
    processContextL = lens appProcessContext (\x y -> x { appProcessContext = y })
instance HasHoney App where
    honeyL = lens appHoney (\x y -> x { appHoney = y })
instance HasSpanContext App where
    spanContextL = lens appSpanContext (\x y -> x { appSpanContext = y })
