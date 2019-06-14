import Package.MicroBit
import Package.Primitives

main :: IO()
main = subscripIoT [door_control] 

motion_sensor:: Event
motion_sensor =
    if getMotion then ev "Active"
    else do {
       ev "Passive";
       motion_sensor;
    }

door_control:: Event
door_control =
    do {
        ev "Close";
        motion_sensor;
        ev "Open";
        ev "Delay";
        door_control ;
    }