import Package.MicroBit
import Package.Primitives

main :: IO()
main = subscripIoT [surveillance] 

motion_sensor:: Event
motion_sensor =
    if getMotion then ev "Active"
    else do {
       ev "Passive";
       motion_sensor;
    }

camera_on :: Event
camera_on = ev "10Mins"

permission :: Int -> (Int->Int) -> Event
permission t f =
   if getMotion then ev "Legal"
   else if t == 0 then camera_on
   else
      do {
          ev "Tick";
          permission (f t) f
      }

surveillance   :: Int -> Event
surveillance t =
    do{
        motion_sensor;
        permission t (\x -> x - 1);
        ev "CameraOff";
        surveillance t;
    }
   