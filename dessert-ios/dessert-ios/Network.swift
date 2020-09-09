//Network.swif created on 29/06/2020.

import Foundation
import CoreData
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://prod.dessert.vodka/")!)
}
