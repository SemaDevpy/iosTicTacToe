//
//  ViewController.swift
//  ticTacToe
//
//  Created by Syimyk on 9/25/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let grey = UIColor(red:0.32, green: 0.34, blue: 0.36, alpha: 1.0)
        myButton.layer.borderColor = grey.cgColor
        myButton.layer.borderWidth = 2.0
    }
    
    
}

