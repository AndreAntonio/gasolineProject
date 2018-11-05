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
    
    
    @IBOutlet weak var resultViewOutlet: CustomView!
    
    @IBOutlet weak var resultStringOutlet: UILabel!
    
    @IBOutlet weak var resultSubtitleOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Resultado"
        
        self.resultStringOutlet.text = "Xablau"
        self.navigationController?.navigationBar.isHidden = false
        print(result)
        
        self.resultViewOutlet.layer.cornerRadius = 20
        self.resultViewOutlet.layer.masksToBounds = true
        
        self.resultStringOutlet.text = result
        
        if self.result == "Alcool" {
            self.resultSubtitleOutlet.text = "De acordo com as informações fornecidas, a diferença de autonomia, proporcionalmente, entre alcool e gasolina no seu veículo é menor que, proporcionalmente, a diferença de preço na bomba escolhida. Portanto, o melhor custo benefício é abastecer com Alcool."
        } else if self.result == "Gasolina"{
            self.resultSubtitleOutlet.text = "De acordo com as informações fornecidas, a diferença de autonomia, proporcionalmente, entre alcool e gasolina no seu veículo é maior que, proporcionalmente, a diferença de preço na bomba escolhida. Portanto, o melhor custo benefício é abastecer com Gasolina."
        }
    
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
