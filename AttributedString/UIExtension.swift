//
//  UIExtension.swift
//  AttributedString
//
//  Created by Arror on 2017/10/18.
//  Copyright © 2017年 Arror. All rights reserved.
//

import Foundation

extension UILabel {
    
    open var attributedTextEx: AttributedString? {
        set {
            self.attributedText = newValue as NSAttributedString?
        }
        get {
            return self.attributedText as AttributedString?
        }
    }
}

extension UIButton {
    
    open func setAttributedTitleEx(_ title: AttributedString?, for state: UIControlState) {
        
        self.setAttributedTitle(title as NSAttributedString?, for: state)
    }
    
    open func attributedTitleEx(for state: UIControlState) -> AttributedString? {
        
        return self.attributedTitle(for: state) as AttributedString?
    }
    
    open var currentAttributedTitleEx: AttributedString? {
        
        return self.currentAttributedTitle as AttributedString?
    }
}

extension UITextField {
    
    open var attributedTextEx: AttributedString? {
        set {
            self.attributedText = newValue as NSAttributedString?
        }
        get {
            return self.attributedText as AttributedString?
        }
    }
    
    open var attributedPlaceholderEx: AttributedString? {
        set {
            self.attributedPlaceholder = newValue as NSAttributedString?
        }
        get {
            return self.attributedPlaceholder as AttributedString?
        }
    }
}

extension UITextView {
    
    open var attributedTextEx: AttributedString? {
        set {
            self.attributedText = newValue as NSAttributedString?
        }
        get {
            return self.attributedText as AttributedString?
        }
    }
}
