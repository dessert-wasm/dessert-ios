//LoginView.swift created on 28/06/2020.

import SwiftUI

struct LoginForm: View {
    var body: some View {
        VStack() {
        DessertInput(label: "Username", placeholder: "Enter username")
        DessertInput(label: "Password", placeholder: "Enter password")
        }.padding(30)
    }
}

struct LoginView: View {
    
    @EnvironmentObject var userAuth: UserAuth
    
    func login() -> Void {
        print("Login logic here...")
        userAuth.login()
    }
    
    func goToWebView() -> Void {
        print("Going to web...")
        
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url)
        }
    }
    
    var body: some View {
        VStack() {
            Text("Dessert")
                .font(Font.custom("Pacifico", size: 60))
                .foregroundColor(Color(UIColor(named: "DessertColor")!))
            LoginForm()
            HStack() {
                DessertButton(text: "Login", action: login)
            }
            DessertNoAccount(action: goToWebView)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
