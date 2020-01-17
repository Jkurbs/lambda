

import Foundation

// Choices of flavors

struct Flavor {
    let name: String
    let rating: Double
}

// Available sizes

enum Size: Double {
    case small = 3.99
    case medium = 5.99
    case large = 7.99
}



struct Cone {
    let flavor: Flavor
    let topping: String?
    let size: Size
    
    func eat() {
        print("\(flavor.name) Mmm! I love !")
    }
}

class IceCreamShop {
    
    var flavors: [Flavor]
    var sizes: [Size]
    var toppings: [String]
    var totalSales = 0.0
    
    init(flavors: [Flavor], sizes: [Size], toppings: [String]) {
        self.flavors = flavors
        self.sizes = sizes
        self.toppings = toppings
    }
    
    func listTopFlavors()  {
        let topFlavors = flavors.filter({$0.rating > 4})
        var flavorNames = [String]()
        if topFlavors.isEmpty {
               print("Our top flavors are not available for the moment.")
        } else {
            for flavor in topFlavors {
                flavorNames.append(flavor.name)
            }
            
            // List top flavors/flavor
            print("Our top " + (topFlavors.count == 1  ? "flavor is \(flavorNames.joined())" : "flavors are \(flavorNames.joined(separator: " and "))"))
        }
    }
    
    func orderCone(cone: Cone) -> Cone? {
        let cone = Cone(flavor: cone.flavor, topping: cone.topping, size: cone.size)
        let price = cone.size.rawValue
        let priceString = formatPriceCurrency(price: price)
        var orderString = ""
        
        let coneFlavorName = cone.flavor.name
        
        // Check if flavor exist if the menu.
        if flavors.contains(where: { $0.name == coneFlavorName }) {
            // If flavor exist, allow order
             if let topping = cone.topping {
                orderString = "Your \(coneFlavorName) ice cream with \(topping) is \(priceString)"
               } else {
                orderString = "Your \(coneFlavorName) ice cream is \(priceString)"
               }
            // Charge customer
            totalSales += price
        } else {
            // If flavor doesn't exist, inform customer.
             print("The \(coneFlavorName) flavor is not available in the menu for the moment.")
            return nil
        }
        print(orderString)
        return cone
    }
}


// Format currency function
func formatPriceCurrency(price: Double) -> String {
    let formatter = NumberFormatter()
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .currency
    let priceString = formatter.string(from: NSNumber(value: price))!
    return priceString
}


// Create flavors
let cherry = Flavor(name: "Cherry", rating: 2.0)
let coconut = Flavor(name: "Coconut", rating: 5.0)
let mango = Flavor(name: "Mango", rating: 4.0)
let vanilla = Flavor(name: "Vanilla", rating: 6.0)

// Create unavailable flavor
let upcomingFlavor = Flavor(name: "Chocolate", rating: 0.0)

// Create sizes and toppings
let sizes = [Size.small, Size.medium, Size.large]
let toppings = ["Hot fudge", "Sprinkles" , "Caramel" , "Oreos"]


// Create Ice cream shop
let iceCreamShop = IceCreamShop(flavors: [cherry, coconut, mango, vanilla], sizes: sizes, toppings: toppings)

// List all flavors
iceCreamShop.listTopFlavors()


// Create orders
let order1 = iceCreamShop.orderCone(cone: Cone(flavor: cherry, topping: toppings.first, size: .large))

let order2 = iceCreamShop.orderCone(cone: Cone(flavor: coconut, topping: nil, size: .small))

let order3 = iceCreamShop.orderCone(cone: Cone(flavor: upcomingFlavor, topping: nil, size: .small))

// Call eat function
order1?.eat()

// Print total sales
let totalSales = formatPriceCurrency(price: iceCreamShop.totalSales)

print("The total sales is \(totalSales)")

