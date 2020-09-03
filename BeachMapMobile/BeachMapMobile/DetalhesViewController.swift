//
//  DetalhesViewController.swift
//  BeachMapMobile
//
//  Created by Wilton Garcia on 03/09/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {

    @IBOutlet weak var nomeProjetoLbl: UILabel!
    
    var nomeProjetoSelecionado: Projeto?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let  nomeProjeto = nomeProjetoSelecionado?.nome {
            nomeProjetoLbl.text = nomeProjeto
        }
    }
    

}
