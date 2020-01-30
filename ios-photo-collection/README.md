# Photo Collection

A student that completes this project shows that they can:

- understand and explain what a collection view is along with common scenarios for its use
- implement UICollectionViewDataSource methods to populate a collection view from model data
- implement and customize basic layouts using UICollectionViewFlowLayout
- implement custom UICollectionViewCells
- implement UICollectionViewDelegate method to react to selecting a collection view cell 
- understand and explain the purpose of UserDefaults and the kind of information it should be used to store
- define keys for specific values stored in UserDefaults
- use UserDefaults to store and retrieve preferences

## Introduction

This application allows a user to add photos from their photo library to a collection of photos in a `UICollectionView`. It will also let the user select a theme and it will persist that preference between launches of the app using `UserDefaults`

Please look at the screen recording below to know what the finished project should look like:

![](https://user-images.githubusercontent.com/16965587/43599465-e822d442-9644-11e8-8dda-e2d939eb8e7d.gif)

## Instructions

Please fork and clone this repository. This repository does not have an Xcode starter project, so you will need to create one inside of the cloned repository folder before you begin. Remember to regularly commit and push your code to Github.

### Part 1 - Model Layer Set Up

#### Photo

1. Create a swift file called "Photo.swift". 
2. Create a struct `Photo` in it with the following properties:
    - An `imageData: Data` variable.
    - A `title: String` variable. 
3. Adopt the `Equatable Protocol.

#### PhotoController

1. Create a swift file called "PhotoController.swift".
2. Create a class `PhotoController`.
3. Add a `photos` varable of type `[Photo]`, and set its initial value to an empty array.
4. Add a "Create" method that initializes a new instance of `Photo` and appends it to the `photos` array.
5. Add an "Update" method that takes in `Photo`,`Data`, and `String` parameters. 

### Part 2 - ThemeHelper

You will now make a helper class that will contain functionality related to the user's theme preference and give access to that theme information throughout the application. It will use `UserDefaults` to save and load this preference. 

1. Create a "ThemeHelper.swift" file. Add a `ThemeHelper` class inside of it. 2. Create a string constant called `themePreferenceKey`. This will be used whenever you need to save the user's theme preference or get it from `UserDefaults`.
3. Create a function called `setThemePreferenceToDark()`. Using the `set` method of `UserDefaults` (remember that in order to access `set`, you have to use the `standard` property on `UserDefaults`), set the string "Dark" as the value, and the `themePreferenceKey` as the key.
4. Create another function that does the same thing, but with a different color. Call the function `setThemePreferenceToYourColorHere`.
5. Finally, create a computed property called `themePreference` of type `String?`. This should simply return the string value that you stored from either of the two methods you wrote above. Use the `UserDefaults` `string(forKey: ...)` method to get that value. The method should return an optional string because if the user's theme preference hasn't been saved, the value returned from `UserDefaults` will be `nil`.
6. In the initializer for this class (you will have to call it), check if the `themePreference` value is nil. If it is, then call one of the `setThemePreference` functions you just created. This will make it so the first time the user opens the app a preference will be set for them until they choose to change it. 

Keep in mind that the implementation of this class is not the absolute best. You haven't been introduced to a few concepts that would facilitate and keep this class a bit cleaner, especially if this were to be expanded into a full theme helper class for an actual application. Don't worry though, we'll get there!

### Part 3 - Storyboard Set Up

The layout of this application uses the master-detail pattern. It also includes a view controller that will allow the user to change the application's theme.

Delete the view controller scene that comes with the Main.storyboard.

#### CollectionViewController Scene

1. Add a `UICollectionViewController` scene. Embed it in a navigation controller and set the navigation controller as the initial view controller.
2. Create a Cocoa Touch subclass of `UICollectionViewController` called `PhotosCollectionViewController`. Set the collection view controller scene's class to it.
3. Resize the collection view cell however you want, then add a label and an image view to it.
4. Create a Cocoa Touch subclass of `UICollectionViewCell` called `PhotosCollectionViewCell`. Set the cell's class to it, then make outlets from the label and image view.
5. Add a bar button item in the left of the navigation bar and set its title to "Select Theme". Add another bar button item in the right of the navigation bar and set its "System Item" to "Add".

Consider changing the collection view's section insets in the Size Inspector so the cells aren't right at the edge of the screen. This is purely for aesthetic purposes.

#### PhotoDetailViewController Scene

1. Add a `UIViewController` scene and create a Cocoa Touch subclass of `UIViewController` called `PhotoDetailViewController`.
2. Create the following variables in this subclass:
    - `photoController: PhotoController?`
    - `photo: Photo?`
    - `themeHelper: ThemeHelper?`
3. Set the view controller scene's class to `PhotoDetailViewController`.
4. Add a `UIImageView`, a `UIButton`, and a `UITextField`. Change the button's title to "Add Photo"
5. Add a `UINavigationItem` then a `UIBarButtonItem` to the right of the navigation bar. Set its "System Item" to "Save".
6. Create outlets from the image view and text field.
7. Create an action from the "Add PHoto" button called `addPhoto`, and an action from the bar button item called `savePhoto`.
8. Create a "Show" segue from the "Add" bar button item in the collection view scene to this view controller. Give it an identifier.
9. Create another "Show" segue to this view controller from the collection view cell. Give it an identifier.

#### ThemeSelectionViewController Scene

1. Add another `UIViewController` scene and create a Cocoa Touch subclass of `UIViewController` called `ThemeSelectionViewController`.
2. Create a `themeHelper: ThemeHelper?` variable in this subclass.
3. Set the view controller scene's class to `ThemeSelectionViewController`.
4. Add a label that tells the user to select a theme that they would like to use.
5. Add two buttons. One should day "Dark" for the dark theme, and the other should say the other theme that you chose to make in the `ThemeHelper` such as "Blue".
6. Add an action from each button. Call them `selectDarkTheme` and `selectYourColorHereTheme`.
7. Create a "Present Modally" segue from the "Select Theme" bar button item in the collection view scene to this view controller. Give it an identifier.

### Part 4 - View Controller Implementation

#### PhotoCollectionViewCell

1. Create a `photo: Photo?` variable. 
2. Create an `updateViews()` function. You should be familiar with this function.
3. Add a `didSet` property observer to the `photo` variable. Call `updateViews` inside of it.

#### PhotoCollectionViewController

1. Create a constant called `photoController` and set its value to a new instance of `PhotoController`.
2. Create a constant called `themeHelper` and set its initial value to a new instance of `ThemeHelper`.
3. Fill in the `numberOfItemsInSection` There should be as many cells are there are photos in the `photoController`'s `photos` array. 
4. Fill in the `cellForItemAt` method. This should pass an instance of `Photo` to the custom cell. **Note:** You will need to cast the cell as `PhotoCollectionViewCell`.

Now, we're going to use the `ThemeHelper` class to let us know what theme the user has selected and make a function that will change the appearance of the view controller based on the theme. 

5. Create a function called `setTheme()`. This function should:
    - Get the current `themePreference` from the `themeHelper`. Make sure that it has a value, or return out of the function.
    - Based on the value, change the collection view's background color depending on whether the theme is dark or the other color you selected.

6. Implement the `prepareForSegue`. You should have three segues to handle.      
    - The segue from the cell should pass the `themeHelper`, `photoController`, and the `photo`.
    - The segue from the "Add" bar button item should pass the the `themeHelper` and the `photoController`.
    - The segue from the "Select Theme" bar button item should pass the `themeHelper`.

#### ThemeSelectionViewController

This view controller will allow the user to (re)select their desired theme. 

1. In the `selectDarkTheme` action, call the `themeHelper`'s `setThemePreferenceToDark` method. Then call `dismiss(animated: Bool, completion: ...)`. Set `animated` to `true` and `completion` to `nil`.
2. Do the same thing for the other action, but calling the other `setThemePreference` method in the `themeHelper`.

#### PhotoDetailViewController

1. Create a `setTheme` function. This should do the same thing as the `setTheme` method in your collection view controller, except that it should change the `PhotoDetailViewController` `view`'s background color to match the `themePreference` background color property. Call this function each time the view loads.
2. Create an `updateViews` function that takes the property values of the `photo` object (if it isn't `nil`) and sets them in the appropriate UI element. You will need to use the `UIImage(data: Data)` initializer to convert the `photo`'s `imageData` to a `UIImage`. You can then put that `UIImage` in the image view. Call this function each time the view loads.
3. The "Save" bar button item's action should either update the `photo` if it has a value, or create a new instance of `photo` using the methods in the `photoController`. "Pop" the view controller afterwards.
4. The `addImage` action should present a `UIImagePickerController` that allows the user to select an image to add to the `Photo` object. 

	- **Note:** Unless you use an unwind, a ***segue always presents a new view controller*** each time it is called.
    - **Note:** Make sure you request authorization to access the photo library, and add the "Privacy - Photo Library Usage Description" key-value pair to the info.plist.
    - **Note:** Your `PhotoDetailViewController` will need to adopt both the `UIImagePickerControllerDelegate` and `UINavigationControllerDelegate` protocols and implement the `didFinishPickingMediaWithInfo` method to get the image the user selects, then dismiss the image picker.

## Go Further

- Add persistence using `Codable`, `PropertyListEncoder`, `PropertyListDecoder`, and `FileManager` to save a plist of all the user's `Memory` objects.
- Experiment with the methods that `UICollectionViewDelegateFlowLayout` has to customize your collection view's layout.
