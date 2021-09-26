//
//  Page3ViewController.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/24.
//

import UIKit
import MVVM

class Page3ViewController: UIViewController, Navigatable, Viewer {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    typealias ViewModelType = Page3ViewModel
    var viewModel: ViewModelType! {
        didSet {
            icon.setImage(urlString: viewModel.navigationParameter.model.hdurl)

            // From 2020-12-17 to 2020 Dec. 17

            if let date: Date = viewModel.navigationParameter.model.date.toDate("yyyy-MM-dd") {
                dateLabel.text = date.toString("yyyy MMM. dd")
            }

            titleLabel.text = viewModel.navigationParameter.model.title
            copyrightLabel.text = viewModel.navigationParameter.model.copyright
            descriptionLabel.text = viewModel.navigationParameter.model.description
        }
    }

    typealias NavigationParameterType = Page3NavigationParmaeter
    var navigationParameter: NavigationParameterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let navigationParameter = navigationParameter else {
            assertionFailure("Should not be nil")
            return
        }

        viewModel = ViewModelType(navigationParameter: navigationParameter)
    }
}

