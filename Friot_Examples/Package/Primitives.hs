module Package.Primitives where
    
-- REAVTIVE FRAMEWORK, CLINE SERVER COMMUNICATION
reactIoT:: a -> (a -> b  -> a) -> (a -> c b) -> IO ()
reactIoT init update view = print 1


-- STATIC CONTROL, NO COMMUNICATION
staticIoT::  (a -> c b) -> IO ()
staticIoT  view = print 2

static2IoT::a ->  (a -> c b) -> IO ()
static2IoT init view = print 3


-- REAVTIVE FRAMEWORK, CLINE SERVER COMMUNICATION AND SUBSCRIPTION 
subReactIoT:: [d] -> a -> (a -> b  -> a) -> (a -> c b) -> IO ()
subReactIoT sub init update view = print 4

-- SUBSCRIPTION FRAMEWORK,  
subscripIoT:: [d] ->  IO ()
subscripIoT sub = print 5

getMotion :: Bool
getMotion  = False

getTemp :: Int
getTemp = 1

type Event = IO ()

ev :: String -> Event 
ev inp = print 1


