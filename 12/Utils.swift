//
//  Utila.swift
//  12
//
//  Created by LuanNX on 12/24/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import UIKit
extension String {
    func toDouble() -> Double {
        return NumberFormatter().number(from: self) as! Double
    }
}
