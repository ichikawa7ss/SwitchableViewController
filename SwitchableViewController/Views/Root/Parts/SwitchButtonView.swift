//
//  SwitchButtonView.swift
//  SwitchableViewController
//
//  Created by ichikawa on 2020/10/31.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

final class SwitchButtonView: UIView {

    @IBOutlet private weak var firstButtonView: UIView! {
        didSet {
            firstButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFirstButtonView)))
        }
    }
    @IBOutlet private weak var secondButtonView: UIView! {
        didSet {
            secondButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSecondButtonView)))
        }
    }
    
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
    
    func setup() {
        // 回転したときに正対して見えるように予め画像を反転させておく
        self.secondButtonView.transform = CGAffineTransform(rotationAngle: .pi)
    }
}

// MARK: - Event
extension SwitchButtonView {
    @objc
    private func tapFirstButtonView() {
        self.rotate(type: .toSearch)
    }
    
    @objc
    private func tapSecondButtonView() {
        self.rotate(type: .toHome)
    }
    
    private func rotate(type: ContentType.DestinationButtonType) {
        UIView.animate(withDuration: 0.3) {
            switch type {
            case .toSearch:
                // 検索画面への遷移だったら時計回りで回転
                self.transform = CGAffineTransform(rotationAngle: -.pi * 0.999) // 反転時は時計回りにしたいので半回転しきらないようにしておく
            case .toHome:
                // ホーム画面への遷移だったら反時計回りで戻す
                self.transform = .identity
            }
        }

    }
}

/// スイッチングで表示するコンテンツのタイプ
enum ContentType: Int {
    case home
    case search
    
    /// セットで表示する遷移先を示すボタンのタイプ.
    enum DestinationButtonType {
        case toSearch
        case toHome
        
        var toContentType: ContentType {
            switch self {
            case .toSearch:
                return .search
            case .toHome:
                return .home
            }
        }
    }
    
    var buttonType: DestinationButtonType {
        switch self {
        case .home:
            return .toSearch
        case .search:
            return .toHome
        }
    }
}
