//
//  HomeContainer.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import SwiftUI

struct HomeContainer: UIViewControllerRepresentable {
    @ObservedObject var viewModel: HomeViewModel
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboardName = String(describing: "HomeViewController")
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: storyboardName)
        guard let homeViewContoller = controller as? HomeViewController else { fatalError() }
        homeViewContoller.viewModel = viewModel
        return homeViewContoller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
