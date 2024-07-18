//
//  SfSymbolsModel.swift
//  MessengerSetting
//
//  Created by 김윤우 on 7/18/24.
//

import UIKit

struct SfSymbols: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let image: UIImage
    
}
