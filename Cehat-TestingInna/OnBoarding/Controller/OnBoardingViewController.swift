//
//  ViewController.swift
//  Cehat-TestingInna
//
//  Created by Nur Mutmainnah Rahim on 16/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    var yearOfBirthInt : Int?
    var age : Int?

    @IBOutlet weak var DateOfBirth: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonLanjutkan(_ sender: Any) {
        let datestyle = DateFormatter()
        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "yyyy"
        let yearOfBirthString = datestyle.string(from: DateOfBirth.date)
        yearOfBirthInt = Int(yearOfBirthString)
        ageChild()
        
        performSegue(withIdentifier: "goToNutrientPage", sender: self)
       
    }
    
    @IBAction func ButtonLewati(_ sender: Any) {
    }
    
    func ageChild() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let todayString = dateFormatter.string(from: date)
        let todayInt = Int(todayString)
        age = todayInt!-yearOfBirthInt!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextPage = segue.destination as? NutritionPageViewController
        nextPage?.receivedAge = age
    }
}

