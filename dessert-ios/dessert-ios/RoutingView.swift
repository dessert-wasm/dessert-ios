//RoutingView.swift created on 28/06/2020.

import SwiftUI

struct RoutingView: View {

    @EnvironmentObject var userAuth: UserAuth

    var body: some View {
        if !userAuth.isLoggedin {
            return AnyView(LoginView().environmentObject(userAuth))
        } else {
            return AnyView(ContentView().environmentObject(userAuth))
        }
    }
}

struct RoutingView_Previews: PreviewProvider {
    static var previews: some View {
        RoutingView().environmentObject(UserAuth())
    }
}
