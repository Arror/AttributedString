//
//  ParagraphStyle.swift
//  AttributedString
//
//  Created by Arror on 2017/8/23.
//  Copyright © 2017年 Arror. All rights reserved.
//

import Foundation

public struct ParagraphStyle {
    
    private let reference: NSMutableParagraphStyle
    
    private init(reference: NSParagraphStyle) {
        
        self.reference = reference.mutableCopy() as! NSMutableParagraphStyle
    }
    
    public init() {
        
        self.init(reference: .default)
    }
}

extension ParagraphStyle: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        
        return self.reference.description
    }
    
    public var debugDescription: String {
        
        return self.reference.debugDescription
    }
}

extension ParagraphStyle: Hashable {
    
    public var hashValue: Int {
        
        return self.reference.hashValue
    }
}

extension ParagraphStyle: Equatable {
    
    public static func ==(lhs: ParagraphStyle, rhs: ParagraphStyle) -> Bool {
        
        return lhs.reference.isEqual(rhs.reference)
    }
}

extension ParagraphStyle: ReferenceConvertible {
    
    public typealias ReferenceType = NSParagraphStyle
}

extension ParagraphStyle: _ObjectiveCBridgeable {
    
    public typealias _ObjectiveCType = NSParagraphStyle
    
    public func _bridgeToObjectiveC() -> NSParagraphStyle {
        
        return self.reference
    }
    
    public static func _forceBridgeFromObjectiveC(_ source: NSParagraphStyle, result: inout ParagraphStyle?) {
        
        if !self._conditionallyBridgeFromObjectiveC(source, result: &result) {
            
            fatalError("Unable to bridge \(_ObjectiveCType.self) to \(self)")
        }
    }
    
    public static func _conditionallyBridgeFromObjectiveC(_ source: NSParagraphStyle, result: inout ParagraphStyle?) -> Bool {
        
        result = ParagraphStyle(reference: source)
        
        return true
    }
    
    public static func _unconditionallyBridgeFromObjectiveC(_ source: NSParagraphStyle?) -> ParagraphStyle {
        
        var result: ParagraphStyle?
        
        self._forceBridgeFromObjectiveC(source!, result: &result)
        
        return result!
    }
}

