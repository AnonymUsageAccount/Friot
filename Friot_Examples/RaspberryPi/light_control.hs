import Package.MicroBit
import Package.Primitives

main :: IO()
main = subscripIoT [light_control] 

until_ready:: IO ()
until_ready =
    if getMotion then ev "Ready"
    else do {ev "Wait";
         until_ready;}
  
delay ::Int -> IO ()
delay t =
    if t == 0 then ev "LightUp"
    else do {ev "Tick";
        delay (t - 1);}

light_control :: Int -> IO ()
light_control t =
    do{
       until_ready ;
       delay t;
       light_control t;
       print 1
    }