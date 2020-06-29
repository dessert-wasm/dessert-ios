//DessertNoAccount.swift created on 29/06/2020.

import SwiftUI


struct DessertNoAccountStyle: ButtonStyle {
    let buttonColor = Color(UIColor(named: "DessertColor")!)
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .foregroundColor(buttonColor)
        .padding(15)
    }
}

struct DessertNoAccount: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
                Text("No account?")
            .underline()
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 100, height: 20)
        }
        .buttonStyle(DessertNoAccountStyle())
    }
}

struct DessertNoAccount_Previews: PreviewProvider {
    static var previews: some View {
        DessertNoAccount(action: {print("Hello Dessert !")})
    }
}
