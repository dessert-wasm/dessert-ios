//ModuleList.swift created on 29/06/2020.

import SwiftUI

typealias Tag = GetUserQuery.Data.User.Module.Result.Tag

struct ModuleRow: View {
    var module: GetUserQuery.Data.User.Module.Result

    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text("\(module.name)").font(.title).bold().foregroundColor(Color(UIColor(named: "DessertColor")!))
            Text("\(module.description)")
            
            HStack {
                ForEach(module.tags, id: \.id) { tag in Text("#" + tag.name)
                    .padding(6)
                    .border(Color(UIColor(named: "DessertColor")!), width: 2)
                }
            }
        }.padding(10)
    }
}

struct ModuleList: View {
    var modules: [GetUserQuery.Data.User.Module.Result]
    
    init(modules: [GetUserQuery.Data.User.Module.Result]) {
        self.modules = modules
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        /* UITableView.appearance().separatorStyle = .none */
    }
    
    var body: some View {
        VStack {
            if modules.count == 0 {
                Spacer()
                Text("No modules :(")
                Spacer()
            } else {
                List(modules, id: \.id) { module in
                    ModuleRow(module: module)
                }.padding()
            }
        }
    }
}

struct ModuleList_Previews: PreviewProvider {
    static var previews: some View {
        ModuleList(modules: [
            GetUserQuery.Data.User.Module.Result(id: 1, name: "kuku", description: "imheretodance", publishedDateTime: "20/30/40", author: GetUserQuery.Data.User.Module.Result.Author(id: 1, nickname: "nick", profilePicUrl: "pic"), tags: [
                Tag(id: 1, name: "take"),
                Tag(id: 2, name: "your"),
                Tag(id: 3, name: "passion"),
                Tag(id: 4, name: "and"),
            ]),
            GetUserQuery.Data.User.Module.Result(id: 2, name: "kuku2", description: "rocknroll", publishedDateTime: "20/30/40", author: GetUserQuery.Data.User.Module.Result.Author(id: 1, nickname: "nick", profilePicUrl: "pic"), tags: [
                Tag(id: 1, name: "rock"),
                Tag(id: 2, name: "dance"),
            ])
            ]
        )
    }
}
