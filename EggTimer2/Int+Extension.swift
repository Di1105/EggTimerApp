//
//  Int+Extension.swift
//  EggTimer2
//
//  Created by Fatih Sağlam on 6.10.2022.
//

import Foundation

extension Int {

    func secondsToTime() -> String {

        let (m,s) = ((self % 3600) / 60, (self % 3600) % 60)

        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"

        return "\(m_string):\(s_string)"
    }
}
