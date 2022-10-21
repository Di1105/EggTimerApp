//
//  EggModel.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 30.08.2022.
//

import Foundation

enum Temperature {
    case fridge
    case room
}

enum Size {
    case large
    case medium
    case small
}

enum Hardness: String {
    case soft = "Soft"
    case medium = "Medium"
    case hard = "Hard"
}

struct Egg{
    
    var temperature: Temperature = .fridge
    var size: Size = .medium
    var hardness: Hardness = .soft
    
    mutating func setEggTemperature(temp: Temperature) {
        self.temperature = temp
    }
    
    mutating func setEggSize(size: Size) {
        self.size = size
    }
    
    mutating func setEggHardness(hardness: Hardness) {
        self.hardness = hardness
    }
    
    func getEggLabel() -> String {
        return hardness.rawValue
    }
    
    mutating func getEstimatedBoiledTime() -> Int {
                
        switch temperature {
        case .fridge:
            switch size {
            case .small:
                switch hardness {
                case .soft:
                    return 5
                case .medium:
                    return 390
                case .hard:
                    return 630
                }
            case .medium:
                switch hardness {
                case .soft:
                    return 300
                case .medium:
                    return 420
                case .hard:
                    return 660
                }
            case .large:
                switch hardness {
                case .soft:
                    return 330
                case .medium:
                    return 450
                case .hard:
                    return 690
                }
            }
            
        case .room:
            switch size {
            case .small:
                switch hardness {
                case .soft:
                    return 240
                case .medium:
                    return 360
                case .hard:
                    return 600
                }
            case .medium:
                switch hardness {
                case .soft:
                    return 270
                case .medium:
                    return 390
                case .hard:
                    return 630
                }
            case .large:
                switch hardness {
                case .soft:
                    return 300
                case .medium:
                    return 420
                case .hard:
                    return 660
                }
            }
        }
    }
}
        
//        if tempature == .fridge {
//            if size == .small {
//                if hardness == .soft {
//                    estimatedBoiledTime = 270
//                } else if hardness == .medium {
//                    estimatedBoiledTime = 390
//                } else if hardness == .hard {
//                    estimatedBoiledTime = 630
//                }
//            } else if size == .medium {
//                if hardness == .soft {
//                    estimatedBoiledTime = 300
//                } else if hardness == .medium {
//                    estimatedBoiledTime = 420
//                } else {
//                    estimatedBoiledTime = 660
//                }
//            } else {
//                if hardness == .soft {
//                    estimatedBoiledTime = 330
//                } else if hardness == .medium {
//                    estimatedBoiledTime = 450
//                } else {
//                    estimatedBoiledTime = 690
//                }
//            }
//        } else if tempature == .room {
//            if size == .small {
//                if hardness == .soft {
//                    estimatedBoiledTime = 240
//                } else if hardness == .medium {
//                    estimatedBoiledTime = 360
//                } else {
//                    estimatedBoiledTime = 600
//                }
//            } else if size == .medium {
//                if hardness == .soft {
//                    estimatedBoiledTime = 270
//                } else if hardness == .medium {
//                    estimatedBoiledTime = 390
//                } else {
//                    estimatedBoiledTime = 630
//                }
//            } else {
//                if hardness == .soft {
//                    estimatedBoiledTime = 300
//                } else if hardness == .medium {
//                    estimatedBoiledTime = 420
//                } else {
//                    estimatedBoiledTime = 660
//                }
//            }
//        }
//        return estimatedBoiledTime!
//    }
//}
