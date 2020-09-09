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
        carregaDadosNaTelaDeDetalhes()
    }
    
    func carregaDadosNaTelaDeDetalhes(){
        
        if let  projeto = projetoSelecionado {
            nomeProjetoLbl.text = projeto.nome
            statusLbl.text = FormatarDadosDeProjeto().retornaStatus(status: projeto.status)
            escritorioLbl.text = projeto.escritorio
            dataUltimaAtualizacaoLbl.text = FormatarDadosDeProjeto().formataData(data: projeto.dataUltimaAtualizacao)
            descricaoLbl.text = projeto.descricao
            desafiosLbl.text = projeto.desafios
            techStackLbl.text = projeto.techStack
            oportunidadesLbl.text = FormatarDadosDeProjeto().retornaOportunidades(oportunidades: projeto.oportunidade)
            responsaveisLbl.text = projeto.responsaveis
        }
        
    }
    

}
