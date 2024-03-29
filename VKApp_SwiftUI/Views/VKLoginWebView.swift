//
//  VKLoginWebView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 05.07.2022.
//

import SwiftUI
import UIKit
import WebKit

struct VKLoginWebView: UIViewRepresentable {
    
    
    fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "8081314"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        return components.url.map { URLRequest(url: $0) }
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let myClass = MyClass()
        myClass.camelProperty = "Hello World"
        myClass.snakeProperty = "Hello World"
        myClass.kebabProperty = "Hello World"
        print(myClass.camelProperty)
        print(myClass.snakeProperty)
        print(myClass.kebabProperty)
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let userIdInt = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        
        SessionSingleton.instance.token = token
        SessionSingleton.instance.userId = userIdInt
        
        NotificationCenter.default.post(name: NSNotification.Name("vkTokenSaved"), object: self)
        decisionHandler(.cancel)
    }
}
