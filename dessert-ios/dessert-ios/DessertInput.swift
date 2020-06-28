//DessertInput.swift created on 28/06/2020.

import SwiftUI

struct DessertInputStyle: TextFieldStyle {
    
    let borderColor = Color(UIColor(named: "DessertColor")!)
 
    public func _body(configuration: TextField<Self._Label>) -> some View {
      configuration
        .padding(10)
        .background(
          Rectangle()
            .strokeBorder(borderColor, lineWidth: 1)
      )
    }
}

struct DessertInput: View {
    var label: String
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
        Text(label).font(.body)
        TextField(placeholder, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
        .textFieldStyle(DessertInputStyle())
        }
    }
}

struct DessertInput_Previews: PreviewProvider {
    static var previews: some View {
        DessertInput(label: "Username", placeholder: "Input your username").padding()
    }
}
