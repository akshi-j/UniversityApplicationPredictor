//
//  ViewController.swift
//  UniversityPredictor
//
//  Created by Akshi  on 1/9/19.
//  Copyright © 2019 Akshi J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var satScoreTextField: UITextField!
    @IBOutlet weak var satScoreLabel: UILabel!
    
    @IBOutlet weak var actScoreTextField: UITextField!
    @IBOutlet weak var actScoreLabel: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func setStats(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondViewController {
            let vc = segue.destination as? SecondViewController
            vc?.name = nameTextField.text!
            vc?.SATScore = satScoreTextField.text!
            vc?.ACTScore = actScoreTextField.text!
        }
    }

}

