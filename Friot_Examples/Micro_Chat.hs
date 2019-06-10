import Package.MicroBit
     
type Model = [String] -- LED, PIN

init :: Model
init =  []


data Msg = Send | Receive String

update :: Msg -> Model -> Model
update msg model = 
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