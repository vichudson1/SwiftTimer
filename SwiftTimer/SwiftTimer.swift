//
//  SwiftTimer.swift
//
//  Created by Victor Hudson on 4/14/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation

public class SwiftTimer: NSObject {
	func fire() {
		self.timer?.fire()
		running = true
	}
	
	func invalidate() {
		self.timer?.invalidate()
		self.timer = nil
		running = false
	}
	
	init(timeInterval: NSTimeInterval, userInfo: [String: AnyObject]?, repeats: Bool, timerAction: () -> Void){
		super.init()
		self.timerAction = timerAction
		self.timer = NSTimer.scheduledTimerWithTimeInterval(0.03,
		                                                    target: self,
		                                                    selector: #selector(self.theSelector(_:)),
		                                                    userInfo: userInfo,
		                                                    repeats: repeats)
	}
	
	var running = false
	
	private var timer: NSTimer?
	private var timerAction: (() -> Void)?
}

private extension SwiftTimer {
	@objc func theSelector(timer: NSTimer) {
		guard let action = self.timerAction else { return }
		action()
	}
}
