//
//  PHTextField.swift
//  PlaseHolderedTextField
//
//  Created by Alexander Smetannikov on 09/02/2018.
//  Copyright © 2018 Alexander Smetannikov. All rights reserved.
//

import UIKit

@IBDesignable
class PHTextField: UIView {

    private let textField = UITextField()
    private let placeholderLabel = UILabel()
    
    // MARK: - Placeholder properties
    
    @IBInspectable var placeholder: String? {
        get { return placeholderLabel.text }
        set {
            placeholderLabel.text = newValue
            recalculateLayout()
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var placeholderFont: UIFont {
        get { return placeholderLabel.font }
        set {
            placeholderLabel.font = newValue
            recalculateLayout()
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var placeholderTextColor: UIColor? {
        get { return placeholderLabel.textColor }
        set { placeholderLabel.textColor = newValue }
    }
    
    @IBInspectable var placeholderBackgroundColor: UIColor? {
        get { return placeholderLabel.backgroundColor }
        set { placeholderLabel.backgroundColor = newValue }
    }
    
    // MARK: - Text field properties
    
    @IBInspectable var font: UIFont? {
        get { return textField.font }
        set { textField.font = newValue }
    }
    
    @IBInspectable var textColor: UIColor? {
        get { return textField.textColor }
        set { textField.textColor = newValue }
    }
    
    @IBInspectable override var backgroundColor: UIColor? {
        get { return textField.backgroundColor }
        set {
            textField.backgroundColor = newValue
            super.backgroundColor = newValue
        }
    }
    
    @IBInspectable var textAlignment: NSTextAlignment {
        get { return textField.textAlignment }
        set { textField.textAlignment = newValue }
    }
    
    private var _textOffset: CGFloat = 2.0
    
    @IBInspectable var textOffset: CGFloat {
        get { return _textOffset }
        set {
            if _textOffset != newValue {
                _textOffset = newValue
                // TODO: нужно перерисовать контрол
            }
        }
    }
    
    var textContentType: UITextContentType {
        get { return textField.textContentType }
        set { textField.textContentType = newValue }
    }
    
    var autocapitalizationType: UITextAutocapitalizationType {
        get { return textField.autocapitalizationType }
        set { textField.autocapitalizationType = newValue }
    }
    
    var autocorrectionType: UITextAutocorrectionType {
        get { return textField.autocorrectionType }
        set { textField.autocorrectionType = newValue }
    }
    
    var smartDashesType: UITextSmartDashesType {
        get { return textField.smartDashesType }
        set { textField.smartDashesType = newValue }
    }
    
    var smartInsertDeleteType: UITextSmartInsertDeleteType {
        get { return textField.smartInsertDeleteType }
        set { textField.smartInsertDeleteType = newValue }
    }
    
    var smartQuotesType: UITextSmartQuotesType {
        get { return textField.smartQuotesType }
        set { textField.smartQuotesType = newValue }
    }
    
    var spellCheckingType: UITextSpellCheckingType {
        get { return textField.spellCheckingType }
        set { textField.spellCheckingType = newValue }
    }
    
    
    
    // MARK: - Common properties
    
    private var _borderStyle: UITextBorderStyle = .none
    
    var borderStyle: UITextBorderStyle {
        get { return _borderStyle }
        set {
            if _borderStyle != newValue {
                setBorderStyle(newValue)
            }
        }
    }
    
    private func setBorderStyle(_ newValue: UITextBorderStyle) {
        _borderStyle = newValue
        switch _borderStyle {
        case .none:
            layer.cornerRadius = 0
            layer.borderWidth = 0
        case .line:
            layer.cornerRadius = 0
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
        case .bezel:
            layer.cornerRadius = 0
            layer.borderWidth = 1
            layer.borderColor = UIColor.gray.cgColor
        case .roundedRect:
            layer.cornerRadius = 5
            layer.borderWidth = 0
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(placeholderLabel)
        self.addSubview(textField)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(placeholderLabel)
        self.addSubview(textField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recalculateLayout()
    }
    
    private func recalculateLayout() {
        let placeholderWidth = placeholderLabel.intrinsicContentSize.width
        placeholderLabel.frame = CGRect(x: 0.0, y: 0.0, width: placeholderWidth, height: frame.size.height)
        let textFieldWidth = frame.size.width - placeholderWidth - _textOffset
        textField.frame = CGRect(x: placeholderWidth + _textOffset, y: 0.0, width: textFieldWidth, height: frame.size.height)
    }
    
}
