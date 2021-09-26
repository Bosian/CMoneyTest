//
//  Page2Cell.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/24.
//  
//

import UIKit
import MVVM

class Page2Cell: UICollectionViewCell, Viewer {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var gradient: UIView!
    
    typealias ViewModelType = Page2CellViewModel
    var viewModel: ViewModelType! {
        didSet {
            titleLabel.text = viewModel.model.title
            icon.setImage(urlString: viewModel.model.url, placeholder: UIImage(named: "swiftIcon"))
            gradient.updateGradientLayer()
        }
    }

    override func layoutSubviews() {

        gradient.updateGradientLayer()

        super.layoutSubviews()
    }
}
