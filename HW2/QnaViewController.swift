//
//  QnaViewController.swift
//  HW2
//
//  Created by User18 on 2018/11/29.
//  Copyright © 2018 User18. All rights reserved.
//

import UIKit

struct Qna {
    var question:String
    var answer:[String]
    var correctAnswer:Int
}

class QnaViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet var selectButton: [UIButton]!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var firstImage: UILabel!
    @IBOutlet weak var topImage: UILabel!
    
    var numQuesion = 0           //題數
    var correctAnswerNumber = 0  //正確答案
    var myScore = 0              //分數
    var waringNumber = 0         //不超過總題數

    var quesionArray = [Qna (question:"古人有云：讀書三上，馬上、枕上、廁上，請問這位古人是誰？", answer:["1. 韓愈","2. 蘇軾","3. 歐陽脩","4. 柳宗元"], correctAnswer: 3),//1
        Qna (question:"1～20的連續整數相乘所得的積其末位會有幾個零？", answer:["1. 4","2. 5","3. 7","4. 8"], correctAnswer: 1),//2
        Qna (question:"彈塗魚在陸上活動時，是用什麼在呼吸？", answer:["1. 鰓","2. 嘴巴","3. 鼻子","4. 皮膚"], correctAnswer: 4),//3
        Qna (question:"蜘蛛會吐絲結網捕捉獵物，那他所吐的絲其實是？", answer:["1. 腹部的黏液","2. 嘴裡的口水","3. 前肢紡絲器黏液","4. 肛門的分泌物"], correctAnswer: 1),//4
        Qna (question:"紅綠燈的『小綠人』是台灣人發明的那紅綠燈最初是哪一國人發明的？", answer:["1. 美國","2. 英國","3. 法國","4. 德國"], correctAnswer: 2),//5
        Qna (question:"恰似一江春水向東流。出自何人之筆？", answer:["1. 李煜","2. 李清照","3. 李白","4. 李商隱"], correctAnswer: 1),//6
        Qna (question:"俚語out of blue 可以翻譯為？", answer:["1. 豁然開朗","2. 出乎意料","3. 心滿意足","4. 每況愈下"], correctAnswer: 2),//7
        Qna (question:"無理數是指除有理數以外的實數，第ㄧ個被發現的無理數是?", answer:["1. sin45度","2. log3","3. 圓周率π","4. √2"], correctAnswer: 4),//8
        Qna (question:"月球以大約多少天的週期完整的繞行軌道一周？", answer:["1. 17天","2. 27天","3. 37天","4. 47天"], correctAnswer: 2),//9
        Qna (question:"請由先至後排序鐵人三項運動競賽的順序？", answer:["1. ABC","2. ACB","3. CBA","4. BCA"], correctAnswer: 3),//10
        Qna (question:"我們常用PK來表示對決之意，請問此用法中的PK原文是？", answer:["1. people kill","2. penalty kick","3. power keystone", "4. penetrate knock"], correctAnswer: 2),//11
        Qna (question:"台語諺語：長工望下雨，乞食望什麼？", answer:["1. 好日","2. 辦桌","3. 普渡", "4. 祭拜"], correctAnswer: 3),//12
        Qna (question:"世界名畫『創世紀』的作者是？", answer:["1. 米開朗基羅","2. 達文西","3. 拉斐爾", "4. 梵谷"], correctAnswer: 1),//13
        Qna (question:"我們習慣用坪來說房屋面積，請問 １坪 是幾平方公尺？", answer:["1. 5.205","2. 4.484","3. 3.306", "4. 2.789"], correctAnswer: 3),//14
        Qna (question:"小白兔的眼睛是紅色的的，是因為小白兔？", answer:["1. 紅蘿蔔吃太多","2. 他有寫輪眼","3. 體內分泌膽紅素", "4. 眼球內血液的眼色"], correctAnswer: 4),//15
        Qna (question:"某一年的五月份中，剛好有5個星期五，而且日期數字相加的和等於80，請問這個月1號是星期幾？", answer:["1. 星期一","2. 星期二","3. 星期三", "4. 星期四"], correctAnswer: 4),//16
        Qna (question:"請問人的血管本身是什麼顏色？", answer:["1. 紅色","2. 白色","3. 綠色", "4. 藍色"], correctAnswer: 2),//17
        Qna (question:"請問哈利波特中葛來分多的圖騰是哪種動物？", answer:["1. 獅子","2. 海蛇","3. 狐獾", "4. 老鷹"], correctAnswer: 1),//18
        Qna (question:"下列哪一種品種的狗被稱爲世界上最聰明的狗？", answer:["1. 拉不拉多","2. 邊境牧羊犬","3. 德國牧羊犬", "4. 黃金獵犬"], correctAnswer: 1),//19
        Qna (question:"因『晝寢』而被孔子批評為朽木不可雕也的是誰？", answer:["1. 子路","2. 宰我","3. 顏淵", "4. 冉有"], correctAnswer: 2),//20
        
       ]
    
    @IBAction func nextButton(_ sender: UIButton) {
        nextact()
    }
    
    @IBAction func button1(_ sender: UIButton) {
        if correctAnswerNumber == 1{
            myScore += 10
            score.text = "獎金： \(myScore)"
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }
        else{
            myScore -= 10
            score.text = "獎金： \(myScore)"
            if(waringNumber < 10){
                nextact()
            }
            
        }
        if waringNumber == 10{
            waringNumber = 0
            warning()
        }
    }
    
    @IBAction func button2(_ sender: UIButton) {
        if correctAnswerNumber == 2{
            myScore += 10
            score.text = "獎金： \(myScore)"
            button1.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }
        else{
            myScore -= 10
            score.text = "獎金： \(myScore)"
            if(waringNumber < 10){
                nextact()
            }
            
        }
        if waringNumber == 10{
            waringNumber = 0
            warning()
        }
    }
    
    @IBAction func button3(_ sender: UIButton) {
        if correctAnswerNumber == 3{
            myScore += 10
            score.text = "獎金： \(myScore)"
            button1.isHidden = true
            button2.isHidden = true
            button4.isHidden = true
        }
        else{
            myScore -= 10
            score.text = "獎金： \(myScore)"
            if(waringNumber < 10){
                nextact()
            }
            
        }
        if waringNumber == 10{
            waringNumber = 0
            warning()
        }
    }
    
    @IBAction func button4(_ sender: UIButton) {
        if correctAnswerNumber == 4{
            myScore += 10
            score.text = "獎金： \(myScore)"
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
        }
        else{
            myScore -= 10
            score.text = "獎金： \(myScore)"
            if(waringNumber < 10){
                nextact()
            }
        }
        if waringNumber == 10{
            waringNumber = 0
            warning()
        }
    }
    
    func playAgain () {
        question.isHidden = true
        questionNumber.isHidden = true
        firstImage.isHidden = false
        topImage.isHidden = false
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        numQuesion = 0
        myScore = 0
        score.text = "獎金： ---"
    }
    
    func warning () {
        var score = ""
        if  myScore <= 30{
            score = "闖關失敗 一毛都沒了QQ！"
        }else if myScore >= 40{
            score = "恭喜你，把獎金帶回家！"
        }
        let alert =  UIAlertController(title: score, message: "\(myScore)$$", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "重新開始", style: .default, handler:{ UIAlertAction in  self.playAgain()})
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quesionArray.shuffle()
        
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
    }
    
    func nextact() {
        question.isHidden = false
        nextButton.setTitle("next", for: .normal)
        question.text = quesionArray[waringNumber].question            //題目本文
        correctAnswerNumber = quesionArray[waringNumber].correctAnswer //題數
        
        for i in 0 ..< selectButton.count{
            selectButton[i].setTitle(quesionArray[waringNumber].answer[i], for: .normal)
        }
        
        waringNumber += 1
        numQuesion += 1
        questionNumber.text = "第\(numQuesion)題"
        
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        button4.isHidden = false
        questionNumber.isHidden = false
        firstImage.isHidden = true
        topImage.isHidden = true
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
