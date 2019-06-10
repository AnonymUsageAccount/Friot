import Package.MicroBit
     
type Model = [String] -- LED, PIN

init :: Model
init =  
    ["SONG","YAHUI"]

view :: Model -> MicroBit ()
view model = 
    bit [
        leds [forever $ showLeds $ model!!0] [],
        leds [forever $ showLeds $ model!!1] []
    ]
    []