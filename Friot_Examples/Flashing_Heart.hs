import Package.MicroBit
import Package.Basic

     
type Model = [String]

view :: Model -> MicroBit ()
view model = 
        forever $ showLeds heart
