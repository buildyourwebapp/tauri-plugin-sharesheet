// Copyright 2019-2023 Tauri Programme within The Commons Conservancy
// SPDX-License-Identifier: Apache-2.0
// SPDX-License-Identifier: MIT

import LocalAuthentication
import SwiftRs
import Tauri
import UIKit
import WebKit
import SwiftUI
import UIKit
import Foundation

struct SharesheetOptions: Decodable {
  let text: String
}

class SharesheetPlugin: Plugin {
  var webview: WKWebView!
  public override func load(webview: WKWebView) {
    self.webview = webview
  }

  @objc func shareText(_ invoke: Invoke) throws {
    let args = try invoke.parseArgs(SharesheetOptions.self)

    DispatchQueue.main.async {
      let activityViewController = UIActivityViewController(activityItems: [args.text], applicationActivities: nil)
      
      // Display as popover on iPad as required by apple
      activityViewController.popoverPresentationController?.sourceView = self.webview // display as a popover on ipad
      activityViewController.popoverPresentationController?.sourceRect = CGRect(
        x: self.webview.bounds.midX,
        y: self.webview.bounds.midY,
        width: CGFloat(Float(0.0)),
        height: CGFloat(Float(0.0))
      )

      self.manager.viewController?.present(activityViewController, animated: true, completion: nil)
    }
  }
}

@_cdecl("init_plugin_sharesheet")
func initPlugin() -> Plugin {
  return SharesheetPlugin()
}
