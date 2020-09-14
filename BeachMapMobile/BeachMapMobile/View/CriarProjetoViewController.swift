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
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var responsaveis: UITextField!
    @IBOutlet weak var nomeProjeto: UITextField!
    @IBOutlet weak var statusDoProjeto: UITextField!
    @IBOutlet weak var escritorio: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formataUI()
    }
    
    @IBAction func cadastraProjetoBtn(_ sender: UIButton) {
        
        guard let nomeProjeto = nomeProjeto.text else { return }
        guard let escritorio = escritorio.text else { return }
        guard let descricao = descricao.text else { return }
        guard let responsaveis = responsaveis.text else { return }
        guard let desafios = desafios.text else { return }
        guard let techStack = techStack.text else { return }
        guard let oportunidades = oportunidades.text else { return }
        guard let status = statusDoProjeto.text else { return }
        let ultimaAtualizacao = "10/10/2020"
        
        let projeto = Projeto(id: 50, nome: nomeProjeto, escritorio: escritorio, descricao: descricao, responsaveis: responsaveis, desafios: desafios, techStack: techStack, oportunidades: [oportunidades], status: status, dataUltimaAtualizacao: ultimaAtualizacao)
        
        ProjetosAPI().cadastraProjeto(projeto: projeto)
        
        navigationController?.popViewController(animated: true)
    }
    
    func formataUI(){
        adicionaTituloNaPagina()
        aplicaLaytoutNoTexView(textView: descricao)
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
    
    func adicionaTituloNaPagina(){
        navigationItem.title = "Cadastro de Novo Projeto"
    }
    
}
