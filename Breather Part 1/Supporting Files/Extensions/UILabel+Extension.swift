//
//  UILabel+Extension.swift
//  Breather Part 1
//
//  Created by Alexandros Baramilis on 11/04/2019.
//  Copyright © 2019 Alexandros Baramilis. All rights reserved.
//

import UIKit

extension UILabel {
    /// Sets the attributedText of the label with an attributed string
    /// that subscripts all the decimal digits in the given text.
    func setAttributedTextWithSubscriptDecimalDigits(text: String) {
        let font = self.font!
        let subscriptFont = font.withSize(font.pointSize * 0.7)
        let subscriptOffset = -font.pointSize * 0.3
        let attributedString = NSMutableAttributedString(string: text,
                                                         attributes: [.font : font])
        for index in text.indicesOfDecimalDigits {
            let range = NSRange(location: index, length: 1)
            attributedString.setAttributes([.font: subscriptFont,
                                            .baselineOffset: subscriptOffset],
                                           range: range)
        }
        self.attributedText = attributedString
    }
}
