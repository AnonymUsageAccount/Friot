import Package.MicroBit
import Package.Primitives

main :: IO()
main = staticIoT  view 

     
type Model = [String]

view :: Model -> MicroBit ()
view model = 
        forever $ showLeds heart
