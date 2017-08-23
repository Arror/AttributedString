//
//  TextAttachment.swift
//  AttributedString
//
//  Created by Arror on 2017/8/23.
//  Copyright © 2017年 Arror. All rights reserved.
//

import Foundation

public struct TextAttachment {
    
    private let reference: NSTextAttachment
    
    private init(reference: NSTextAttachment) {
        
        self.reference = reference
    }
    
    public init() {
        
        self.init(reference: NSTextAttachment())
    }
}

extension NSTextAttachment: NSCopying {
    
    public func copy(with zone: NSZone? = nil) -> Any {
        
        // 这个什么鬼
        fatalError()
    }
}

extension TextAttachment: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        
        return self.reference.description
    }
    
    public var debugDescription: String {
        
        return self.reference.debugDescription
    }
}

extension TextAttachment: Hashable {
    
    public var hashValue: Int {
        
        return self.reference.hashValue
    }
}

extension TextAttachment: Equatable {
    
    public static func ==(lhs: TextAttachment, rhs: TextAttachment) -> Bool {
        
        return lhs.reference.isEqual(rhs.reference)
    }
}

extension TextAttachment: ReferenceConvertible {
    
    public typealias ReferenceType = NSTextAttachment
}

extension TextAttachment: _ObjectiveCBridgeable {
    
    public typealias _ObjectiveCType = NSTextAttachment
    
    public func _bridgeToObjectiveC() -> NSTextAttachment {
        
        return self.reference
    }
    
    public static func _forceBridgeFromObjectiveC(_ source: NSTextAttachment, result: inout TextAttachment?) {
        
        if !self._conditionallyBridgeFromObjectiveC(source, result: &result) {
            
            fatalError("Unable to bridge \(_ObjectiveCType.self) to \(self)")
        }
    }
    
    public static func _conditionallyBridgeFromObjectiveC(_ source: NSTextAttachment, result: inout TextAttachment?) -> Bool {
        
        result = TextAttachment(reference: source)
        
        return true
    }
    
    public static func _unconditionallyBridgeFromObjectiveC(_ source: NSTextAttachment?) -> TextAttachment {
        
        var result: TextAttachment?
        
        self._forceBridgeFromObjectiveC(source!, result: &result)
        
        return result!
    }
}
