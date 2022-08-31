//
//  ButtonEgg.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 30.08.2022.
//

import Foundation

enum EggSize{
    case S
    case M
    case L
}

enum EggTemp{
    case Fridge
    case Room
}

enum CookInfo{
    case Medium
    case Soft
    case Hard
}

@objc class Egg: NSObject{
    
    var size : EggSize
    var tempature : EggTemp
    var cookInfo : CookInfo
    
    init(size: EggSize, temprature: EggTemp , cookInfo : CookInfo){
        self.size = size
        self.tempature = temprature
        self.cookInfo = cookInfo
    }
}


