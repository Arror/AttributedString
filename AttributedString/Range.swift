//
//  Range.swift
//  AttributedString
//
//  Created by Arror on 2017/8/6.
//  Copyright © 2017年 Arror. All rights reserved.
//

import Foundation

extension NSRange {
    
    init(range: Range<String.Index>, in str: String) {
        
        guard
            let start = range.lowerBound.samePosition(in: str)?.encodedOffset,
            let end = range.upperBound.samePosition(in: str)?.encodedOffset, end >= start else {
                
                fatalError("Out of range.")
        }
        
        self.init(location: start, length: end - start)
    }
}
