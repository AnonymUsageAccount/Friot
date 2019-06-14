input.onButtonPressed(Button.A, function () {
    if (Math.randomBoolean()) {
        basic.showIcon(IconNames.Heart)
    } else {
        basic.showIcon(IconNames.SmallSquare)
    }
})