//DessertButton.swift created on 28/06/2020.

import SwiftUI

struct GradientBackgroundStyle: ButtonStyle {
    let buttonColor = Color(UIColor(named: "DessertColor")!)
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .foregroundColor(Color.white)
        .padding(15)
        .background(buttonColor)
    }
}

struct DessertButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
                Text(text)
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 100, height: 20)
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}

struct DessertButton_Previews: PreviewProvider {
    static var previews: some View {
        DessertButton(text: "Click Me", action: { print("Hello Dessert") })
    }
}
