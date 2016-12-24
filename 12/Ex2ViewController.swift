//
//  Ex2ViewController.swift
//  12
//
//  Created by LuanNX on 12/23/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import UIKit

class Ex2ViewController: UIViewController {

    @IBOutlet weak var textRand: UITextField!
    var rand:Int!
    @IBAction func touch(_ sender: Any) {
        rand = Int(arc4random_uniform(1000))
        let text:String = "\(rand!)"
        textRand.text = text
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
