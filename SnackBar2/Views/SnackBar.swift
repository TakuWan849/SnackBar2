//
//  SnackBar.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/13.
//

import UIKit

class SnackBar: UIView {
    
    private var viewModel : SnackBarViewModel
    private var handler : Handler?
    
    init(viewModel: SnackBarViewModel, frame: CGRect) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
