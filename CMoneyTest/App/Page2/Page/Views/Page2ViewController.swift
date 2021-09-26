//
//  Page2ViewController.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/24.
//

import UIKit
import MVVM

class Page2ViewController: UIViewController, Viewer, Progressor {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private var cellWidth: CGFloat {
        let count: CGFloat = 4
        let horizontalMargin: CGFloat = 8
        let space: CGFloat = 1 * (count - 1)
        let width: CGFloat = collectionView.bounds.size.width - horizontalMargin - space
        return width / count
    }
    
    typealias ViewModelType = Page2ViewModel
    var viewModel: ViewModelType! {
        didSet {
            showProgress(isUpdate: viewModel.isUpdate)
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModelType(binder: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        handlePrepare(for: segue, sender: sender)
    }
    
    func showProgress(isUpdate: Bool) {
        activityIndicator.isHidden = !isUpdate
    }
}

extension Page2ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let id: String = "\(type(of: viewModel.cellViewModels[indexPath.row]))"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! (UICollectionViewCell & Binder)
        cell.dataContext = viewModel.cellViewModels[indexPath.row]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let navigationParameter = Page3NavigationParmaeter(model: viewModel.cellViewModels[indexPath.row].model)
        performSegue(withIdentifier: "\(Page3ViewController.self)", sender: navigationParameter)
    }
}

