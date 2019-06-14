module Package.MicroBit where  
import Control.Concurrent
import Package.Primitives
----------------
type MicroBit msg = IO msg

--MicroBit Events  
--onClick : msg -> Attribute msg
onPressed :: msg -> MicroBit msg
onPressed msg = return msg

onPinPressed :: msg -> MicroBit msg
onPinPressed msg = return msg

onShake :: msg -> MicroBit msg
onShake msg = return msg

onReceivedString:: (String -> msg) -> MicroBit msg
onReceivedString fun = return $ fun "onReceivedString"

--MicroBit Grouping Content, 
--devices, [MicroBit ()] -> how to desplay, [MicroBit msg] -> how to return msg
--div : List (Attribute msg) -> List (Html msg) -> Html msg

bit :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
bit _ list1 = list1 !! (0)

leds :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
leds _ list1 = list1 !! (0)

buttonA :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
buttonA _ list1 = list1 !! (0)

buttonB :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
buttonB _ list1 = list1 !! (0)

buttonAB :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
buttonAB _ list1 = list1 !! (0)

pin0 :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
pin0 _ list1 = list1 !! (0)

pin1 :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
pin1 _ list1 = list1 !! (0)

pin2 :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
pin2 _ list1 = list1 !! (0)

radio :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
radio _ list1 = list1 !! (0)

input :: [MicroBit ()] -> [MicroBit msg] -> MicroBit msg
input _ list1 = list1 !! (0)

showLeds :: (Show m) => m -> MicroBit ()
showLeds pattern = print(pattern)

showNumber :: (Show m) => m -> MicroBit ()
showNumber pattern = print(pattern)

showPin :: (Show m) => m -> MicroBit ()
showPin pattern = print(pattern)

send :: (Show m) => m -> MicroBit ()
send pattern = print(pattern)

forever :: msg -> MicroBit ()
forever _ = print("forever")

onStart :: msg -> MicroBit ()
onStart _ = print("onStart")

radioSetGroup:: Int -> MicroBit ()
radioSetGroup group = print (show group)

------------

randomRange :: (Int, Int) -> Int
randomRange (start, end ) = 1

heart = 
    [". # . # .",
     "# # # # # ",
     "# # # # # ",
     ". # # # . ",
     ". . # . . "
    ]
smallHeart =
    [". . . . .",
     ". # . # . ",
     ". # # # . ",
     ". . # . . ",
     ". . . . . "
    ]
yes =
    [". . . . .",
     ". . . . # ",
     ". . . # . ",
     "# . # . . ",
     ". # . . . "
    ]
no =
    ["# . . . #",
     ". # . # . ",
     ". . # . . ",
     ". # . # . ",
     "# . . . # "
    ]
happy =
    [". . . . .",
     ". # . # . ",
     ". . . . . ",
     "# . . . # ",
     ". # # # . "
    ]

north =
    [". . # . .",
    ". # # # . ",
    "# . # . # ",
    ". . # . . ",
    ". . # . . "
    ]
northEast =
    [". . # # #",
    ". . . # # ",
    ". . # . # ",
    ". # . . . ",
    "# . . . . "
    ]
east =
    [". . # . .",
    ". . . # . ",
    "# # # # # ",
    ". . . # . ",
    ". . # . . "
    ]
southEast =
    ["# . . . .",
    ". # . . . ",
    ". . # . # ",
    ". . . # # ",
    ". . # # # "
    ]
south =
    [". . # . .",
    ". . # . . ",
    "# . # . # ",
    ". # # # . ",
    ". . # . . "
    ]
southWest =
    [". . . . #",
    ". . . # . ",
    "# . # . . ",
    "# # . . . ",
    "# # # . . "
    ]
west =
    [". . # . .",
    ". # . . . ",
    "# # # # # ",
    ". # . . . ",
    ". . # . . "
    ]
northWest =
    ["# # # . .",
    "# # . . . ",
    "# . # . . ",
    ". . . # . ",
    ". . . . # "
    ]

paper = 
    ["# # # . .",
    "# # . . . ",
    "# . # . . ",
    ". . . # . ",
    ". . . . # "
    ]
rock = 
    ["# # # . .",
    "# # . . . ",
    "# . # . . ",
    ". . . # . ",
    ". . . . # "
    ]
scissors = 
    ["# # # . .",
    "# # . . . ",
    "# . # . . ",
    ". . . # . ",
    ". . . . # "
    ]

