import UIKit


let baseUrl = URL(string: "https://itunes.apple.com/search?")


var urlCoponemt = URLComponents(url: baseUrl!, resolvingAgainstBaseURL: true)

let termQueryItem = URLQueryItem(name: "term", value: "test")
urlCoponemt?.queryItems = [termQueryItem]

print(urlCoponemt?.url)
      
      
