//
//  Page3ViewModel.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/25.
//

struct Page3ViewModel {
    typealias NavigationParameterType = Page3NavigationParmaeter

    let navigationParameter: NavigationParameterType
    
    init(navigationParameter: NavigationParameterType) {
        self.navigationParameter = navigationParameter
    }
}
