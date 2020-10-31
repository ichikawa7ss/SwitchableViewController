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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.switchButtonView.setup()
    }
}
