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
        
        self.tabBarController?.tabBar.isHidden = true
        
        makeTextFieldOutlet.delegate = self
        modelTextFieldOutlet.delegate = self
        gasolineAutTextFieldOutlet.delegate = self
        etanolTextFieldOutlet.delegate = self

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
