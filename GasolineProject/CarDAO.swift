//
//  CarDAO.swift
//  GasolineProject
//
//  Created by Andre Faruolo on 17/10/18.
//  Copyright © 2018 Andre Faruolo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class CarDAO{
    
    public func create(make: String, model: String, gasAut: Double, etanolAut: Double, id:String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Car", into: context)
        
        usuario.setValue(etanolAut, forKey: "etanolAut")
        usuario.setValue(gasAut, forKey: "gasolineAut")
        usuario.setValue(id, forKey: "id")
        usuario.setValue(make, forKey: "make")
        usuario.setValue(model, forKey: "model")
        
        do {
            try context.save()
            print("Dados Salvos Com Sucesso")
        }catch{
            print("Erro ao salvar os dados")
        }
        
    }
    
    public func read() -> [CarStruct] {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let car = NSEntityDescription.entity(forEntityName: "Car", in: context)
       //let usuario = NSEntityDescription.insertNewObject(forEntityName: "Car", into: context)
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Car")
        
        var returnArray = [CarStruct]()
        
        do{
            let cars = try context.fetch(request) as! [NSManagedObject]
            
            //verifica se existe usuario
            
            if cars.count > 0 {
                for car in cars{
                    
                    
                    var id = car.value(forKey: "id") as! String
                    var make = car.value(forKey: "make") as! String
                    var model = car.value(forKey: "model") as! String
                    var gasolineAut = car.value(forKey: "gasolineAut") as! Double
                    var etanolAut = car.value(forKey: "etanolAut") as! Double
                    
                    var returnCar = CarStruct(id: id, gasolineAut: gasolineAut, etanolAut: etanolAut, make: make, model: model)
                    
                    returnArray.append(returnCar)
                }
            }else{
                print("no car found")
            }
            
        }catch{
            print("Erro ao recuperar os dados")
        }

        return returnArray

    }
    
    
    public func update(){
        
    }
    
    public func delete(){
        
    }
    
    
    
    
}
