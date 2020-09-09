//DocsView.swift created on 08/09/2020.

import SwiftUI

struct DocsView: View {
    func goToWhoAreWe() -> Void {
        let urlComponents = URLComponents (string: Docs.WHO_ARE_WE)!
        UIApplication.shared.open (urlComponents.url!)
    }
    
    func goToWhyDessert() -> Void {
        let urlComponents = URLComponents (string: Docs.WHY_DESSERT)!
        UIApplication.shared.open (urlComponents.url!)
    }
    
    func goToQuickStart() -> Void {
        let urlComponents = URLComponents (string: Docs.QUICKSTART)!
        UIApplication.shared.open (urlComponents.url!)
    }
    
    func goToDocs() -> Void {
        let urlComponents = URLComponents (string: Docs.CLI_DOCS)!
        UIApplication.shared.open (urlComponents.url!)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Spacer()
            
            Button(action: goToWhoAreWe) {
                Text("🤔 Who are we?")
                    .fontWeight(.semibold)
                    .font(.headline).foregroundColor(Color(UIColor(named: "DessertColor")!))
            }
                
            Button(action: goToWhyDessert) {
                Text("🍰 Why Dessert?")
                    .fontWeight(.semibold)
                    .font(.headline).foregroundColor(Color(UIColor(named: "ModulesColor")!))
            }
            
            Button(action: goToQuickStart) {
                Text("🚀 Quickstart guide")
                    .fontWeight(.semibold)
                    .font(.headline).foregroundColor(Color(UIColor(named: "ProfileColor")!))
            }
            
            Button(action: goToDocs) {
                Text("⚒️ CLI Documentation")
                    .fontWeight(.semibold)
                    .font(.headline).foregroundColor(Color(UIColor(named: "DocsColor")!))
            }
            
            Spacer()
        }
    }
}

struct DocsView_Previews: PreviewProvider {
    static var previews: some View {
        DocsView()
    }
}
