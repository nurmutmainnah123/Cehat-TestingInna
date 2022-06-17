//
//  NutritionPageViewController.swift
//  Cehat-TestingInna
//
//  Created by Nur Mutmainnah Rahim on 16/06/22.
//

import UIKit

class NutritionPageViewController: UIViewController {
    
    @IBOutlet weak var dailyPercentCalori: UILabel!
    @IBOutlet weak var DescriptInBar: UITextView!
    @IBOutlet weak var progressTextView: UILabel!
    
    let percentCalori = 110
    var receivedAge : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dailyPercentCalori.text = String(percentCalori) + "%"
        let hitung : Float?
        hitung = Float(percentCalori)/100
        
        let circlePath1 = UIBezierPath(arcCenter: CGPoint(x: 310, y:205), radius: 45, startAngle: .pi/2, endAngle: .pi*2.5 , clockwise: true)
        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: 310, y:205), radius: 45, startAngle: -.pi/2, endAngle: ((.pi*2*CGFloat(hitung!)) - (.pi/2)) , clockwise: true)
        
        let shape1 = CAShapeLayer()
        let shape2 = CAShapeLayer()

        shape1.path = circlePath1.cgPath
        shape2.path = circlePath2.cgPath
        
        shape1.lineWidth = 15
        shape2.lineWidth = 15
        
        shape1.strokeColor = UIColor.myGrayBar?.cgColor
        
        if percentCalori <= 25 {
            shape2.strokeColor = UIColor.myRedBar?.cgColor
            DescriptInBar.text = "Kebutuhan anak Anda belum terpenuhi, ayo berikan makanan untuk memenuhinya"
        }
        
        else if (percentCalori > 25) && (percentCalori <= 50) {
            shape2.strokeColor = UIColor.myOrangeBar?.cgColor
            DescriptInBar.text = "Kebutuhan anak Anda masih kurang, ayo berikan makanan untuk memenuhinya"
        }
        
        else if (percentCalori > 50) && (percentCalori <= 75) {
            shape2.strokeColor = UIColor.myGreenBar?.cgColor
            DescriptInBar.text = "Terus lanjutkan memberikan nutrisi untuk memenuhi kebutuhan anak Anda"
        }
                
        else {
            shape2.strokeColor = UIColor.myDarkGreen?.cgColor
            if (percentCalori >= 100) {
                DescriptInBar.text = "Selamat ! Anda telah berhasil memenuhi kebutuhan nutrisis harian anak"
            }
            else {
                DescriptInBar.text = "Ayo sedikit lagi, kebutuhan harian anak Anda akan terpenuhi"
            }
        }
        
        shape1.fillColor = UIColor.clear.cgColor
        shape2.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(shape1)
        view.layer.addSublayer(shape2)

        // Do any additional setup after loading the view.
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

extension UIColor {
    static let myDarkGreen = UIColor(named: "DarkGreen")
    static let myGrayBar = UIColor(named: "GrayBar")
    static let myRedBar = UIColor(named: "RedBar")
    static let myOrangeBar = UIColor(named: "OrangeBar")
    static let myGreenBar = UIColor(named: "GreenBar")
}
