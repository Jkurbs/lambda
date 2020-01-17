![](https://tk-assets.lambdaschool.com/99e9f433-68fb-4853-85ae-85bb8af25524_lama-roscu-Wpg3Qm0zaGk-unsplash.jpg)

# Sprint Challenge: Swift Fundamentals - Ice Cream Shop

You've been chosen to begin working on an app for Lambda School's first ice cream shop . The app will need to be able to create an ice cream shop model object, give it a menu of flavors, toppings and ice cream cone sizes and let people order from the menu.

This challenge allows you to practice the concepts and techniques learned over the past week and apply them in a concrete project. You will need to use your knowledge of classes, structs, enums and other Swift language features to accomplish these goals.

## Instructions

**Read these instructions carefully. Understand exactly what is expected _before_ starting to code.**

This is an individual assessment. All work must be your own. Your challenge score is a measure of your ability to work independently using the material covered through this sprint. You need to demonstrate proficiency in the concepts and objectives introduced and practiced in preceding days.

You are not allowed to collaborate during the Sprint Challenge. However, you are encouraged to follow the twenty-minute rule and seek support from your TLs if needed. Your TLs will be more vague than they normally would be. They can guide you a bit, but this is a time where work reflects your proficiency in iOS and your command of the concepts and techniques in this first unit, thus your help will be limited.

You have three hours to complete this challenge. Plan your time accordingly.

## Commits

Commit your code regularly and meaningfully. This helps both you (in case you ever need to return to old code for any number of reasons) and your Team Lead.

## Project Set Up

Please fork this repository and clone the fork to your machine to begin work. This repository contains a playground that you should write your code in. 

## Minimum Viable Product

In your solution, it is essential that you follow best practices and produce clean and professional results. Schedule time to review, refine, and assess your work and perform basic professional polishing including spell-checking and grammar-checking on your code. It is better to submit a challenge that meets the minimum requirements than one that attempts too much and does not work in the end.

Follow these steps to complete the Sprint Challenge. Recognize that not every step necessary to complete this challenge will be listed below. It can be useful to mentally break a step down by its individual sentences, or even smaller than that.

1. Create a struct called `Flavor`. Add the following properties. Think about what type they should be:
    - `name`
    - `rating`

2. Create an enum called `Size`. 
    - Give it a case for small, medium, and large. 
    - Make the enum have `Double` raw values. The raw value should represent the size's price. For example, small might be 3.99.

3. Create a struct called `Cone`. 
    - Give the struct properties (constants) that hold a flavor, topping (as a `String`), and size.
    - Create a function called `eat`. It shouldn't have any arguments. It should print a string of text that includes the name of the cone's flavor. For example: "Mmm! I love <flavor here>!"
  
4. Create a class called `IceCreamShop`. 
    - An ice cream shop needs a menu, so create variables that hold the various flavors, sizes, and toppings you want to have in your shop.
    - Create a variable called `totalSales`. This will be used to keep track of how much money was made.
    
5. If a customer asks which flavors are available, we need to be ready to tell them. To accomplis this, do the following:
    - Create a function called `listTopFlavors`. 
    - This function doesn't need any arguments. 
    - In the function, build a string that lists out the names of each flavor in the shop's `flavors` array whose rating is over 4.0. For example, the string might say "Our top flavors are <flavors here>." **Hint:** You may want to loop through the array of flavors in order to access each one's name.
    - When the string has been created, print it.
    
6. Customers will need a way to order a cone. 
    - Create a function called `orderCone`. 
    - This should have arguments needed to initialize a `Cone`, such as a flavor, topping (if desired), and a size. 
    - This function should return an optional `Cone` object. We're going to have it be optional for later use.
    - In this function, create a constant that initializes a new `Cone` with the arguments passed into the function.
    - Add the price of the cone to the `totalSales` variable you made in the previous step.
    - Create a string that tells the price of the cone, along with its flavor and topping. **NOTE:** account for the potential lack of a topping on the `Cone` in that string by using optional binding (if-let). For example, the string could say "Your mint ice cream with chocolate chips is 3.99", or "Your vanilla ice cream is 5.99." Print the string.
    - Finally, return the cone you initialized. 

7. At the bottom of the playground, create a few `Flavor` constants, an array of sizes, and an array of toppings.
8. Use the constants you just made to initialize a new `IceCreamShop` constant.
9. Call the shop's `listTopFlavors` function and make sure it runs correctly.
10. Create a new `Cone` constant. Use the shop's `orderCone` function to assign the constant a `Cone` value.
11. Using that new `Cone` constant, call its `eat` function without unwrapping the constant.
12. Print the shop's `totalSales` and make sure that it has increased since you ordered a cone in step 10.

Validate your work through running your playground and ensure that your code operates as designed.

## Stretch Problems (Optional)

After finishing your required elements, you can push your work further. These goals may or may not be things you have learned in this module but they build on the material you just studied. Time allowing, stretch your limits and see if you can deliver on the following **optional** goals:

- Format the various strings to account for edge cases, such as if there are no flavors with a rating above 4.0, finishing the last flavor with "and". For example,"<flavor>, <flavor>, and <flavor>", instead of just "<flavor>, <flavor>, <flavor>"
- In the `orderCone` function, check to make sure the flavor that the person requested exists on the menu.
