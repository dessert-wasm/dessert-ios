//DessertButton.swift created on 28/06/2020.

import SwiftUI

struct GradientBackgroundStyle: ButtonStyle {
    let buttonColor = Color(UIColor(named: "DessertColor")!)
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .foregroundColor(Color.white)
        .padding()
        .background(buttonColor)
    }
}

struct DessertButton: View {
    var text: String
    
    var body: some View {
        Button(action: {
            print("Hello Dessert")
        }) {
                Text(text)
                    .fontWeight(.semibold)
                    .font(.callout)
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}

struct DessertButton_Previews: PreviewProvider {
    static var previews: some View {
        DessertButton(text: "Click Me")
    }
}
