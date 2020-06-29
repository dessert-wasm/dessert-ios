//ProfileView.swift created on 28/06/2020.

import SwiftUI


struct ProfileDetails: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Details").font(.title)
            
            Text("Username").font(.body)
            
            Text("Joined on 29/06/2020").font(.body)
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
        VStack(alignment: .leading) {
            Spacer()
            
            ProfileDetails()
            
            Spacer()
                
            DessertInvertedButton(text: "Logout", action: logout).alert(isPresented: $showingAlert, content: {
                Alert(title: Text(GraphQL.SERVER_ERROR), message: Text(GraphQL.CONTACT_US))
            })
            
            Spacer()

        }.padding()
        /*.background(Color.yellow)*/
}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
