import Package.MicroBit
import Package.Primitives

main :: IO()
main = reactIoT initial update view 

     
type Model = String -- LED, PIN

initial :: Model
initial =  "LOVE METER"

data Msg = PickRandom Int 

update :: Model -> Msg  -> Model
update _ msg  = 
    case msg of  
        PickRandom num -> show num


view :: Model -> MicroBit Msg
view model = 
    bit [
        leds [onStart $ showLeds model] []
    ][
        pin0 [showLeds model] [onPinPressed $ PickRandom $ randomRange (0,100)]
    ]



-- 








