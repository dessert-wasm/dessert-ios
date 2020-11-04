//MyModulesView.swift created on 29/06/2020.

import SwiftUI

class ModulesData : ObservableObject {
    var userID: Int
    @Published var modules: [GetUserQuery.Data.User.Module.Result]

    init(userID: Int) {
        self.userID = userID
        self.modules = []
        gatherData()
    }
    
    func gatherData() {
        let pagination = PaginationQueryInput(includeCount: true, pageNumber: 1, pageSize: 10)
        
        let query = GetUserQuery(author: self.userID, pagination: pagination)
        
        Network.shared.apollo.fetch(query: query) {
            result in
            switch result {
            case .success(let graphQLResult):
                print(graphQLResult)
                if let modules = graphQLResult.data?.user.modules.result {
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

struct MyModulesContent: View {
    @ObservedObject var data : ModulesData
    
    var body: some View {
        VStack {
            ModuleList(modules: data.modules)
        }
    }
}

struct MyModulesView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        VStack {
            MyModulesContent(data: ModulesData(userID: userAuth.userID))
        }
    }
}

struct MyModulesView_Previews: PreviewProvider {
    static var previews: some View {
        MyModulesView()
    }
}
