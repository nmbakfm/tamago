//
//  ViewController.swift
//  Tamago
//
//  Created by 南部 晃史 on 2014/09/15.
//  Copyright (c) 2014年 南部 晃史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var niwatori: UIButton!
    
    
    // Load Defaults
    let defaults = NSUserDefaults.standardUserDefaults()
    var eggCount: Int = NSUserDefaults.standardUserDefaults().integerForKey("eggCount")
    
    // Niwatori Images
    let niwatori_normal_image = [UIImage(named: "niwatori_01") as UIImage,UIImage(named: "niwatori_02") as UIImage]
    let niwatori_highlight_image = UIImage(named: "niwatori_born") as UIImage
    
    var niwatori_normal_image_count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup Niwatori
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("updateHen"), userInfo: nil, repeats: true) // set Niwatori Animation
        niwatori.setImage(niwatori_highlight_image, forState: .Highlighted) // set Niwatori Image when Tapped
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countUp(sender: UIButton) {
        ++eggCount
        defaults.setInteger(eggCount, forKey: "eggCount")
        println(eggCount)
    }
    
    func updateHen(){
        niwatori_normal_image_count = (niwatori_normal_image_count+1)%2
        niwatori.setImage(niwatori_normal_image[niwatori_normal_image_count], forState: .Normal)
    }
}

