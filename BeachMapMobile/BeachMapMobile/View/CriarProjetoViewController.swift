//
//  CriarProjetoViewController.swift
//  BeachMapMobile
//
//  Created by Wilton Garcia on 10/09/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import UIKit

class CriarProjetoViewController: UIViewController {

    @IBOutlet weak var oportunidades: UITextView!
    @IBOutlet weak var desafios: UITextView!
    @IBOutlet weak var techStack: UITextView!
    @IBOutlet weak var descricacao: UITextView!
    
    @IBOutlet weak var nomeProjeto: UITextField!
    @IBOutlet weak var statusDoProjeto: UITextField!
    @IBOutlet weak var escritorio: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formataUI()
    }
    
    func formataUI(){
        aplicaLaytoutNoTexView(textView: descricacao)
        aplicaLaytoutNoTexView(textView: oportunidades)
        aplicaLaytoutNoTexView(textView: desafios)
        aplicaLaytoutNoTexView(textView: techStack)
    }
    
    func aplicaLaytoutNoTexView(textView: UITextView) {
        textView.layer.borderWidth = 1.25
        textView.layer.borderColor = UIColor.systemGray4.cgColor
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 5
        
    }
}
