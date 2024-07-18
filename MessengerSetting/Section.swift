//
//  Section.swift
//  MessengerSetting
//
//  Created by 김윤우 on 7/18/24.
//

import UIKit

enum Section: CaseIterable {
    case total
    case personal
    case others
    
    var list: [SfSymbols] {
        switch self {
            
        case .total:
            return sfSymbolList[0]
        case .personal:
            return sfSymbolList[1]
        case .others:
            return sfSymbolList[2]
        }
        
    }
    
}
let sfSymbolList: [[SfSymbols]] = [
    [SfSymbols(name: "sun", category: "Weather", image: UIImage(systemName: "sun.min")!),
    SfSymbols(name: "cloud", category: "Weather", image: UIImage(systemName: "cloud")!),
    SfSymbols(name: "tornado", category: "Weather", image: UIImage(systemName: "tornado")!)],
    [SfSymbols(name: "play", category: "Media", image: UIImage(systemName: "play.square")!),
    SfSymbols(name: "stop", category: "Media", image: UIImage(systemName: "stop.circle")!),
    SfSymbols(name: "pause", category: "Media", image: UIImage(systemName: "pause.rectangle")!),
    SfSymbols(name: "shuffle", category: "Media", image: UIImage(systemName: "shuffle")!)],
    [SfSymbols(name: "camera", category: "Camera", image: UIImage(systemName: "camera.fill")!)]
]
enum Category {
    
    case weather
    case media
    case time
    
    
}
