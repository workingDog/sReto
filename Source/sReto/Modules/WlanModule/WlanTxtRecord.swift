//
//  WlanTxtRecord.swift
//  sRetoIOS
//
//  Created by ringo on 7/7/18.
//  Copyright © 2018 LS1 TUM. All rights reserved.
//

import Foundation

/*
 * sets the global net service TXT record for the receiver
 */
open class WlanTxtRecord {
    
    open static var txtRecords = [String : Data]()
    
    open static func asData() -> Data {
        return NetService.data(fromTXTRecord: txtRecords)
    }
    
}

