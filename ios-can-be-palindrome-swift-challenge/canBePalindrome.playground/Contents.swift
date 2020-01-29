import Foundation

func canBePalindrome(_ string: String) -> Bool {
    // Reversing the text order
    // Compare it to the original text
    // Returning the Boolean result
    return String(string.reversed()) == string
}


// Test Cases
canBePalindrome("tacocat")  // should return true
canBePalindrome("daily")    // should return false
canBePalindrome("a")        // should return true
canBePalindrome("aa")       // should return true
canBePalindrome("hannah")   // should return true
canBePalindrome("abc")      // should return false
