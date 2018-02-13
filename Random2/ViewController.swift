//
//  ViewController.swift
//  Random2
//
//  Created by Eugenijus Margalikas on 28/11/2017.
//  Copyright © 2017 Eugenijus Margalikas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var generator:RandGen=RandGen.init()

    @IBOutlet weak var Output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateOutput()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap(_ sender: Any) {
        
        updateOutput()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settings = segue.destination as! SettingsController
        settings.update = setNewGeneratorWithBounds(bound1:bound2:)
        settings.lowerBound = generator.lowerBound
        settings.upperBound = generator.upperBound
        
    }
    
    func updateOutput(){
        Output.text="\(generator.generate())"
    }
    func setNewGeneratorWithBounds(bound1:Int,bound2:Int){
        generator=RandGen.init(withBounds: bound1, bound2)
        updateOutput()
    }
    func setNewGeneratorDefault(){
        generator=RandGen.init()
    }
}

