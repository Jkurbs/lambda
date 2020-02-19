# Logo

The purpose of this project is for you to practice drawing with Core Graphics; if you are able to create a logo, you should feel fairly comfortable with drawing any custom views. As everything shown on the screen is a `UIView` or a subclass of it, you can override the way anything looks by drawing it yourself.

### Requirements

You are welcome to draw any logo you want. Given enough time, you can draw any logo. That said, a good one to start with is the Lambda Avatar that is a part of this repository as it it relatively simple.

If you want to find a different logo, [this page](https://dribbble.com/search?q=logo) on Dribbble has some good inspiration. 

We haven't gone over everything there is to know about Core Graphics drawing. That said, you have enough knowledge that learning something new (such as arcs, curves, etc.) shouldn't be too difficult. Big Nerd Ranch has a great [blog post](https://www.bignerdranch.com/blog/core-graphics-part-4-a-path-a-path/) that explains different ways to draw with helpful gifs to demonstrate what the code would look like. 

**NOTE:** try to draw your logo in such a way that it doesn't rely on exact numbers for positions, i.e. `        context.addLine(to: CGPoint(x: 93, y: 83.2))`. Instead try to do things proportionally so the drawing can scale no matter what the size of the view is. For example: `context.addLine(to: CGPoint(x: shieldRect.midX * 0.75, y: shieldRect.maxY))`.

1. Create a new Xcode project
2. Create a subclass of `UIView` called `LogoView`. In this class, override the `draw` method to draw your logo.
3. You can either create the view, add it as a subview, and constrain it programmatically, or drag a `UIView` onto the storyboard scene, constrain it, and set its class to `LogoView` there. 

### Go Further

- Draw a custom button by subclassing `UIButton`. Try to make something that wouldn't be normally possible without custom drawing or adding a pre-made asset.
- Find a more complex logo to draw. The more practice with drawing you get, the more comfortable you will be. Try including things that you didn't use before such as arcs, curves, bezier paths, etc.
