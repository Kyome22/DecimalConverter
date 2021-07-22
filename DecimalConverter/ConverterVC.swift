//
//  ConverterVC.swift
//  DecimalConverter
//
//  Created by Takuto Nakamura on 2021/07/22.
//

import Cocoa

class ConverterVC: NSViewController {
    
    @IBOutlet weak var binaryTextField: NSTextField!
    @IBOutlet weak var octalTextField: NSTextField!
    @IBOutlet weak var decimalTextField: NSTextField!
    @IBOutlet weak var hexadecimalTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binaryTextField.delegate = self
        octalTextField.delegate = self
        decimalTextField.delegate = self
        hexadecimalTextField.delegate = self
    }
    
    @IBAction func openMenu(_ sender: NSButton) {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "0b0xについて",
                                action: #selector(openAbout(_:)),
                                keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "0b0xを終了",
                                action: #selector(NSApp.terminate(_:)),
                                keyEquivalent: ""))
        NSMenu.popUpContextMenu(menu, with: NSApp.currentEvent!, for: sender)
    }
    
    @objc func openAbout(_ sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)
        let mutableAttrStr = NSMutableAttributedString()
        var attr: [NSAttributedString.Key : Any] = [.foregroundColor : NSColor.textColor]
        let message = "0b0xはオープンソースソフトウェアです。\n"
        mutableAttrStr.append(NSAttributedString(string: message, attributes: attr))
        let url = "https://github.com/Kyome22/DecimalConverter"
        attr = [.foregroundColor : NSColor.url, .link : url]
        mutableAttrStr.append(NSAttributedString(string: url, attributes: attr))
        let key = NSApplication.AboutPanelOptionKey.credits
        NSApp.orderFrontStandardAboutPanel(options: [key: mutableAttrStr])
    }
    
}

extension ConverterVC: NSTextFieldDelegate {
    
    func controlTextDidChange(_ obj: Notification) {
        guard let textField = obj.object as? NSTextField else { return }
        var decimal: Int? = nil
        if textField === binaryTextField {
            decimal = binaryTextField.stringValue.decimalFromBinary
        } else if textField === octalTextField {
            decimal = octalTextField.stringValue.decimalFromOctal
        } else if textField === decimalTextField {
            decimal = decimalTextField.stringValue.decimalFromDecimal
        } else if textField === hexadecimalTextField {
            decimal = hexadecimalTextField.stringValue.decimalFromHexadecimal
        }
        if let decimal = decimal {
            binaryTextField.diff(textField)?.stringValue = decimal.binaryFromDecimal
            octalTextField.diff(textField)?.stringValue = decimal.octalFromDecimal
            decimalTextField.diff(textField)?.stringValue = String(decimal)
            hexadecimalTextField.diff(textField)?.stringValue = decimal.hexadecimalFromDecimal
        } else {
            binaryTextField.diff(textField)?.stringValue = ""
            octalTextField.diff(textField)?.stringValue = ""
            decimalTextField.diff(textField)?.stringValue = ""
            hexadecimalTextField.diff(textField)?.stringValue = ""
        }
    }
    
}
