//
//  XyoTcpipServer.swift
//  sdk
//
//  Created by Arie Trouw on 10/11/19.
//  Copyright © 2019 Arie Trouw. All rights reserved.
//

import Foundation
import sdk_core_swift

class XyoTcpipServer: XyoServer {
  var delegate: BoundWitnessDelegate?
  
  var relayNode: XyoRelayNode
  
  var procedureCatalog: XyoProcedureCatalog
  var autoBridge: Bool = false
  var acceptBridging: Bool = false
  
  var listen: Bool = false
  
  required init(relayNode: XyoRelayNode, procedureCatalog: XyoProcedureCatalog) {
    self.relayNode = relayNode
    self.procedureCatalog = procedureCatalog
  }
  
  convenience init(relayNode: XyoRelayNode, procedureCatalog: XyoProcedureCatalog, autoBridge: Bool, acceptBridging: Bool) {
    self.init(relayNode: relayNode, procedureCatalog: procedureCatalog)
    self.autoBridge = autoBridge
    self.acceptBridging = acceptBridging
  }
  
}
