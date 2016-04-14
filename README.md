# SwiftTimer, a modern approach to a Timing API
A Swift Wrapper for NSTimer that uses a closure instead of a selector for the firing action, for a more modern timer API.

## Usage

Use SwiftTimer for the most part like you would use NSTimer. The notable exception is that it takes a closure instead of a selector for the firing action, providing a more modern API, and freeing it to be used in otherwise “Pure Swift” code. All the other rules for NSTimer apply. Be sure to invalidate it when you’re done with it to avoid memory leaks and retain cycles.

Create a timer:

`self.timer = SwiftTimer(timeInterval: 0.01, userInfo: nil, repeats: true) {        // Do your stuff here        }`

Fire off the timer:

`self.timer?.fire()`

Invalidate The Timer:

`self.timer?.invalidate()`
`self.timer = nil`

Check to see if your timer is currently running:

`if self.timer?.running {...}`

## License:
SwiftTimer is free to use under the MIT License.
