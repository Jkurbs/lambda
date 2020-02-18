# Scatter and Gather Animations

Your project today will animate text and images. Your app will scatter the letters of the word "Lambda" by animating the letters to random locations.

After completing the lesson material and this project, you'll be able to animate a number of `UIView` and `CALayer` properties.

[Preview the scatter animation](https://youtu.be/w8zJVBPrmnY)

## Set up the project

Follow these steps to set up your project skeleton:

1. Create a new Single View iOS Xcode project 
2. In the "Main.storyboard", embed a view controller in a navigation controller (be sure to set the initial view controller arrow)

## Add a Bar Button to the Navigation Bar

These steps enable you to run your animation with a single tap:

1. Add a bar button item to your view controller's navigation bar (right side).
2. Name the button "Toggle"
3. Connect an `IBAction` to your view controller: `toggleButtonPressed(_:)`.
4. Create a `Bool` property variable called `isScattered` that you can toggle `true` and `false`. 

You'll animate your views to either scatter them (explore outwards) or gather them together (reset to default position) when the Toggle button is tapped. The boolean variable will help you know what *state* you're in (scattered or gathered).

## Create views

Build the UI elements you want to animate (either programmatically or in Interface Builder). 

1. You need six labels (one for each letter of Lambda) 
2. You need one image view for the Lambda logo. (Look for the logo file in this repo)

Create `IBOutlet`'s for these views in your view controller so they can be animated by your `toggleButtonPressed(_:)` method.

## Animate

Scatter Animation:

* Fade out your logo image view (the logo should disappear over the length of the animation)
* Move your letters to random locations (read the random Int API below)
* Assign them a random background color and text color
* Use a custom transform to rotate the views (`letter.transform = CGAffineTransform(rotationAngle: random_angle`)
* Incorporate as many other custom animations as you like
* Your animation should take between 2 and 4 seconds

Gather Animation

* Fade in your logo view (it should gradually reappear as the gather animation runs)
* Reset all the custom properties you previously assigned to the letters (they should appear as they did at the start of the app)
* Animate the letters back to their starting positions

## Stretch Goals

Here are some stretch goals to investigate:

* Add 3D transforms to your layers instead of a 2D rotation.
* Animate shadows onto and away from your views.
* Add keyframe sequences to perform multiple tasks when scattering your views.
* Chain together animations
* Add a `UIPanGestureRecognizer` to move around the Lambda logo

## References

Here are some helpful resources for your project:

* `UIView` reference (Xcode, [also this Apple Doc article](https://developer.apple.com/documentation/uikit/uiview). See the `Animations` section for a list of animatable properties.
* [`CALayer` animatable properties](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html)
* [Core animation](https://developer.apple.com/documentation/quartzcore)
* Affine Transforms in iOS:
    * see Xcode docs for `CGAffineTransform` and `CATransform3D`, [Quartz 2D](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_affine/dq_affine.html)
    * [Wolfram](http://mathworld.wolfram.com/AffineTransformation.html)
    * [Wikipedia](https://en.wikipedia.org/wiki/Affine_transformation)
    * [University of Texas](https://www.cs.utexas.edu/users/fussell/courses/cs384g-fall2011/lectures/lecture07-Affine.pdf)
* [Random numbers with Swift's `random(in:)` function for `Int`](https://developer.apple.com/documentation/swift/int/2995646-random)
	* You will want to cast the `Int` into a `CGFloat` to create `CGPoint` positions.
* [UIPanGestureRecognizer Reference](https://developer.apple.com/documentation/uikit/uipangesturerecognizer?changes=_4)
	* Read [Handling UIKit Gestures](https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_uikit_gestures/handling_pan_gestures)
