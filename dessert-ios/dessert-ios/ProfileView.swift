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
    
    func logout() -> Void {
        print("Logout logic here...")
        userAuth.logout()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            ProfileDetails()
            
            Spacer()
                
            DessertInvertedButton(text: "Logout", action: logout)
            
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
