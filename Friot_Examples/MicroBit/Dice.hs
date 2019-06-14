import Package.MicroBit
import Package.Primitives

main :: IO()
main = reactIoT initial update view 

type Model = String

initial :: Model
initial = "0"


data Msg = PickRandom Int

update :: Model -> Msg  -> Model
update _ msg = 
    case msg of  
        PickRandom num -> show num


view :: Model -> MicroBit Msg  
view model = 
    bit [][
        input [showNumber model] [onShake $ PickRandom $ randomRange (0,10)]
    ]



