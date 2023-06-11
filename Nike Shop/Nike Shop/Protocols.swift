//
//  Protocols.swift
//  Nike Shop
//
//  Created by bakebrlk on 11.06.2023.
//

import Foundation

protocol cartDelegate: AnyObject {
    func reload()
    
    func deleteButtonTapped(cell: CartCell)
}
