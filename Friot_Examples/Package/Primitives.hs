module Package.Primitives where
    
reactIoT:: a -> (a -> b  -> a) -> (a -> c b) -> IO ()
reactIoT init update view = print 1

staticIoT::  (a -> c b) -> IO ()
staticIoT  view = print 1


static2IoT::a ->  (a -> c b) -> IO ()
static2IoT init view = print 1