//ModuleList.swift created on 29/06/2020.

import SwiftUI

struct Module: Identifiable {
    var id = UUID()
    var name: String
    var description: String
}

struct ModuleRow: View {
    var module: Module

    var body: some View {
        Text("\(module.name)")
    }
}

struct ModuleList: View {
    private let modules = [
        Module(name: "yaml", description: "yaml is here"),
        Module(name: "js-thingy", description: "js things on the way")
    ]
    
    var body: some View {
        return List(modules) { module in
            ModuleRow(module: module)
        }
    }
}

struct ModuleList_Previews: PreviewProvider {
    static var previews: some View {
        ModuleList()
    }
}
