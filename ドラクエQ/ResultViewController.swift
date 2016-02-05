//
//  ResultViewController.swift
//  ドラクエQ
//
//  Created by 小浜天紀 on 2016/01/15.
//  Copyright © 2016年 小浜天紀. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    var correctAnswer: Int = 0
    
    //結果を表示
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var seikairitsu: UILabel!
    
    @IBOutlet var kyu: UILabel!
    
    @IBOutlet var koment: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        
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
