import SwiftUI

final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    enum AuthFlow: Hashable, Codable {
        case login
        case createAccount
        case profile
        case forgotPassword
        case emailSent
    }
    
    func navigate(to destination: AuthFlow) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    /*
     [apple, banana, apple2]
     
     array.removeLast(array.count) // 3
     
     []
     
     */
}

/*
 Forgot Password
 Email Sent
 */
