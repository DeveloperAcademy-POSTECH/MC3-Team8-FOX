//
//  CheckBox.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/22.
//

import Foundation
import UIKit

@IBDesignable
class CheckBoxView: UIView {
 
    @IBOutlet var checkBoxView: UIView!
    @IBOutlet weak var checkLabel: UILabel!
    
    var delegate: CheckBoxDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CheckBoxView", owner: self, options: nil)
        addSubview(checkBoxView)
        self.checkBoxView.isUserInteractionEnabled = true
        self.checkBoxView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.clickedCheckBox(_:))))
    }
    @objc func clickedCheckBox(_ sender: Any) {
        delegate?.checkBoxHighlight(checkBox: self)
    }
}

