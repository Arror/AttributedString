//
//  Shadow.swift
//  AttributedString
//
//  Created by Arror on 2017/8/23.
//  Copyright © 2017年 Arror. All rights reserved.
//

import Foundation

public struct Shadow {
    
    private let reference: NSShadow
    
    private init(reference: NSShadow) {
        
        self.reference = reference
    }
    
    public init() {
        
        self.init(reference: NSShadow())
    }
    
    public var shadowOffset: CGSize {
        set {
            self = self.reference._bridgeToSwift_setShadowOffset(newValue)
        }
        get {
            return self.reference.shadowOffset
        }
    }
    
    public var shadowBlurRadius: Float {
        set {
            self = self.reference._bridgeToSwift_setShadowBlurRadius(CGFloat(newValue))
        }
        get {
            return Float(self.reference.shadowBlurRadius)
        }
    }
    
    public var shadowColor: UIColor {
        set {
            self = self.reference._bridgeToSwift_setShadowColor(newValue)
        }
        get {
            return self.reference.shadowColor as! UIColor
        }
    }
}

extension NSShadow {
    
    fileprivate var copiedShadow: NSShadow {
        
        return self.copy() as! NSShadow
    }
    
    fileprivate func _bridgeToSwift_setShadowOffset(_ offset: CGSize) -> Shadow {
        
        let copy = self.copiedShadow
        
        copy.shadowOffset = offset
        
        return copy as Shadow
    }
    
    fileprivate func _bridgeToSwift_setShadowBlurRadius(_ radius: CGFloat) -> Shadow {
        
        let copy = self.copiedShadow
        
        copy.shadowBlurRadius = radius
        
        return copy as Shadow
    }
    
    fileprivate func _bridgeToSwift_setShadowColor(_ color: UIColor) -> Shadow {
        
        let copy = self.copiedShadow
        
        copy.shadowColor = color
        
        return copy as Shadow
    }
}

extension Shadow: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        
        return self.reference.description
    }
    
    public var debugDescription: String {
        
        return self.reference.debugDescription
    }
}

extension Shadow: Hashable {
    
    public var hashValue: Int {
        
        return self.reference.hashValue
    }
}

extension Shadow: Equatable {
    
    public static func ==(lhs: Shadow, rhs: Shadow) -> Bool {
        
        return lhs.reference.isEqual(rhs.reference)
    }
}

extension Shadow: ReferenceConvertible {
    
    public typealias ReferenceType = NSShadow
}

extension Shadow: _ObjectiveCBridgeable {
    
    public typealias _ObjectiveCType = NSShadow
    
    public func _bridgeToObjectiveC() -> NSShadow {
        
        return self.reference
    }
    
    public static func _forceBridgeFromObjectiveC(_ source: NSShadow, result: inout Shadow?) {
        
        if !self._conditionallyBridgeFromObjectiveC(source, result: &result) {
            
            fatalError("Unable to bridge \(_ObjectiveCType.self) to \(self)")
        }
    }
    
    public static func _conditionallyBridgeFromObjectiveC(_ source: NSShadow, result: inout Shadow?) -> Bool {
        
        result = Shadow(reference: source)
        
        return true
    }
    
    public static func _unconditionallyBridgeFromObjectiveC(_ source: NSShadow?) -> Shadow {
        
        var result: Shadow?
        
        self._forceBridgeFromObjectiveC(source!, result: &result)
        
        return result!
    }
}
