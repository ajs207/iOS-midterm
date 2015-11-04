//
//  DataViewController.swift
//  iOS midterm
//
//  Created by Scott,Andrew on 11/3/15.
//  Copyright © 2015 Scott,Andrew. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
//outlet for page title
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var treePic: UIImageView!
    
    var dataObject: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load TREES plist into dictionary
         var treeData: Dictionary<String, String>? = {
            guard let path = NSBundle.mainBundle().pathForResource("TREES", ofType: "plist") else {
                print("Invalid path for plist")
                return nil
            }
            
            return NSDictionary(contentsOfFile: path) as? Dictionary<String, String>
        }()
        
        
        
        //set url to picture url in plist
        if let url = NSURL(string: treeData![dataObject]!) {
            
            //set picture for page to image from plist
            if let treeData = NSData(contentsOfURL: url){
                treePic.contentMode = UIViewContentMode.Center
                treePic.contentMode = UIViewContentMode.ScaleAspectFill
                treePic.image = UIImage(data: treeData)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//Set page title
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel?.text = dataObject
    }


}

