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
        Projeto(id: 0, nome: "Projeto Exemplo 1", escritorio: "Belo Horizonte", descricao: "orem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonIpslon", responsaveis: "vitor.prites@email.com"),
        Projeto(id: 1, nome: "Projeto Exemplo 2", escritorio: "Recife", descricao: "Lorem Ipslon Lorem Lorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLn", responsaveis: "wilton.garcia@email.com")
    
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
        
        cell.Nome.text = projetos[indexPath.row].nome
        cell.Escritorio.text = projetos[indexPath.row].escritorio
        cell.Descricao.text = projetos[indexPath.row].descricao
        cell.Responsaveis.text = projetos[indexPath.row].responsaveis
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

