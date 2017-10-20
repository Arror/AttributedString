//
//  Regular.swift
//  AttributedString
//
//  Created by Arror on 2017/10/20.
//  Copyright © 2017年 Arror. All rights reserved.
//

import Foundation

public struct Regular {
    
    let pattern: String
    let options: NSRegularExpression.Options
    let matchingOptions: NSRegularExpression.MatchingOptions
    
    public init(pattern: String, options: NSRegularExpression.Options, matchingOptions: NSRegularExpression.MatchingOptions) {
        
        self.pattern = pattern
        self.options = options
        self.matchingOptions = matchingOptions
    }
}

extension NSRegularExpression {
    
    public convenience init(regular: Regular) throws {
        
        try self.init(pattern: regular.pattern, options: regular.options)
    }
}
