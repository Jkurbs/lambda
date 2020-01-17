
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
            print("Our top " + (topFlavors.count == 1  ? "flavor is \(flavorNames.joined())" : "flavors are \(flavorNames.joined(separator: " and "))"))
        }
        
    }
    
    func orderCone(cone: Cone) -> Cone? {
        let cone = Cone(flavor: cone.flavor, topping: cone.topping, size: cone.size)
        let price = cone.size.rawValue
        var orderString = ""
        
        let coneFlavorName = cone.flavor.name
        
        // Check if flavor exist if the menu.
        if flavors.contains(where: { $0.name == coneFlavorName }) {
            // If flavor exist, allow order
             if let topping = cone.topping {
                orderString = "Your \(coneFlavorName) ice cream with \(topping) is \(price)"
               } else {
                orderString = "Your \(coneFlavorName) ice cream is \(price)"
               }
            // Charge customer
            totalSales += price
        } else {
            // If flavor doesn't exist, informe customer.
             print("The \(coneFlavorName) flavor is not available in the menu for the moment.")
            return nil
        }
        print(orderString)
        return cone
    }
}


let cherry = Flavor(name: "Cherry", rating: 2.0)
let coconut = Flavor(name: "Coconut", rating: 5.0)
let mango = Flavor(name: "Mango", rating: 4.0)
let vanilla = Flavor(name: "Vanilla", rating: 6.0)
let upcomingFlavor = Flavor(name: "Chocolate", rating: 0.0)

let sizes = [Size.small, Size.medium, Size.large]
let toppings = ["Hot fudge", "Sprinkles" , "Caramel" , "Oreos"]

let iceCreamShop = IceCreamShop(flavors: [cherry, coconut, mango, vanilla], sizes: sizes, toppings: toppings)

// List all flavors
iceCreamShop.listTopFlavors()


let order1 = iceCreamShop.orderCone(cone: Cone(flavor: cherry, topping: toppings.first, size: .large))

let order2 = iceCreamShop.orderCone(cone: Cone(flavor: coconut, topping: nil, size: .small))

let order3 = iceCreamShop.orderCone(cone: Cone(flavor: upcomingFlavor, topping: nil, size: .small))

order1?.eat()

print("The total sales is \(iceCreamShop.totalSales)")

