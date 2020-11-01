//
//  CustomNavigationController.swift
//  SwitchableViewController
//
//  Created by ichikawa on 2020/11/01.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

public final class CustomNavigationController: UINavigationController {

    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.setup()
    }

    public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.setup()
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
}

// MARK: - Setup
extension CustomNavigationController {

    private func setup() {
        self.interactivePopGestureRecognizer?.delegate = nil
        self.setupAppearance()
    }

    private func setupAppearance() {
        // バーの背景色
        self.navigationBar.barTintColor = UIColor(hex: "FFD728")
        self.navigationBar.isTranslucent = false
        
        self.navigationBar.titleTextAttributes = [
            // フォント
            NSAttributedString.Key.font: UIFont(name: "HiraginoSans-W6", size: 20),
            // 文字の色
            .foregroundColor: UIColor(hex: "fc1414")
        ]
    }
}
