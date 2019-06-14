import Package.MicroBit
import Package.Primitives

main :: IO()
main = static2IoT initial view 
     
type Model = [String] -- LED, PIN

initial :: Model
initial =  
    ["SONG","YAHUI"]

view :: Model -> MicroBit ()
view model = 
    bit [
        leds [forever $ showLeds $ model!!0] [],
        leds [forever $ showLeds $ model!!1] []
    ]
    []