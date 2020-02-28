//
//  IosPlatformMethodViewNative.swift
//  flutter_plugin_workshop
//
//  Created by Phạm Như Vũ on 2/20/20.
//

import Foundation


@available(iOS 9.0, *)
class IosPlatformMethodViewNative: UIStackView {
    
    let label = UILabel()
    let btn1 = UIButton()
    let btn2 = UIButton()
    
    var value: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initView() {
        axis  = NSLayoutConstraint.Axis.vertical
        distribution  = UIStackView.Distribution.equalSpacing
        alignment = UIStackView.Alignment.center
        
        addArrangedSubview(label)
        addArrangedSubview(btn1)
        addArrangedSubview(btn2)
        
        btn1.setTitle("Tap 1", for: .normal)
        btn1.backgroundColor = .gray
        
        btn2.setTitle("Tap 2", for: .normal)
        btn2.backgroundColor = .gray
    }
}
