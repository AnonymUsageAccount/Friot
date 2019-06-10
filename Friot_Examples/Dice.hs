import Package.MicroBit
import Package.Basic

     
type Model = String

init :: Model
init = "0"


data Msg = PickRandom Int

update :: Msg  -> Model
update msg  = 
    case msg of  
        PickRandom num -> show num


view :: Model -> MicroBit Msg
view model = 
    bit [][
        input [showNumber model] [onShake $ PickRandom $ randomRange (0,10)]
    ]