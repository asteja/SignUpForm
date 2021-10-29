Project Configuration:
Xcode 13
IOS 15 and later
Swift 5

About Project:
Project is a single view application where user can create an account with the details. Project uses an MVVM architecture with latest technologies like Combine, SwiftUI and Xcode.

The project uses a single reusable view to present content to the user for signup and then followed by confirmation screens. (Since the project is very small and to demonstrate the swiftUI capabilities we used single reusable view)

Network layer is mocked with data for now but using async/await functionality. Project also uses MainActor to switch from concurrent threads to main threads during the service calls.

The project also covers the unit testing the viewmodels, published properties and asynchronous tasks.
