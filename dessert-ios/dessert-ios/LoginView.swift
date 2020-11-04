//LoginView.swift created on 28/06/2020.

import SwiftUI

struct LoginForm: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
        DessertInput(label: "Email", placeholder: "Enter email", isPassword: false, text: $email)
            DessertInput(label: "Password", placeholder: "Enter password", isPassword: true, text: $password)
        }.padding(30)
    }
}

struct LoginView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    @State private var showingAlert = false
    @State private var titleAlert: String = "Error"
    @State private var messageAlert: String = ""
    @State private var email: String = Test.TEST_EMAIL
    @State private var password: String = Test.TEST_PASSWORD
    
    func login() -> Void {
        if (email == "" || password == "") {
            self.titleAlert = Login.OOPS
            self.messageAlert = Login.PROVIDE_CREDS
            self.showingAlert = true
            return
        }
        
        let mutation = LoginMutation(email: email, password: password, remember: true)
        
        Network.shared.apollo.perform(mutation: mutation) {
            result in
            switch result {
            case.success(let graphQLResult):
                if let id = graphQLResult.data?.login.id {
                    self.userAuth.setUserID(userID: id)
                    self.userAuth.login()
                } else if graphQLResult.errors != nil {
                    self.titleAlert = Login.INVALID_CREDS
                    self.messageAlert = Login.CHECK_CREDS
                    self.showingAlert = true;
                }
            case .failure(let error):
                print(error)
                self.titleAlert = GraphQL.SERVER_ERROR
                self.messageAlert = GraphQL.CONTACT_US
                self.showingAlert = true;
            }
        }
    }
    
    func goToWebView() -> Void {
        if let url = URL(string: WebView.WEB_SIGN_UP) {
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
