//ProfileView.swift created on 28/06/2020.

import SwiftUI

import URLImage

class ProfileData : ObservableObject {
    var userID: Int
    @Published var user: GetUserQuery.Data.User

    init(userID: Int) {
        print("Gathering user data...")
        self.userID = userID
        self.user = GetUserQuery.Data.User(
            id: -1,
            nickname: "",
            profilePicUrl: "",
            tokens: [],
            modules: GetUserQuery.Data.User.Module()
        )
        gatherData()
    }
    
    func gatherData() {
        let pagination = PaginationQueryInput(includeCount: true, pageNumber: 1, pageSize: 3)
        let query = GetUserQuery(author: self.userID, pagination: pagination)
        Network.shared.apollo.fetch(query: query) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let user = graphQLResult.data?.user {
                    print(user.nickname)
                    self.user = user
                } else if let errors = graphQLResult.errors {
                    print(errors)
                }
            case .failure(let errors):
                print(errors)
            }
        }
    }
}

struct ProfileContentView: View {
    @ObservedObject var profileData : ProfileData
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
        
        if self.profileData.user.profilePicUrl.count > 0 {
            URLImage(URL(string: self.profileData.user.profilePicUrl)!, placeholder: Image(systemName: "circle"))
                { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100.0, height: 100.0)
                    .clipped()
                }
            .frame(width: 100.0, height: 100.0)
            .border(Color(UIColor(named: "DessertColor")!), width: 4)
        } else {
            Text("Loading...").font(.footnote)
        }
        Text("@" + self.profileData.user.nickname).font(.body).bold()
        
        TokensView(tokens: self.profileData.user.tokens).padding()
    }
    }
}


struct ProfileDetails: View {
    @EnvironmentObject var userAuth: UserAuth
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ProfileContentView(profileData: ProfileData(userID: userAuth.userID))
        }
    }
}

struct ProfileView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    @State private var showingAlert = false
    
    func logout() -> Void {
        print("Logout logic here...")
        
        let mutation = LogoutMutation()
        
        Network.shared.apollo.perform(mutation: mutation){
        result in
            switch result {
            case .success(let graphQLResult):
                print(graphQLResult)
                self.userAuth.logout()
            case .failure(let errors):
                print("Errors", errors)
                self.showingAlert = true;
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            ProfileDetails()
            
            Spacer()
                
            DessertInvertedButton(text: "Logout", action: logout).alert(isPresented: $showingAlert, content: {
                Alert(title: Text(GraphQL.SERVER_ERROR), message: Text(GraphQL.CONTACT_US))
                }).padding()

        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
