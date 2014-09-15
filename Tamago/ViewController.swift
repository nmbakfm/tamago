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
    @IBOutlet var eggCountDisplay: UILabel!
    
    var i = 0
    
    var eggCount: UInt = 0
    
    let niwatori_normal_image = [UIImage(named: "niwatori_01") as UIImage,UIImage(named: "niwatori_02") as UIImage]
    let niwatori_highlight_image = UIImage(named: "niwatori_born") as UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        niwatori.tintColor = UIColor.whiteColor()
        eggCount = 0
        eggCountDisplay.text = String(eggCount)
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("updateHen"), userInfo: nil, repeats: true)
        niwatori.setImage(niwatori_highlight_image, forState: .Highlighted)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countUp(sender: UIButton) {
        ++eggCount
        eggCountDisplay.text = String(eggCount)
        println(eggCount)
    }
    
    func updateHen(){
        i = (i+1)%2
        niwatori.setImage(niwatori_normal_image[i], forState: .Normal)
    }
}

