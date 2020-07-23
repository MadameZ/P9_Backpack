//
//  TranslateViewController.swift
//  Backpack
//
//  Created by Caroline Zaini on 05/12/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import UIKit

class TranslateViewController: UIViewController {
    @IBOutlet weak var frenchTextView: UITextView!
    @IBOutlet weak var englishTextView: UITextView!
    @IBOutlet weak var translateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frenchTextView.delegate = self
        
        view.setupGradient()
        frenchTextView.borderTextView()
        translateBtn.circle(5)
        
    }
    
    func setupService() {
        TranslateService.shared.getTranslate(text: frenchTextView.text) { (success, textToDecode) in
            if success {
                self.englishTextView.text = textToDecode
            } else {
                Alert.present(title: MessageError.connexionFailTitle, message: MessageError.connexionFailTranslateDesc, vc: self)
            }
        }
        
    }
    
    
    @IBAction func didTapTranslateBtn(_ sender: Any) {
        setupService()
    }
    

}



