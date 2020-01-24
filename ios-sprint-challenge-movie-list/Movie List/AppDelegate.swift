import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
         /// Setup initial ViewController
         let initialViewController = MovieListVC()
         let navigationController = UINavigationController(rootViewController: initialViewController)
         self.window?.rootViewController = navigationController
         self.window?.makeKeyAndVisible()
        
        return true
    }
}
