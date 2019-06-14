import Package.MicroBit
import Package.Primitives

main :: IO()
main = reactIoT initial update view 
     
type Model = [String] -- LED, PIN

initial :: Model
initial =  []


data Msg = Send | Receive String

update :: Model -> Msg ->  Model
update model msg  = 
    case msg of 
        Send -> ["song"]
        Receive str -> [str]


view :: Model -> MicroBit Msg
view model = 
    bit [
        radioSetGroup 1
    ]
    [
        buttonA [send $ model] [onPressed Send],
        radio [showLeds $ model] [onReceivedString $ Receive ]
    ]