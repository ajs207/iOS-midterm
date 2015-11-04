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
        
         var data: Dictionary<String, String>? = {
            guard let path = NSBundle.mainBundle().pathForResource("TREES", ofType: "plist") else {
                print("Invalid path for plist")
                return nil
            }
            
            return NSDictionary(contentsOfFile: path) as? Dictionary<String, String>
        }()
        print(data!["Cotton Tree"])
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = NSURL(string: data![dataObject]!) {
            if let data = NSData(contentsOfURL: url){
                treePic.contentMode = UIViewContentMode.Center
                treePic.contentMode = UIViewContentMode.ScaleAspectFill
                treePic.image = UIImage(data: data)
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
//check for commit

}

