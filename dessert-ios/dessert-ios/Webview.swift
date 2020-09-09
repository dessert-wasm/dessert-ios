//Webview.swift created on 09/09/2020.

import SwiftUI
import Foundation
import WebKit

struct Webview: UIViewRepresentable {
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

struct Webview_Previews: PreviewProvider {
    static var previews: some View {
        Webview(url: "www.google.com")
    }
}
