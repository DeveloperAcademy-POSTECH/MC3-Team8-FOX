//
//  PopUpViewController.swift
//  MC3_Team8_FOX
//
//  Created by 최성희 on 2022/07/22.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTouched(_:)))
            backgroundView.addGestureRecognizer(gesture)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    @objc func backgroundViewTouched(_ sender: UIGestureRecognizer?) {
        dismiss(animated: true)
    }
}
