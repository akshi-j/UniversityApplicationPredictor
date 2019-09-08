//
//  SecondViewController.swift
//  UniversityPredictor
//
//  Created by Akshi  on 1/9/19.
//  Copyright © 2019 Akshi J. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var name: String = ""
    var SATScore = ""
    var ACTScore = ""
    var uniName = ""
    var finalMessage = ""
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var message: UILabel!

    @IBOutlet weak var showMyStats: UIButton!
    
    var ref: DatabaseReference!
    var SATScoreUni: String = ""
    var ACTScoreUni: String = ""
    @IBAction func onClick(_ sender: UIButton) {
        ref = Database.database().reference()
        self.ref.child("uni_db").child(uniName).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSArray
            self.SATScoreUni = value?[0] as! String
            self.ACTScoreUni = value?[1] as! String
            
            if Int(self.SATScore)! >= Int(self.SATScoreUni)!
                || Int(self.ACTScore)! >= Int(self.ACTScoreUni)! {
                
                self.finalMessage = String(format: "Congratulations %@! Your score is higher than the average score, you have great chances of getting into %@. Good luck!", self.name, self.uniName)
            }
            else{
                self.finalMessage = String(format: "Sorry %@, based on your scores, you have low chances of getting into %@. Try aiming for a SAT Score of %@ or an ACT Score of %@.", self.name, self.uniName, self.SATScoreUni, self.ACTScoreUni)
            }
        }) { (error) in
            print(error.localizedDescription)
        }

       // print(self.ACTScoreUni)
        //print(self.SATScoreUni)
       // let message = String(format: "Sorry %@, based on your scores, you will probably not get in %@. Try aiming for bla",name, uniName)
        sorryMessage.text = (finalMessage)
        
    }
    
    let unis = ["Massachusetts Institute of Technology (MIT)","Stanford University","Harvard University","California Institute of Technology (Caltech)","University of Chicago","Princeton University","Cornell University","Yale University","Columbia University","University of Pennsylvania","University of Michigan","Johns Hopkins University","Duke University","University of California, Berkeley (UCB)","University of California, Los Angeles (UCLA)","Northwestern University","University of California, San Diego (UCSD)","New York University","Carnegie Mellon University","University of Wisconsin-Madison","Brown University","University of Texas at Austin","University of Washington","Georgia Institute of Technology","University of Illinois at Urbana-Champaign","University of North Carolina, Chapel Hill","Rice University","The Ohio State University","Boston University","Pennsylvania State University","Washington University in St. Louis","Purdue University","University of California, Davis","University of Southern California","University of Maryland, College Park","University of California, Santa Barbara (UCSB)","University of Pittsburgh","Michigan State University","Emory University","University of Minnesota","University of California, Irvine","University of Florida","Dartmouth College","University of Rochester","Case Western Reserve University","University of Colorado Boulder","University of Virginia","Vanderbilt University","Texas A&M University","Arizona State University","University of Notre Dame","University of Illinois, Chicago (UIC)","Georgetown University","Tufts University","University of Miami","The University of Arizona","University of Massachusetts Amherst","North Carolina State University","Rutgers University - New Brunswick","University of Hawai'i at Mañoa","The Katz School at Yeshiva University","University at Buffalo SUNY","Indiana University Bloomington","Northeastern University","University of California, Santa Cruz","Virginia Polytechnic Institute and State University","George Washington University","Rensselaer Polytechnic University","University of Utah","Stony Brook University, State University of New York","University of Kansas","University of Connecticut","Boston College","University of California, Riverside","Wake Forest University","Washington State University","University of Colorado, Denver","Tulane University","The University of Tennessee, Knoxville","Illinois Institute of Technology","University of Texas Dallas","Brandeis University","The University of Georgia","University of Iowa","University of Delaware","Wayne State University","Colorado State University","Oregon State University","University of Maryland, Baltimore County","Clark University","Florida State University","Iowa State University","University of New Mexico","University of Oklahoma","Drexel University","Lehigh University","Howard University","University of South Florida","The New School","University of Vermont"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return unis[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return unis.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        uniName = unis[row]
        
    }
    @IBOutlet weak var sorryMessage: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
