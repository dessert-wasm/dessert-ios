//TagsView.swift created on 09/09/2020.

import SwiftUI

struct TagsView: View {
    var tags: [SearchQuery.Data.Search.Result.Tag]
    
    var body: some View {
        VStack {
        HStack {
            ForEach(tags, id: \.name) { tag in
                Text("\(tag.name)")
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color(UIColor(named: "ProfileColor")!), lineWidth: 2)
                )
                .lineLimit(1)
            }
        }
    }
}
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: [
            SearchQuery.Data.Search.Result.Tag(name: "tag1"),
            SearchQuery.Data.Search.Result.Tag(name: "chocolat")
        ])
    }
}
