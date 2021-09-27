//
//  Page2ViewModel.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/24.
//

import WebAPI
import MVVM

final class Page2ViewModel: ObservableObject, Refreshable, Updateable {

    @Published var isUpdate: Bool = false
    
    @Published private(set) var cellViewModels: [Page2CellViewModel] = []
    @Published private(set) var model: MainApodModel? {
        didSet {
            guard let model = model else {
                return
            }

            cellViewModels = model.result.map { Page2CellViewModel(model: $0) }
        }
    }
    
    init()
    {
        refresh()
    }

    func refresh() {

        isUpdate = true

        let parameter = MainApodParameter()

        Task { @MainActor in
            do {
                let model: MainApodModel = try await MainApodWebAPI().invokeAsync(parameter)
                
                isUpdate = false
                self.model = model
                
            } catch let error {

                print(error.localizedDescription)

                isUpdate = false
            }
        }
    }
}
