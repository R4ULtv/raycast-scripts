#!/usr/bin/env swift

import Foundation

// Link to the private function in PreferencePanesSupport.framework
@_silgen_name("setSwipeScrollDirection")
func setSwipeScrollDirection(_ direction: Bool)

// Read current value
let key = "com.apple.swipescrolldirection"
let currentValue = UserDefaults.standard.bool(forKey: key)
let newValue = !currentValue

// Set the new value using the private API (this actually applies it)
setSwipeScrollDirection(newValue)

// Post notification so System Settings UI updates if open
DistributedNotificationCenter.default().postNotificationName(
    Notification.Name("SwipeScrollDirectionDidChangeNotification"),
    object: nil,
    userInfo: nil,
    deliverImmediately: true
)

print("Natural scrolling: \(newValue ? "ON" : "OFF")")
