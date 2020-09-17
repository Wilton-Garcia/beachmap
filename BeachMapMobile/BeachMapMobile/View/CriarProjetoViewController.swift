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
    
    @IBOutlet weak var statusPickerView: UIPickerView!
    
    let status = ["Em Andamento", "Cancelado", "Rascunho"]
    let escritoriosLista = ["Belo Horizonte","Porto Alegre","Recife", "São Paulo"]
    let oportunidadesLista = ["BA", "DEV", "QA", "PM", "XD"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        criaPickerView()
        removePickerView()
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
        let ultimaAtualizacao = pegarDataDoDia()
        
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
    
    func pegarDataDoDia() -> String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        let formattedDate = format.string(from: date)
        return formattedDate
    }
    
    
    
    func criaPickerView() {
        let pickerView = UIPickerView()
        //let pickerViewEscritorio = UIPickerView()
        pickerView.delegate = self
        statusDoProjeto.inputView = pickerView
        escritorio.inputView = pickerView
    }
    
    func removePickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        statusDoProjeto.inputAccessoryView = toolBar
        escritorio.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        view.endEditing(true)
    }
    
}


extension CriarProjetoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if escritorio.isFirstResponder{
            return escritoriosLista.count
        }
        return status.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if escritorio.isFirstResponder{
            return escritoriosLista[row]
        }
        return status[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if escritorio.isFirstResponder{
            escritorio.text = escritoriosLista[row]
        }else{
            statusDoProjeto.text = status[row]
        }
    }
    
}
