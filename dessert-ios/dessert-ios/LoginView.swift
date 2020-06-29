//LoginView.swift created on 28/06/2020.

import SwiftUI

struct LoginForm: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack() {
        DessertInput(label: "Email", placeholder: "Enter email", text: $email)
            DessertInput(label: "Password", placeholder: "Enter password", text: $password)
        }.padding(30)
    }
}

struct LoginView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    @State private var showingAlert = false
    @State private var titleAlert: String = "Error"
    @State private var messageAlert: String = ""
    @State private var email: String = "test@test.test"
    @State private var password: String = "test"
    
    func login() -> Void {
        print("Login logic here...")
        print("email", email)
        print("password", password)
        
        if (email == "" || password == "") {
            self.titleAlert = "Ooops..."
            self.messageAlert = "You must provide an Email and a Password."
            self.showingAlert = true
            return
        }
        
        let mutation = LoginMutation(email: email, password: password, remember: true)
        
        Network.shared.apollo.perform(mutation: mutation) {
            result in
            switch result {
            case.success(let graphQLResult):
                if let id = graphQLResult.data?.login.id {
                    print("Got id", id)
                    self.userAuth.setUserID(userID: id)
                    self.userAuth.login()
                } else if let errors = graphQLResult.errors {
                    // fail graphQL
                    print("graphQL fail", errors)
                    self.titleAlert = "Invalid Credentials"
                    self.messageAlert = "Please check your credentials"
                    self.showingAlert = true;
                }
            case .failure(let error):
                self.titleAlert = "Server error :("
                self.messageAlert = "Contact us if the error persists."
                self.showingAlert = true;
                print(error)
            }
        }
    }
    
    func goToWebView() -> Void {
        print("Going to web...")
        
        if let url = URL(string: "https://dessert.dev/") {
            UIApplication.shared.open(url)
        }
    }
    
    var body: some View {
        VStack() {
            Text("Dessert")
                .font(Font.custom("Pacifico", size: 60))
                .foregroundColor(Color(UIColor(named: "DessertColor")!))
            LoginForm(email: $email, password: $password)
            DessertButton(text: "Login", action: login).alert(isPresented: $showingAlert, content: {
                Alert(title: Text(self.titleAlert), message: Text(self.messageAlert))
            })
            DessertNoAccount(action: goToWebView)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
