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
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var escritorioLbl: UILabel!
    @IBOutlet weak var dataUltimaAtualizacaoLbl: UILabel!
    @IBOutlet weak var descricaoLbl: UILabel!
    @IBOutlet weak var desafiosLbl: UILabel!
    @IBOutlet weak var techStackLbl: UILabel!
    @IBOutlet weak var oportunidadesLbl: UILabel!
    @IBOutlet weak var responsaveisLbl: UILabel!
    
    var projetoSelecionado: Projeto?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let  projeto = projetoSelecionado {
            nomeProjetoLbl.text = projeto.nome
            statusLbl.text = projeto.status.rawValue
            escritorioLbl.text = projeto.escritorio
            dataUltimaAtualizacaoLbl.text = projeto.dataUltimaAtualizacao
            descricaoLbl.text = projeto.descricao
            desafiosLbl.text = projeto.desafios
            techStackLbl.text = projeto.techStack
            oportunidadesLbl.text = retornaOportunidades(oportunidades: projeto.oportunidades)
            responsaveisLbl.text = projeto.responsaveis
            
        }
    }
    
    func retornaOportunidades(oportunidades: [Oportunidades]) -> String {
        var oportunidadeRetorno = ""
        
        for oportunidade in oportunidades {
            oportunidadeRetorno += "* " + oportunidade.rawValue + "\n"
        }
        return oportunidadeRetorno
    }
    
    
}
