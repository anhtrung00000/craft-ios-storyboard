//
//  PremetiveExtension.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/22/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
extension Int {
    func format(f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
