#!/usr/bin/swift

import Carbon

let usID = "com.apple.keylayout.US" as CFString
let italianID = "com.apple.keylayout.Italian-Pro" as CFString

func getInputSource(for id: CFString) -> TISInputSource? {
    let properties = [kTISPropertyInputSourceID: id] as CFDictionary
    guard
        let sources = TISCreateInputSourceList(properties, false)?.takeRetainedValue()
            as? [TISInputSource],
        let source = sources.first
    else {
        return nil
    }
    return source
}

func isSelected(_ source: TISInputSource) -> Bool {
    guard let ptr = TISGetInputSourceProperty(source, kTISPropertyInputSourceIsSelected) else {
        return false
    }
    return CFBooleanGetValue(Unmanaged<CFBoolean>.fromOpaque(ptr).takeUnretainedValue())
}

guard let us = getInputSource(for: usID),
    let italian = getInputSource(for: italianID)
else {
    print("Error: Could not find layouts")
    exit(1)
}

let wasItalian = isSelected(italian)
let target = wasItalian ? us : italian
TISSelectInputSource(target)

let newLayout = wasItalian ? "US" : "IT"
print("Layout: \(newLayout)")
