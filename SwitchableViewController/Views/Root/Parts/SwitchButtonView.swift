//
//  SwitchButtonView.swift
//  SwitchableViewController
//
//  Created by ichikawa on 2020/10/31.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

final class SwitchButtonView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }

    private func configure() {
        let nib = UINib(nibName: "SwitchButtonView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        addSubview(view)
    }
}
