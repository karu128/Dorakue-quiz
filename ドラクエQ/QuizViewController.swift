//
//  QuizViewController.swift
//  ドラクエQ
//
//  Created by 小浜天紀 on 2016/01/15.
//  Copyright © 2016年 小浜天紀. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文を格納する配列
    var quizArray = [AnyObject]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一時的にクイズを格納
        var tmpArray = [AnyObject]()
        
//tmpArray.append(["問題","OO","OO","答え",3])

        tmpArray.append(["DQ３のゾーマの闇の衣を剥がすアイテムは？","オリハルコン","虹のしずく","光の玉",3])
        tmpArray.append(["DQ４のエスタークは何色？","オレンジ色","青色","黄色",2])
        tmpArray.append(["DQ７のガボは元々何だった？","ギガミュータント","狼","犬",2])
        tmpArray.append(["DQ（１）のルーラで行ける場所は？","ラダトームの城のみ","今まで行ったことのある町","ルーラは存在しない",1])
        tmpArray.append(["DQ８のレティスは別の世界で何と呼ばれていた？","ラーミア","馬姫","竜王",1])
        tmpArray.append(["DQ２ではザキとザラキどっちがでた？","同時","ザキ","ザラキ",3])
        tmpArray.append(["DQ５主人公の母親の名前は？","リュカ","マーサ","ゲマ",2])
        tmpArray.append(["DQ６のチャモロは何族？","リファ族","ゲント族","ホビット族",2])
        
        
    
        while (tmpArray.count > 0) {
            let index =  Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as! String
        choiceButtons1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


