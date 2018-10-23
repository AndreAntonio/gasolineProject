//
//  CarStruct.swift
//  GasolineProject
//
//  Created by Andre Faruolo on 22/10/18.
//  Copyright © 2018 Andre Faruolo. All rights reserved.
//

import Foundation

public class CarStruct {
    
    let id: String?
    let gasolineAut: Double?
    let etanolAut: Double?
    let make: String?
    let model: String?
    
    init(id: String? = nil, gasolineAut: Double? = nil, etanolAut: Double? = nil, make:String? = nil, model: String? = nil) {
        self.id = id
        self.gasolineAut = gasolineAut
        self.etanolAut = etanolAut
        self.make = make
        self.model = model
    }
    
}
