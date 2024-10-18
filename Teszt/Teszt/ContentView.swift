import SwiftUI
import WebKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            WebView(webView: viewModel.webView)
                .onAppear {
                    viewModel.loadLocalHTML()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WebView: UIViewRepresentable {
    let webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

class ContentViewModel: NSObject, ObservableObject {
    @Published var webView: WKWebView

    override init() {
        let configuration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: configuration)
        super.init()
    }
    
    func loadLocalHTML() {
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            if let htmlString = try? String(contentsOf: url, encoding: .utf8) {
                let baseURL = url.deletingLastPathComponent()
                webView.loadHTMLString(htmlString, baseURL: baseURL)
            } else {
                print("Failed to load HTML string.")
            }
        } else {
            print("index.html not found.")
        }
    }
}
