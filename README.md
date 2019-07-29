# CHITouchySuperButton
`CHITouchySuperButton` is a drop-in UIButton subclass that allows you to create and customize a highly interactive button in just a few lines of code. This class is compatible with the [UIView animatable properties](https://developer.apple.com/documentation/uikit/uiview): `transform`, `alpha`, `center`, `frame`, `bounds`, and `backgroundColor`. This class is widely used in all SongShift apps to make it feel a lot more interactive. 
This package is only compatible with iOS apps and targets iOS 10+.

|  Background Color                                                                             | Transform                                                                                   |
|-------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| ![](https://raw.githubusercontent.com/SongShift/CHITouchySuperButton/master/Assets/colorchange.gif) | ![](https://raw.githubusercontent.com/SongShift/CHITouchySuperButton/master/Assets/transform.gif)| 

## Installation
To install `CHITouchySuperButton`, you must either manually add [the source files](https://github.com/SongShift/CHITouchySuperButton/tree/master/Sources/CHITouchySuperButton) or use Swift Package Manager. To install with Swift Package Manager, follow these instructions from [Apple's official documentation](https://developer.apple.com/documentation/swift_packages/creating_a_swift_package_with_xcode).

1.  Open your app’s project settings, select your app target, and navigate to its General pane.
2.  Click the + button in the “Frameworks, Libraries, and Embedded Content” section and select the local package’s library to link it into your app target.
3. Add this package by clicking "Add Other", followed by "Add Package Dependency", and then paste the packages GitHub URL. 
## Usage
The usage of `CHITouchySuperButton` is quite simple. Start by importing the module:
```swift
import CHITouchySuperButton
```
Then, create an instance of `CHITouchySuperButton` like you would with a standard `UIButton`. This can be done with interface builder, or  programmatically:
```swift
let button = CHITouchySuperButton(frame: .zero)
// add a target for .touchUpInside just like a normal UIButton
button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
button.backgroundColor = UIColor.systemBlue
button.layer.masksToBounds = true
button.layer.cornerRadius = 13
button.setTitle("Touchy Super Button", for: .normal)
button.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(button)

view.addConstraints([
    button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
    button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    button.heightAnchor.constraint(equalToConstant: 65)
])
```
Now, to tell `CHITouchySuperButton` how you want it to look when pressed down and released, you implement two [`TouchBlock`](https://github.com/SongShift/CHITouchySuperButton/blob/master/Sources/CHITouchySuperButton/CHITouchySuperButton.swift#L13)'s:
```swift
// tell CHITouchySuperButton what to do when pressed down
button.buttonPressed = { button in
    // modify transform, alpha, center, frame, bounds, or backgroundColor
    button?.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
}

// tell CHITouchySuperButton what to do when released
button.buttonReleased = { button in
    // do NOT put your actions here, just your animations. use addTarget to add an action.
    button?.transform = .identity
}
```
That's it! This above code will produce the "Transform" effect that is at the top of this README.

By default, the touchy button will produce haptic feedback when released. To disable this, simply set `hapticFeedbackEnabled` to false on your `CHITouchySuperButton`. 
## License
Open sourced under the [MIT license](https://github.com/SongShift/CHITouchySuperButton/blob/master/LICENSE).
```
MIT License

Copyright (c) 2018-2019 SongShift, LLC.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
