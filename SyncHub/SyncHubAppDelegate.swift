//
//  SyncHubAppDelegate.swift
//  SyncHub
//
//  Created by Steven Liu on 2/14/26.
//

import SwiftUI
import Firebase
import FirebaseAuth

#if os(macOS)
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
}
#endif

#if os(iOS)
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    if FirebaseApp.app() == nil {
        FirebaseApp.configure()
    }
    return true
  }
}
#endif
