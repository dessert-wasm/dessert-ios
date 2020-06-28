//ContentView.swift created on 28/06/2020.

import SwiftUI
import BottomBar_SwiftUI

let items: [BottomBarItem] = [
    BottomBarItem(icon: "house.fill", title: "Home", color: Color(UIColor(named: "DessertColor")!)),
    BottomBarItem(icon: "magnifyingglass", title: "Modules", color: Color(UIColor(named: "ModulesColor")!)),
    BottomBarItem(icon: "person.fill", title: "Profile", color: Color(UIColor(named: "ProfileColor")!))
]

struct BasicView: View {
    let item: BottomBarItem

    var detailText: String {
    "\(item.title) Detail"
}

var destination: some View {
    Text(detailText)
        .navigationBarTitle(Text(detailText))
}

var body: some View {
    VStack {
        Spacer()
        Spacer()
        }
    }
}

struct ContentView : View {
    @State private var selectedIndex: Int = 0

    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }

var body: some View {
        NavigationView {
            VStack {
                BasicView(item: selectedItem)
                    .navigationBarTitle(Text(selectedItem.title))
                BottomBar(selectedIndex: $selectedIndex, items: items)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
