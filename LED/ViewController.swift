//
//  ViewController.swift
//  LED
//
//  Created by VietHung on 5/25/16.
//  Copyright © 2016 VietHung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tf: UITextField!
    var margin: CGFloat = 50
    var n = 0
    var flag = false
    
    @IBAction func btn_Draw(sender: AnyObject) {
        print(view.subviews)
        if (flag == false){
            n = Int(tf.text!)!
            DrawBalls()
            flag = true
        }
        if flag {
            for i in view.subviews{
                if(i.tag == 1){
                    i.removeFromSuperview()
                }
            }
            n = Int(tf.text!)!
            DrawBalls()
            flag = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    func DrawBalls(){
        for indexRow in 0..<n{
            for indexCol in 0..<n{
                let image = UIImage(named: "green")
                let ball = UIImageView(image: image)
                ball.center = CGPointMake(margin + CGFloat(indexRow)*spaceBalls1() , margin + CGFloat(indexCol)*spaceBalls2())
                ball.tag = 1
                self.view.addSubview(ball)
            }
        }
    }
    
    func spaceBalls1() -> CGFloat{
        let space = (self.view.bounds.size.width - 2*margin)/CGFloat(n-1)
        return space
    }
    
    func spaceBalls2() -> CGFloat{
        let space = (self.view.bounds.size.height - 2*margin)/CGFloat(n-1)
        return space
    }
    
}

