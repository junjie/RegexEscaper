//
//  AppDelegate.swift
//  RegexEscaper
//
//  Created by Lin Junjie on 3/2/20.
//  Copyright © 2020 Due Pte. Ltd. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTextViewDelegate {

	@IBOutlet weak var window: NSWindow!
	@IBOutlet var sourceTextView: NSTextView!
	@IBOutlet var destinationTextView: NSTextView!
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		sourceTextView.string = "Hello World? This is my \"unescaped\" source text :) (the escaped version is on the right)";
		escapeRegularExpression()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	private func escapeRegularExpression() {
		destinationTextView.string = NSRegularExpression.escapedPattern(for: sourceTextView.string)
	}
	
	func textDidChange(_ notification: Notification) {
		escapeRegularExpression()
	}
	
	@IBAction func copyEscapeText(_ sender: Any) {
		NSPasteboard.general.declareTypes([.string], owner: nil)
		NSPasteboard.general.setString(destinationTextView.string, forType: .string)
	}
}

