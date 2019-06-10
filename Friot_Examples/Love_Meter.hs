import Package.MicroBit
import Package.Basic

     
type Model = String -- LED, PIN

init :: Model
init =  "LOVE METER"

data Msg = PickRandom Int 

update :: Msg  -> Model
update msg  = 
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








