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
            statusLbl.text = retornaStatus(status: projeto.status)
            escritorioLbl.text = projeto.escritorio
            dataUltimaAtualizacaoLbl.text = formataData(data: projeto.dataUltimaAtualizacao)
            descricaoLbl.text = projeto.descricao
            desafiosLbl.text = projeto.desafios
            techStackLbl.text = projeto.techStack
            oportunidadesLbl.text = retornaOportunidades(oportunidades: projeto.oportunidade)
            responsaveisLbl.text = projeto.responsaveis
        }
    }
    
    func retornaStatus(status: String) -> String {
        
        switch status {
        case "emProgresso":
            return "Em Progresso"
        case "Rascunho":
            return "Rascunho"
        case "Deletado":
            return "Deletado"
        case "Parado":
            return "Parado"
        case "Concluido":
            return "Concluído"
        case "NaoIniciado":
            return "Não Iniciado"
        default:
            return "Sem status"
        }
        
    }
    
    func retornaOportunidades(oportunidades: [String]) -> String {
        var oportunidadeRetorno = ""
        
        for oportunidade in oportunidades {
            oportunidadeRetorno += "* " + oportunidade + "\n"
        }
        return oportunidadeRetorno
    }
    
    func formataData(data:String) -> String {
        return "Data da última atualização: \(data)"
    }
}
