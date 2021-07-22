//
//  Extensions.swift
//  DecimalConverter
//
//  Created by Takuto Nakamura on 2021/07/20.
//

import Cocoa

extension Int {
    
    var binaryFromDecimal: String {
        return String(self, radix: 2)
    }
    
    var octalFromDecimal: String {
        return String(self, radix: 8)
    }
    
    var hexadecimalFromDecimal: String {
        return String(self, radix: 16, uppercase: true)
    }
    
}

extension String {

    var decimalFromBinary: Int? {
        return Int(self, radix: 2)
    }
    
    var decimalFromOctal: Int? {
        return Int(self, radix: 8)
    }
    
    var decimalFromDecimal: Int? {
        return Int(self, radix: 10)
    }
    
    var decimalFromHexadecimal: Int? {
        return Int(self, radix: 16)
    }
    
}

extension NSTextField {
    
    func diff(_ textField: NSTextField) -> NSTextField? {
        return self !== textField ? self : nil
    }
    
}
