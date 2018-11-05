//
//  ViewController.swift
//  GasolineProject
//
//  Created by Andre Faruolo on 04/09/2018.
//  Copyright © 2018 Andre Faruolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    var car = CarStruct.init()
    
    //Comsumption Outlets
    @IBOutlet weak var gasolineConsumption: UITextField!
    @IBOutlet weak var alcoholConsumption: UITextField!
    
    //Prices Outlets
    @IBOutlet weak var gasolinePrice: UITextField!
    @IBOutlet weak var alcoholPrice: UITextField!
    
    @IBOutlet weak var chosenVehicleOutlet: UILabel!
    
    
    
    @IBOutlet weak var calculateButtonOutlet: UIButton!
    
    
    var views : [CustomView] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
        
        if CarManager.shared.managedCar.id != nil {
            self.car = CarManager.shared.managedCar
            print(self.car.make)
            print(self.car.etanolAut)
            print(self.car.gasolineAut)
            
            self.chosenVehicleOutlet.text = "\(self.car.make!)" + " " + "\(self.car.model!)"
            
            self.gasolineConsumption.text = "\(self.car.gasolineAut!)"
            self.alcoholConsumption.text = "\(self.car.etanolAut!)"
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gasolineConsumption.delegate = self
        alcoholConsumption.delegate = self
        gasolinePrice.delegate = self
        alcoholPrice.delegate = self
        
        gasolineConsumption.frame.size.height = 45
        alcoholConsumption.frame.size.height = 45
        gasolinePrice.frame.size.height = 45
        alcoholPrice.frame.size.height = 45
        
        self.calculateButtonOutlet.layer.cornerRadius = self.calculateButtonOutlet.frame.height/2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateCostBenefit(alcoholAutonomy: Double, gasolineAutonomy: Double, alcoholPrice: Double, gasolinePrice: Double) -> String{
        
        var consumptionRatio: Double = gasolineAutonomy/alcoholAutonomy
        var priceRatio = gasolinePrice/alcoholPrice
        
        print(consumptionRatio)
        print(priceRatio)
        
        var returnValue: String = ""
        
        if consumptionRatio > priceRatio {
            returnValue = "Gasolina"
        } else if consumptionRatio < priceRatio {
            returnValue = "Alcool"
        }
        
        return returnValue
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        if (self.alcoholConsumption.hasText == false || self.alcoholPrice.hasText == false) || (self.gasolineConsumption.hasText == false || self.gasolinePrice.hasText == false) {
            
            print("TA VAZIO AI MAN")
            
            let alert = UIAlertController(title: "Campos Vazios", message: "Alguns dos campos não foram preenchidos corretamente. Por favor, revise-os.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            var aAutonomy = Double(self.alcoholConsumption.text!)
            var gAutonomy = Double(self.gasolineConsumption.text!)
            var aPrice = Double(self.alcoholPrice.text!)
            var gPrice = Double(self.gasolinePrice.text!)
            
            var result = self.calculateCostBenefit(alcoholAutonomy: aAutonomy!, gasolineAutonomy: gAutonomy!, alcoholPrice: aPrice!, gasolinePrice: gPrice!)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "resultViewController") as! ResultViewController
            
            controller.result = result
            
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
}

