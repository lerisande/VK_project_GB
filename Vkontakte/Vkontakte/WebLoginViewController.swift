//
//  WebLoginViewController.swift
//  Vkontakte
//
//  Created by Lera on 29.08.21.
//

import UIKit
import WebKit

class WebLoginViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet{
            webView.navigationDelegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        authorize()
    }
    // создаем конструктор
    func authorize() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7938051"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]

        let request = URLRequest(url: urlComponents.url!)

        webView.load(request)

    }

}

extension WebLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                decisionHandler(.allow)
                return
            }

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
              let userID = params["user_id"]
        else { return }

        Session.shared.token = token
        Session.shared.userId = userID

        print("My token is \(token)")
        print("My user ID is \(userID)")

        performSegue(withIdentifier: "toTabBar", sender: self)
        decisionHandler(.cancel)
    }
}
