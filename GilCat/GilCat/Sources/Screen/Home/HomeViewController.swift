//
//  HomeViewController.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import SwiftUI
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cat = viewModel?.catLists[0]
        let catSize = cat!.gilCatMapInformation.mapInformation.size.size
        
        let testImage = UIImage(named: cat!.imageName)
        let testImageView = UIImageView(image: testImage)
        
        contentView.addSubview(testImageView)
        testImageView.contentMode = .scaleAspectFit
        testImageView.frame.size = CGSize(width: catSize.width,
                                          height: catSize.height)
        
        testImageView.frame.origin = CGPoint(x: 128.3333282470703,
                                            y: 483.0)
        let catTouchGesture = UITapGestureRecognizer(target: self, action: #selector(catImageButtonTapped))
        testImageView.isUserInteractionEnabled = true
        testImageView.addGestureRecognizer(catTouchGesture)
    }
    
    @objc private func catImageButtonTapped() {
        viewModel?.catImageButtonTapped()
        print("catImageButtonTapped")
    }
    
}
