//
//  MWHerosDetailViewController.swift
//  OutlawsOfTheMarsh
//
//  Created by Tiny on 15/5/18.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

import UIKit

class MWHerosDetailViewController: UIViewController {

    var data:MWHerosData?
    
    @IBOutlet var heroImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        heroImageView.image = UIImage(named: data!.picName, inBundle: NSBundle.mainBundle(), compatibleWithTraitCollection: UITraitCollection?())

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
