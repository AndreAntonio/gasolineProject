//
//  ResultViewController.swift
//  GasolineProject
//
//  Created by Andre Faruolo on 04/09/2018.
//  Copyright © 2018 Andre Faruolo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result: String = ""
    
    @IBOutlet weak var resultStringOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Resultado"
        
        self.resultStringOutlet.text = "Xablau"
        self.navigationController?.navigationBar.isHidden = false
        print(result)
        
        self.resultStringOutlet.text = result
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
