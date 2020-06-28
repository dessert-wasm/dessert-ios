//DessertInvertedButton.swift created on 28/06/2020.

import SwiftUI

struct DessertInvertedButtonStyle: ButtonStyle {
    
    let buttonColor = Color(UIColor(named: "DessertColor")!)
 
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .foregroundColor(buttonColor)
        .padding()
        .background(
            Rectangle()
            .strokeBorder(buttonColor, lineWidth: 3)
      )
    }
}

struct DessertInvertedButton: View {
    var text: String
    
    var body: some View {
        Button(action: {
            print("Hello Dessert")
        }) {
            HStack {
                Text(text)
                Image(systemName: "arrow.right")
            }
        }.buttonStyle(DessertInvertedButtonStyle())
    }
}

struct DessertInvertedButton_Previews: PreviewProvider {
    static var previews: some View {
        DessertInvertedButton(text: "Get Started").padding()
    }
}

