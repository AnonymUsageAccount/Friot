import Package.MicroBit
import Package.Basic
     
type Model = [String] 

init :: Model
init =  
    [". . . . .",
    ". . . . . ",
    ". . . . . ",
    ". . . . . ",
    ". . . . . "]

data Msg = ChangeA |  ChangeB | ChangeAB

update :: Model -> Msg  -> Model
update _ msg  = 
    case msg of  
        ChangeA -> heart
        ChangeB -> northEast
        ChangeAB -> yes

view :: Model -> MicroBit Msg
view model = 
    bit [][
        buttonA [showLeds $ model] [onPressed ChangeA],
        buttonB [showLeds $ model] [onPressed ChangeB],
        buttonAB [showLeds $ model] [onPressed ChangeAB]
    ]