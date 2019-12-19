//
//  ViewController.swift
//  Projet 4
//
//  Created by Pedarros Emile on 13/11/2019.
//  Copyright © 2019 Pedarros Emile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        image.delegate = self
        image.allowsEditing = true
        // Do any additional setup after loading the view.
    }
    let image = UIImagePickerController()
    
    var imageTmp =  UIButton()
    @IBOutlet weak var Button1st: UIButton!
    @IBOutlet weak var Button2nd: UIButton!
    @IBOutlet weak var Button3rd: UIButton!
    @IBOutlet weak var Button4th: UIButton!
    
   
    @IBAction func Button2ndHyde(_ sender: Any) {
        Button2nd.isHidden = true
        Button4th.isHidden = false
    }
    
    @IBAction func Button4thhyde(_ sender: Any) {
        Button4th.isHidden = true
        Button2nd.isHidden = false
    }
    
    @IBAction func NonbuttonHyden(_ sender: Any) {
        Button4th.isHidden = false
        Button2nd.isHidden = false
    }
    
    @IBOutlet weak var LowerLeftButton: UIButton!
    
    @IBOutlet weak var LowerMiddleButton: UIButton!
    
    @IBOutlet weak var LowerRightButton: UIButton!
    
   
    
    
    @IBAction func LLBSelected(_ sender: Any) {
         LowerLeftButton.setBackgroundImage(UIImage(named: "Selected"), for: .normal)
        LowerMiddleButton.setBackgroundImage(UIImage(named: "Layout 2"), for: .normal)
        LowerRightButton.setBackgroundImage(UIImage(named: "Layout 3"), for: .normal)
        }
        
    
    
    @IBAction func LMBSelected(_ sender: Any) {
        LowerMiddleButton.setBackgroundImage(UIImage(named: "Selected"), for: .normal)
        LowerLeftButton.setBackgroundImage(UIImage(named: "Layout 1"), for: .normal)
        LowerRightButton.setBackgroundImage(UIImage(named: "Layout 3"), for: .normal)
        
    }
    
    @IBAction func LRBSelected(_ sender: Any) {
        LowerRightButton.setBackgroundImage(UIImage(named: "Selected"), for: .normal)
        LowerMiddleButton.setBackgroundImage(UIImage(named: "Layout 2"), for: .normal)
        LowerLeftButton.setBackgroundImage(UIImage(named: "Layout 1"), for: .normal)
        
    }
    
    
    @IBAction func UploadImageTopleft(_ sender: Any) {
        imageTmp = Button1st
        self.presentWithSource(source: .photoLibrary)
        
        
    }
    
    @IBAction func UploadImageTopRight(_ sender: Any) {
        imageTmp = Button2nd
        self.presentWithSource(source: .photoLibrary)
        
       
    }
    
    @IBAction func UploadImageBottomLeft(_ sender: Any) {
        imageTmp = Button4th
        self.presentWithSource(source: .photoLibrary)
        
        
    }
    
    @IBAction func UploadImageBottomRight(_ sender: Any) {
        imageTmp = Button3rd
        self.presentWithSource(source: .photoLibrary)
        
    
        
    }
    
    
    func presentWithSource(source: UIImagePickerController.SourceType) {
        image.sourceType = source
        present(image, animated: true, completion: nil)
    }
    
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // extention for presentWithSource function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let edite = info[.editedImage] as? UIImage {
            imageTmp.setBackgroundImage(edite, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
}

