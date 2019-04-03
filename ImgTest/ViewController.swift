//
//  ViewController.swift
//  ImgTest
//
//  Created by Tanner Campbell on 3/27/19.
//  Copyright © 2019 Tanner Campbell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    // Num of albums guessed
    @IBOutlet weak var numAlbums: UITextField!

    // Result Label
    @IBOutlet weak var resultLabel: UILabel!
    
    // Action Event
    @IBAction func btnSubmit(_ sender: Any) {
        // do something ...
        if let numAlbums = numAlbums.text {
            if let albumNums = Int(numAlbums) {
                let totalAlbumNums = 13;
                resultLabel.text = "Correct answer is " + String(totalAlbumNums)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

