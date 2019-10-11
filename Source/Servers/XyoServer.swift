//
//  XyoServer.swift
//  sdk
//
//  Created by Arie Trouw on 10/11/19.
//  Copyright © 2019 Arie Trouw. All rights reserved.
//

import Foundation

protocol XyoServer: XyoBoundWitnessTarget {
  var listen: Bool { get set }
}
