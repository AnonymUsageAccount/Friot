import Package.MicroBit
import Package.Primitives

main :: IO()
main = subscripIoT [temperature_control] 

device_control:: Int -> Event
device_control t =
    if t < 20 then ev "CloseBoth"
    else if 20 <= t  && t < 30
          then ev "Fan"
    else if 30 <= t && t< 40
          then ev "Alternate"
    else if 40 <= t && t< 50
          then ev "AC"
    else ev "OpenBoth"

temperature_control   :: Event
temperature_control  =
    do {
        device_control getTemp;
        temperature_control;
    }
    