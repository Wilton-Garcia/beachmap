//
//  ViewController.swift
//  BeachMapMobile
//
//  Created by LAVitor Pires on 26/08/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    let projetos = [
        Projeto(id: 0, nome: "Projeto Exemplo 1", escritorio: "Belo Horizonte", descricao: "orem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon ", responsaveis: "vitor.prites@email.com,  wilton.garcia@email.com, wilton.garcia@email.com"),
        Projeto(id: 1, nome: "Projeto Exemplo 2", escritorio: "Recife", descricao: "Lorem Ipslon Lorem Lorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem ", responsaveis: "wilton.garcia@email.com")
        
    ]
    
    @IBOutlet weak var tabelaProjetos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelaProjetos.delegate = self
        tabelaProjetos.dataSource = self
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projetos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! ProjetosTableViewCell
        
        let projeto = projetos[indexPath.row]
        let stringResponsaveisProjetosFormatada = formataStringResponsaveis(responsaveis: projeto.responsaveis)
        
        cell.Nome.text = projeto.nome
        cell.Escritorio.text = projeto.escritorio
        cell.Descricao.text = projeto.descricao
        cell.Responsaveis.attributedText = stringResponsaveisProjetosFormatada
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func formataStringResponsaveis(responsaveis: String) -> NSAttributedString {
        
        let boldText = "Responsáveis: "
        let attributsBold = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)]
        let attributsNormal = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .regular)]
        let attributedString = NSMutableAttributedString(string: responsaveis, attributes:attributsNormal)
        let boldStringPart = NSMutableAttributedString(string: boldText, attributes:attributsBold)
        
        boldStringPart.append(attributedString)
        
        return boldStringPart
        
    }
    
}

