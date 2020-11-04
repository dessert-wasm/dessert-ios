//
//  SwiftUIView.swift
//  Redditor
//
//  Created by Pistachio on 24/05/2020.
//  Copyright © 2020 pistach3. All rights reserved.
//

import SwiftUI

struct SearchContent: View {
    @State private var searchResults = [SearchQuery.Data.Search.Result]();
    @State private var searchText : String = ""
    
    func getModules(query: String) -> Void {
        let pagination = PaginationQueryInput(includeCount: true, pageNumber: 1, pageSize: 10)
        let query = SearchQuery(query: query, pagination: pagination)
        
        Network.shared.apollo.fetch(query: query) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let modules = graphQLResult.data?.search.result {
                    print("modules", modules)
                    self.searchResults = modules as! [ SearchQuery.Data.Search.Result ]
                } else if let errors = graphQLResult.errors {
                    print(errors)
                }
            case .failure(let errors):
                print(errors)
            }
        }
      }
    
    func onTextChanged (query: String) -> Void {
        getModules(query: query)
    }
    
    func parseResults() -> [SearchQuery.Data.Search.Result] {
        if showCore {
            return searchResults.filter { $0.isCore }
        } else {
            return searchResults.filter { !$0.isCore }
        }
    }
    
    @State private var showCore = false
    
    struct CheckboxToggleStyle: ToggleStyle {
        
        func makeBody(configuration: Configuration) -> some View {
            return HStack {
                configuration.label
                Spacer()
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(Color(UIColor(named: "DessertColor")!))
                    .onTapGesture { configuration.isOn.toggle() }
            }
        }
    }
    
    struct BlueToggle : UIViewRepresentable {
      func makeUIView(context: Context) -> UISwitch {
        UISwitch()
      }

      func updateUIView(_ uiView: UISwitch, context: Context) {
        uiView.onTintColor = UIColor.blue
      }
    }
    
    init() {
        UISwitch.appearance().onTintColor = UIColor(named: "DessertColor")!
        
        // Getting rid of greyish background color
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                
            Toggle(isOn: $showCore) {
                if showCore {
                    Text("Showing 💖")
                } else {
                    Text("Showing 🔗")
                }
            }.padding()
                
            SearchBar(
                text: $searchText,
                placeholder: "Search a module",
                onTextChanged: onTextChanged
            )
            
            List(parseResults(), id: \.id) {
                item in
                SearchResult(module: item)
            }
          }
        }
    }
}

struct SearchContent_Previews: PreviewProvider {
    static var previews: some View {
        SearchContent()
    }
}
