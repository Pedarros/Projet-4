//
//  ViewController.swift
//  Projet 4
//
//  Created by Pedarros Emile on 13/11/2019.
//  Copyright © 2019 Pedarros Emile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let image = UIImagePickerController()
    
    
    @IBOutlet weak var Button1st: UIButton!
    @IBOutlet weak var Button2nd: UIButton!
    @IBOutlet weak var Button3rd: UIButton!
    @IBOutlet weak var Button4th: UIButton!
    
   
    @IBAction func Button2ndHyde(_ sender: Any) {
        Button2nd.isHidden = true
        Button4th.isHidden = false
    }
    
    
    @IBAction func Button4hyde(_ sender: Any) {
        Button4th.isHidden = true
        Button2nd.isHidden = false
    }
    
    @IBAction func NoneButtonHyden(_ sender: Any) {
        Button4th.isHidden = false
        Button2nd.isHidden = false
    }
    
    @IBOutlet weak var LowerLeftButton: UIButton!
    
    @IBOutlet weak var LowerMiddleButton: UIButton!
    
    @IBOutlet weak var LowerRightButton: UIButton!
    

    
    @IBAction func LLBSelected(_ sender: Any) {
        LowerLeftButton.imageView?.isHidden = false
        LowerMiddleButton.imageView?.isHidden = true
        LowerRightButton.imageView?.isHidden = true
    }
    
    @IBAction func LMBSelected(_ sender: Any) {
        LowerMiddleButton.imageView?.isHidden = false
        LowerLeftButton.imageView?.isHidden = true
        LowerMiddleButton.imageView?.isHidden = true
    }
    
    @IBAction func LRBSelected(_ sender: Any) {
        LowerRightButton.imageView?.isHidden = false
        LowerLeftButton.imageView?.isHidden = true
        LowerMiddleButton.imageView?.isHidden = true
    }
    
    
    @IBAction func UploadImageTopleft(_ sender: Any) {
        
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    @IBAction func UploadImageTopRight(_ sender: Any) {
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    @IBAction func UploadImageBottomLeft(_ sender: Any) {
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    @IBAction func UploadImageBottomRight(_ sender: Any) {
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
}


