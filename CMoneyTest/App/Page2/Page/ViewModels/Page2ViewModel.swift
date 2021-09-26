//
//  Page2ViewModel.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/24.
//

import WebAPI
import MVVM

struct Page2ViewModel: Refreshable, Updateable, MutatingClosure {

    weak var binder: Binder?
    
    var isUpdate: Bool = false
    
    private(set) var cellViewModels: [Page2CellViewModel] = []
    private(set) var model: MainApodModel? {
        didSet {
            guard let model = model else {
                return
            }

            cellViewModels = model.result.map { Page2CellViewModel(model: $0) }
        }
    }
    
    init(binder: Binder)
    {
        self.binder = binder
        refresh()
    }

    mutating func refresh() {

        isUpdate = true

        let parameter = MainApodParameter()
        let copySelf = self

        Task { @MainActor in
            do {
                let model: MainApodModel = try await MainApodWebAPI().invokeAsync(parameter)
                
                copySelf.mutating { (mutatingSelf: inout Page2ViewModel) in
                    mutatingSelf.isUpdate = false
                    mutatingSelf.model = model
                }
                
            } catch let error {

                print(error.localizedDescription)

                copySelf.mutating { (mutatingSelf: inout Page2ViewModel) in
                    mutatingSelf.isUpdate = false
                }
            }
        }
    }
}
