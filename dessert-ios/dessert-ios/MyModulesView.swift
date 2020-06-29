//MyModulesView.swift created on 29/06/2020.

import SwiftUI

class ModulesData : ObservableObject {
    @Published var modules: [GetUserQuery.Data.User.Module.Result]

    init(userID: Int) {
        print("Gathering modules data...")
        self.modules = []
        gatherData()
    }
    
    func gatherData() {
        print("Here")
        
        let pagination = PaginationQueryInput(includeCount: true, pageNumber: 1, pageSize: 10)
        
        let query = GetUserQuery(author: 7, pagination: pagination)
        
        Network.shared.apollo.fetch(query: query) {
            result in
            switch result {
            case .success(let graphQLResult):
                print(graphQLResult)
                if let modules = graphQLResult.data?.user.modules.result {
                    print("modules", modules)
                    self.modules = modules as! [GetUserQuery.Data.User.Module.Result]
                } else if let errors = graphQLResult.errors {
                    print(errors)
                }
            case .failure(let errors):
                print(errors)
            }
        }
    }
}

struct MyModulesView: View {
    @ObservedObject private var data = ModulesData(userID: 7)
    
    var body: some View {
        VStack {
            ModuleList(modules: data.modules)
        }
    }
}

struct MyModulesView_Previews: PreviewProvider {
    static var previews: some View {
        MyModulesView()
    }
}
