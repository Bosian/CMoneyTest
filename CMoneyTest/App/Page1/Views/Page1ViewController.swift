//
//  Page1ViewController.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/24.
//

import UIKit

class Page1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func handler(_ sender: UIButton) {
        self.performSegue(withIdentifier: "\(Page2ViewController.self)", sender: nil)
    }
}

