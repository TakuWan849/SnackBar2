//
//  SnackBar.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/13.
//

import Foundation
import UIKit

// typelias: 複雑なクロージャに型エイリアスを設定できる
typealias Handler = () -> Void

enum SnackBarViewType {
    case info
    case action(handler : Handler)
}

struct SnackBarViewModel {
    
    let type: SnackBarViewType
    let text: String
    let image: UIImage?
}
