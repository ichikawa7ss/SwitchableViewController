//
//  RootViewController.swift
//  SwitchableViewController
//
//  Created by ichikawa on 2020/10/31.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

    @IBOutlet private weak var switchButtonView: SwitchButtonView!
    @IBOutlet private weak var containerView: UIView!
    
    var chiledViewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.switchButtonView.setup()
        self.setContentViewController(contentType: .home)
    }
}

// MARK: - setup
extension RootViewController {
    /// 指定されたコンテンツのVCにアニメーション遷移する
    /// - Parameter contentType: 表示するコンテンツ home/search
    private func setContentViewController(contentType: ContentType) {
        let vc = self.chiledViewControllers[contentType.rawValue]
        self.addChild(vc)
        let currentView = self.containerView.subviews.first ?? UIView()
        UIView.transition(
            from: currentView,
            to: vc.view,
            duration: 0.5,
            options: .transitionCrossDissolve,
            completion: { [weak self] _ in
                guard let `self` = self else { return }
                // addChildをしたあとはトランジションが完了したらdidMoveを呼ばなきゃいけない
                // 呼んでいない場合、追加したViewControllerのviewWillAppear:が動作しない場合がある
                vc.didMove(toParent: self)
                if let view = self.containerView.subviews.first {
                    // 制約をつけ直す
                    view.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
                    view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
                    view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
                    view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
                }
        })
    }
}
