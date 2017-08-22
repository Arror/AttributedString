//
//  ViewController.swift
//  Sample
//
//  Created by Arror on 2017/8/22.
//  Copyright © 2017年 Arror. All rights reserved.
//

import UIKit
import AttributedString

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str1 = AttributedString(string: "Hallo world!", attributes: .foregroundColor(.red), .font(.systemFont(ofSize: 24.0)))
        
        var str2 = str1
        
        str2.set(attributes: .foregroundColor(.green), range: str2.startIndex..<str2.endIndex)
        
        self.label1.attributedText = str1 as NSAttributedString
        self.label2.attributedText = str2 as NSAttributedString
    }
}

