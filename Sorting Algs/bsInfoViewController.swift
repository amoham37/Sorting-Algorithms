//
//  bsInfoViewController.swift
//  Sorting Algs
//
//  Created by Ahmet Mohammed on 8/10/19.
//  Copyright © 2019 Ahmet. All rights reserved.
//

import UIKit

class bsInfoViewController: UIViewController {

    @IBOutlet weak var gifView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(asset: "bubble")
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
