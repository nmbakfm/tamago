//
//  ViewController.swift
//  Tamago
//
//  Created by 南部 晃史 on 2014/09/15.
//  Copyright (c) 2014年 南部 晃史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let _TAMAGO_TAG = 1
    
    
    @IBOutlet var niwatori: UIButton!
    // Load Defaults
    let defaults = NSUserDefaults.standardUserDefaults()
    var eggCount: Int = NSUserDefaults.standardUserDefaults().integerForKey("eggCount")
    
    // Niwatori Images
    let niwatori_normal_image = [UIImage(named: "niwatori_01") as UIImage,UIImage(named: "niwatori_02") as UIImage]
    let niwatori_highlight_image = UIImage(named: "niwatori_born") as UIImage
    
    var niwatori_normal_image_count = 0
    
    // Egg Image
    let egg_image = UIImage(named: "egg_01")
    let egg_image_width:CGFloat = 60
    let egg_image_height:CGFloat = 90
    
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup Niwatori
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("updateNiwatori"), userInfo: nil, repeats: true) // set Niwatori Animation
        niwatori.setImage(niwatori_highlight_image, forState: .Highlighted) // set Niwatori Image when Tapped
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countUp(sender: UIButton) {
        ++eggCount
        var new_egg_image_x = niwatori.frame.origin.x+niwatori.frame.size.width/2-egg_image_width/2
        var new_egg_image_y = niwatori.frame.origin.y+niwatori.frame.size.height/2-egg_image_height/2
        var new_egg = UIButton(frame: CGRectMake(new_egg_image_x, new_egg_image_y, new_egg_image_x/2, new_egg_image_y/2))
        new_egg.setImage(egg_image, forState: .Normal)
        new_egg.addTarget(self, action: "eggBreak:", forControlEvents: .TouchUpInside)
        new_egg.tag = _TAMAGO_TAG
        UIView.animateWithDuration(
            0.1,
            delay: 0,
            options: .CurveLinear,
            animations: {
            new_egg.frame.origin.x = 150
            new_egg.frame.origin.y = 200
            },
            completion: {
                (value: Bool) in
                UIView.animateWithDuration(
                    1,
                    delay: 0,
                    options: .CurveLinear,
                    animations: {
                        new_egg.transform = CGAffineTransformMakeRotation(3.14)
                        new_egg.frame.origin.x = 190
                    },
                    completion:{
                        (value: Bool) in
                        UIView.animateWithDuration(
                            1,
                            delay: 0,
                            options: .CurveEaseOut,
                            animations: {
                                new_egg.transform = CGAffineTransformMakeRotation(6.27)
                                new_egg.frame.origin.x = 220
                            },
                            completion:nil
                        )
                    }
                )
            }
        )
        self.view.addSubview(new_egg)
        self.view.bringSubviewToFront(niwatori)
        defaults.setInteger(0, forKey: "eggCount")
    }
    
    func eggBreak(sender: AnyObject){
        println("break")
    }
    
    func updateNiwatori(){
        niwatori_normal_image_count = (niwatori_normal_image_count+1)%2
        niwatori.setImage(niwatori_normal_image[niwatori_normal_image_count], forState: .Normal)
    }
}

