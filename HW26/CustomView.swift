//
//  CustomView.swift
//  HW26
//
//  Created by Black Bacterium on 01.02.2026.
//

import UIKit

protocol ICustomViewDelegate {
    func findView(name: String)
}

class CustomView: UIView {
    
    var delegate: ICustomViewDelegate?
    
    var viewName: String
    
    init(viewName: String, backgroundColor: UIColor) {
        self.viewName = viewName
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if let view = hitView as? CustomView {
            self.delegate?.findView(name: view.viewName)
        } else {
            print("nil")
        }
        return hitView
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

