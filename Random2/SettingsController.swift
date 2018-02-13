//
//  SettingsController.swift
//  Random2
//
//  Created by Eugenijus Margalikas on 08/12/2017.
//  Copyright © 2017 Eugenijus Margalikas. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    var lowerBound:Int = 1
    var upperBound:Int = 10
    
    @IBOutlet weak var bound1: UITextField!
    @IBOutlet weak var bound2: UITextField!
    var update:(Int,Int)->() = {_,_ in}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bound1!.text = "\(lowerBound)"
        bound2!.text = "\(upperBound)"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTapped(_ sender: UIButton){
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func doneTapped(_ sender: UIButton) {
        
        if let b1 = Int.init(bound1.text!), let b2 = Int.init(bound2.text!){
            update(b1,b2)
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
