import Package.MicroBit
import Package.Primitives

main :: IO()
main = reactIoT initial update view 

type Model = (Int, [String] )

initial :: Model
initial =  (1,
    [". . . . .",
    ". . . . . ",
    ". . . . . ",
    ". . . . . ",
    ". . . . . "])

data Msg = PickRandom Int

update :: Model -> Msg -> Model
update _ msg = 
    case msg of 
        PickRandom num -> 
            if num == 0 then (0,paper)
            else if num == 1 then (1,rock)
            else (2,scissors)
                   


view :: Model -> MicroBit Msg
view model = 
    bit [][
        input [showLeds $ (snd model)] [onShake $ PickRandom $ randomRange (0,2)]
    ]