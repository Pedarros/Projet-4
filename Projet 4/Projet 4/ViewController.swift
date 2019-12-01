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
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Button4th: UIButton!
    
    
    @IBOutlet weak var Button2nd: UIButton!
    
    @IBAction func ndButtonHyde(_ sender: Any) {
        Button2nd.isHidden = true
        
    }
    
    @IBAction func Button4hyde(_ sender: Any) {
        Button4th.isHidden = true
    }
    
    @IBOutlet weak var LowerLeftButton: UIButton!
    
    @IBOutlet weak var LowerMiddleButton: UIButton!
    
    @IBOutlet weak var LowerRightButton: UIButton!
    
    @IBAction func LLBSelected(_ sender: Any) {
        LowerLeftButton.imageView?.isHidden = false
    }
    
}


