//
//  AttributedString.swift
//  AttributedString
//
//  Created by Arror on 2017/8/6.
//  Copyright © 2017年 Arror. All rights reserved.
//

import Foundation

public struct AttributedString: Collection {
    
    private let reference: NSMutableAttributedString
    
    private init(reference: NSAttributedString) {
        
        self.reference = NSMutableAttributedString(attributedString: reference)
    }
    
    public init(string: String = "", attributes: [NSAttributedStringKey: Any]? = nil) {
        
        self.reference = NSMutableAttributedString(string: string, attributes: attributes)
    }
    
    public mutating func set(attributes: [NSAttributedStringKey: Any]?, range: Range<AttributedString.Index>) {
        
        guard let nsRange = NSRange(range, in: self.string) else { return }
        
        self.reference.setAttributes(attributes, range: nsRange)
    }
    
    mutating func add(attribute key: NSAttributedStringKey, value: Any, range: Range<AttributedString.Index>) {
        
        guard let nsRange = NSRange(range, in: self.string) else { return }
        
        self.reference.addAttribute(key, value: value, range: nsRange)
    }
    
    mutating func add(attributes: [NSAttributedStringKey: Any], range: Range<AttributedString.Index>) {
        
        guard let nsRange = NSRange(range, in: self.string) else { return }
        
        self.reference.addAttributes(attributes, range: nsRange)
    }
    
    mutating func remove(attribute key: NSAttributedStringKey, range: Range<AttributedString.Index>) {
        
        guard let nsRange = NSRange(range, in: self.string) else { return }
        
        self.reference.removeAttribute(key, range: nsRange)
    }
    
    public mutating func set(attributes: Attribute..., range: Range<String.Index>) {
        
        self.set(attributes: attributes.nsAttributes, range: range)
    }
    
    public mutating func remove(attribute: Attribute, range: Range<String.Index>) {
        
        self.remove(attribute: attribute.key, range: range)
    }
    
    public var string: String {
        
        return self.reference.string
    }
}

extension AttributedString {
    
    public typealias Element = AttributedString
    
    public typealias SubSequence = AttributedString
    
    public typealias Index = String.Index
    
    public func index(after i: AttributedString.Index) -> AttributedString.Index {
        
        return self.string.index(after: i)
    }
    
    public subscript(position: AttributedString.Index) -> AttributedString {
        
        return self[position..<position]
    }
    
    public var startIndex: AttributedString.Index {
        
        return self.string.startIndex
    }
    
    public var endIndex: AttributedString.Index {
        
        return self.string.endIndex
    }
}

extension AttributedString {
    
    public subscript(_ range: Range<String.Index>) -> AttributedString {
        
        guard let nsRange = NSRange(range, in: self.string) else { fatalError("Out of Range.") }
        
        return AttributedString(reference: self.reference.attributedSubstring(from: nsRange))
    }
    
    public subscript(_ range: PartialRangeUpTo<String.Index>) -> AttributedString {
        
        let r = self.string.startIndex..<range.upperBound
        
        return self[r]
    }
    
    public subscript(_ range: PartialRangeFrom<String.Index>) -> AttributedString {
        
        let r = range.lowerBound..<self.string.endIndex
        
        return self[r]
    }
    
    public subscript(_ range: PartialRangeThrough<String.Index>) -> AttributedString {
        
        let endIndex = self.string.index(self.string.startIndex, offsetBy: range.upperBound.encodedOffset + 1)
        
        let r = self.string.startIndex..<endIndex
        
        return self[r]
    }
}

extension AttributedString {
    
    public static func +(lhs: AttributedString, rhs: AttributedString) -> AttributedString {
        
        let new = NSMutableAttributedString(attributedString: lhs.reference)
        
        new.append(rhs.reference)
        
        return AttributedString(reference: new)
    }
    
    public static func +=(lhs: inout AttributedString, rhs: AttributedString) {
        
        lhs.reference.append(rhs.reference)
    }
}

extension AttributedString: Equatable, Hashable {
    
    public var hashValue: Int {
        
        return self.reference.hashValue
    }
    
    public static func ==(lhs: AttributedString, rhs: AttributedString) -> Bool {
        
        return lhs.reference.isEqual(to: rhs.reference)
    }
}

extension AttributedString: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        
        return self.reference.description
    }
    
    public var debugDescription: String {
        
        return self.reference.debugDescription
    }
}

extension AttributedString: ReferenceConvertible {
    
    public typealias ReferenceType = NSAttributedString
}

extension AttributedString: _ObjectiveCBridgeable {
    
    public typealias _ObjectiveCType = NSAttributedString
    
    public func _bridgeToObjectiveC() -> NSAttributedString {
        
        return self.reference
    }
    
    public static func _forceBridgeFromObjectiveC(_ source: NSAttributedString, result: inout AttributedString?) {
        
        if !self._conditionallyBridgeFromObjectiveC(source, result: &result) {
            
            fatalError("Unable to bridge \(_ObjectiveCType.self) to \(self)")
        }
    }
    
    public static func _conditionallyBridgeFromObjectiveC(_ source: NSAttributedString, result: inout AttributedString?) -> Bool {
        
        result = AttributedString(reference: source)
        
        return true
    }
    
    public static func _unconditionallyBridgeFromObjectiveC(_ source: NSAttributedString?) -> AttributedString {
        
        var result: AttributedString?
        
        self._forceBridgeFromObjectiveC(source!, result: &result)
        
        return result!
    }
}
