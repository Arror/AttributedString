//
//  Attribute.swift
//  AttributedString
//
//  Created by Arror on 2017/8/16.
//  Copyright © 2017年 Arror. All rights reserved.
//

import Foundation

public enum Attribute {
    
    case font(UIColor)
    case paragraphStyle(NSParagraphStyle)
    case foregroundColor(UIColor)
    case backgroundColor(UIColor)
    case ligature(Int)
    case kern(Float)
    case strikethroughStyle(Int)
    case underlineStyle(Int)
    case strokeColor(UIColor)
    case strokeWidth(Float)
    case shadow(NSShadow)
    case textEffect(String)
    case attachment(NSTextAttachment)
    case link(URL)
    case baselineOffset(Float)
    case underlineColor(UIColor)
    case strikethroughColor(UIColor)
    case obliqueness(Float)
    case expansion(Float)
    case writingDirection(Any)
    case verticalGlyphForm(Any)
    
    var key: NSAttributedStringKey {
        switch self {
        case .font:
            return .font
        case .paragraphStyle:
            return .paragraphStyle
        case .foregroundColor:
            return .foregroundColor
        case .backgroundColor:
            return .backgroundColor
        case .ligature:
            return .ligature
        case .kern:
            return .kern
        case .strikethroughStyle:
            return .strikethroughStyle
        case .underlineStyle:
            return .underlineStyle
        case .strokeColor:
            return .strokeColor
        case .strokeWidth:
            return .strokeWidth
        case .shadow:
            return .shadow
        case .textEffect:
            return .textEffect
        case .attachment:
            return .attachment
        case .link:
            return .link
        case .baselineOffset:
            return .baselineOffset
        case .underlineColor:
            return .underlineColor
        case .strikethroughColor:
            return .strikethroughColor
        case .obliqueness:
            return .obliqueness
        case .expansion:
            return .expansion
        case .writingDirection:
            return .writingDirection
        case .verticalGlyphForm:
            return .verticalGlyphForm
        }
    }
    
    var value: Any {
        switch self {
        case .font(let v):
            return v
        case .paragraphStyle(let v):
            return v
        case .foregroundColor(let v):
            return v
        case .backgroundColor(let v):
            return v
        case .ligature(let v):
            return v
        case .kern(let v):
            return v
        case .strikethroughStyle(let v):
            return v
        case .underlineStyle(let v):
            return v
        case .strokeColor(let v):
            return v
        case .strokeWidth(let v):
            return v
        case .shadow(let v):
            return v
        case .textEffect(let v):
            return v
        case .attachment(let v):
            return v
        case .link(let v):
            return v
        case .baselineOffset(let v):
            return v
        case .underlineColor(let v):
            return v
        case .strikethroughColor(let v):
            return v
        case .obliqueness(let v):
            return v
        case .expansion(let v):
            return v
        case .writingDirection(let v):
            return v
        case .verticalGlyphForm(let v):
            return v
        }
    }
}

extension Collection where Self.Element == Attribute {
    
    var nsAttributes: [NSAttributedStringKey: Any] {
        
        var dict: [NSAttributedStringKey: Any] = [:]
        
        self.forEach { attribute in
            dict[attribute.key] = attribute.value
        }
        
        return dict
    }
}
