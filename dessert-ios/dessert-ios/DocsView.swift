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
        VStack {
            Spacer()
            
            Button(action: goToWhoAreWe) {
                Text("🤔 Who are we?")
            .underline()
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 200, height: 30)
            }
                
            Button(action: goToWhyDessert) {
                Text("🍰 Why Dessert?")
            .underline()
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 200, height: 30)
            }
            
            Button(action: goToQuickStart) {
                Text("🚀 Quickstart guide")
            .underline()
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 200, height: 30)
            }
            
            Button(action: goToDocs) {
                Text("⚒️ CLI Documentation")
            .underline()
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 200, height: 30)
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
