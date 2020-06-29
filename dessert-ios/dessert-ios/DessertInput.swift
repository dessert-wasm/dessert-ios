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
    
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
        Text(label).font(.body)
        TextField(placeholder, text: $text)
        .textFieldStyle(DessertInputStyle())
        }
    }
}

struct DessertInput_Previews: PreviewProvider {
    @State static var text = ""
    
    static var previews: some View {
        DessertInput(label: "Username", placeholder: "Input your username", text: $text).padding()
    }
}
