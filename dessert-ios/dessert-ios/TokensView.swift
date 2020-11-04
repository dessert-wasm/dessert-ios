//TokensView.swift created on 29/06/2020.

import SwiftUI

struct TokenRow: View {
    var token: GetUserQuery.Data.User.Token

    var body: some View {
        Text("\(token.token) : \(token.description)")
    }
}

struct TokensView: View {
    var tokens: [GetUserQuery.Data.User.Token]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tokens").bold()
            List(tokens, id: \.id) { token in
                TokenRow(token: token)
            }
        }
    }
}

struct TokensView_Previews: PreviewProvider {
    static var previews: some View {
        TokensView(tokens: [
            GetUserQuery.Data.User.Token(id: 1, token: "montoken", description: "madescription")
        ])
    }
}
