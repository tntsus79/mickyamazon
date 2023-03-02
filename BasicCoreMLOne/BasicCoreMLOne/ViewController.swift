//
//  ViewController.swift
//  BasicCoreMLOne

//

import UIKit
import CoreML
import Vision


class ViewController: UIViewController {

    override func viewDidLoad() {
        
        var resnetModel = Resnet50(model: <#T##MLModel#>)
        @IBOutlet weak var imageView: UIImageView!
        func classifyPicture (image: UIImage){
            
        }
        override func viewDidLoad() {
        super.viewDidLoad()
            if let image = imageView.image {
                classifyPicture(image: image:image)
            }
    }


}

