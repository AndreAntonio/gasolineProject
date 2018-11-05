//
//  AddVehicleViewController.swift
//  GasolineProject
//
//  Created by Andre Faruolo on 14/10/18.
//  Copyright © 2018 Andre Faruolo. All rights reserved.
//

import UIKit

class AddVehicleViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var makeTextFieldOutlet: UITextField!
    
    @IBOutlet weak var modelTextFieldOutlet: UITextField!
    
    @IBOutlet weak var gasolineAutTextFieldOutlet: UITextField!
    
    
    @IBOutlet weak var etanolTextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Adicionar Veículo"
        
        //self.tabBarController?.tabBar.isHidden = true
        
        makeTextFieldOutlet.delegate = self
        modelTextFieldOutlet.delegate = self
        gasolineAutTextFieldOutlet.delegate = self
        etanolTextFieldOutlet.delegate = self
        
        makeTextFieldOutlet.frame.size.height = 45
        modelTextFieldOutlet.frame.size.height = 45
        gasolineAutTextFieldOutlet.frame.size.height = 45
        etanolTextFieldOutlet.frame.size.height = 45

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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        if (self.makeTextFieldOutlet.hasText == false || self.modelTextFieldOutlet.hasText == false) || (self.gasolineAutTextFieldOutlet.hasText == false || self.etanolTextFieldOutlet.hasText == false) {
            
            let alert = UIAlertController(title: "Campos Vazios", message: "Alguns dos campos não foram preenchidos corretamente. Por favor, revise-os.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            var dao = CarDAO()
            
            var etanolAut = Double(self.etanolTextFieldOutlet.text as! String)!
            var gasolineAut = Double(self.gasolineAutTextFieldOutlet.text as! String)!
            var make = self.makeTextFieldOutlet.text
            var model = self.modelTextFieldOutlet.text
            var id = UUID().uuidString
            
            dao.create(make: make!, model: model!, gasAut: gasolineAut, etanolAut: etanolAut, id: id)
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    

}
