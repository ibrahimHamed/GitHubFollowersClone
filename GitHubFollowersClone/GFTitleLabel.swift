//
//  GFTitleLabel.swift
//  GitHubFollowersClone
//
//  Created by Ibrahim Hamed on 05/02/2022.
//

import UIKit

class GFTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }

    private func configure() {
        textColor = .label
        lineBreakMode = .byTruncatingTail
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        translatesAutoresizingMaskIntoConstraints = false
    }
}
