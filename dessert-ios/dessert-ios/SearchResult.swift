//
//  SearchResult.swift
//  Redditor
//
//  Created by Pistachio on 24/05/2020.
//  Copyright © 2020 pistach3. All rights reserved.
//

import SwiftUI

struct SearchResult: View {
    var module: SearchQuery.Data.Search.Result
    
    var body: some View {
        NavigationLink(destination: ModuleIDView(module: self.module)) {
            HStack() {
                VStack(alignment: .leading, spacing: 7) {
                    HStack {
                        Text(module.name).font(Font.headline)
                    }
                    Text(String(format: "@%@", module.author.nickname))
                    if module.isCore {
                        Text(String("core")).foregroundColor(Color(UIColor(named: "ModulesColor")!))
                    } else {
                        Text(String("connector")).foregroundColor(Color(UIColor(named: "DessertColor")!))
                    }
                    Text(module.description)
                        .font(Font.body)
                    TagsView(tags: module.tags)
                }
            }
        }
        .padding()
        .background(Color.white)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}

struct SearchResult_Previews: PreviewProvider {
    static var author = SearchQuery.Data.Search.Result.Author.init(nickname: "author")
    
    static var previews: some View {
        SearchResult(module: SearchQuery.Data.Search.Result.init(id: 1, name: "testModule", author: author, isCore: false, publishedDateTime: "date", tags: [SearchQuery.Data.Search.Result.Tag.init(name: "tag")], description: "module description"))
    }
}
