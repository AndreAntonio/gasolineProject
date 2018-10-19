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
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let carEntity = NSEntityDescription.entity(forEntityName: "Car", in: managedContext )
        
        let car = NSManagedObject(entity: carEntity!, insertInto: managedContext)
        
        car.setValue(etanolAut, forKey: "etanolAut")
        car.setValue(gasAut, forKey: "gasolineAut")
        car.setValue(make, forKey: "make")
        car.setValue(model, forKey: "model")
        car.setValue(id, forKey: "id")
        
        do {
            
            try managedContext.save()
            print("Contexto salvo com sucesso")
            
        } catch let error as NSError{
            
            print("Failed")
            
        }
        
    }
    
    public func read() -> [Car] {
        
        var cars = [Car]()
        
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let carEntity = NSEntityDescription.entity(forEntityName: "Car", in: managedContext )
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Car")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                var car = Car.init(entity: carEntity!, insertInto: managedContext)
                car.etanolAut = data.value(forKey: "etanolAut") as! Double
                car.gasolineAut = data.value(forKey: "gasolineAut") as! Double
                car.make = data.value(forKey: "make") as? String
                car.model = data.value(forKey: "model") as? String
                car.id = data.value(forKey: "id") as? String
                
                cars.append(car)
            }
            } catch {
                print("failed")
            }
        
        return cars

        }
    
    
    public func update(){
        
    }
    
    public func delete(){
        
    }
    
    
    
    
}
