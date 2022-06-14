//
//  HomeViewController.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import UIKit

class HomeViewController: UIViewController {
    let imageSize: CGSize = CGSize(width: 4000, height: 2250)
    let catSize: CGSize = CGSize(width: 70, height: 70)

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let testImage = UIImage(named: "cat_brown_1")
        let testImageView = UIImageView(image: testImage)
        
        contentView.addSubview(testImageView)
        testImageView.contentMode = .scaleAspectFit
        testImageView.frame.size = CGSize(width: catSize.width,
                                          height: catSize.height)
        
        testImageView.frame.origin = CGPoint(x: 128.3333282470703,
                                            y: 483.0)
    }
}
