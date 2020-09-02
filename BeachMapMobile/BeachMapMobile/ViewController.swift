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
        Projeto(id: 0, nome: "Projeto Exemplo 1", escritorio: "Belo Horizonte", descricao: "Lorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon ", responsaveis: "vitor.prites@email.com,  wilton.garcia@email.com, wilton.garcia@email.com"),
        Projeto(id: 1, nome: "Projeto Exemplo 2", escritorio: "Recife", descricao: "Lorem Ipslon Lorem Lorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem ", responsaveis: "wilton.garcia@email.com"),
        Projeto(id: 2, nome: "Projeto Exemplo 3", escritorio: "Belo Horizonte", descricao: "Lorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon ", responsaveis: "vitor.prites@email.com,  wilton.garcia@email.com, wilton.garcia@email.com"),
        Projeto(id: 4, nome: "Projeto Exemplo 4", escritorio: "Recife", descricao: "Lorem Ipslon Lorem Lorem Ipslon Lorem IpslonLorem Ipslon Lorem Ip3lonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem IpslonLorem Ipslon Lorem ", responsaveis: "wilton.garcia@email.com")
        
    ]
    
    @IBOutlet weak var tabelaProjetos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelaProjetos.delegate = self
        tabelaProjetos.dataSource = self
        AdicionaNavBar()
        
        
    }
    
    func AdicionaNavBar () {
        
        
        

        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
      //  imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: <#T##Any?#>, attribute: <#T##NSLayoutConstraint.Attribute#>, multiplier: 10, constant: 10))
        let image = UIImage(named: "beachmap")
        imageView.image = image
        navigationItem.titleView = imageView
        
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
        
        cell.ViewInfo.layer.cornerRadius = 10
        cell.ViewInfo.layer.masksToBounds = true
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.shadowColor = UIColor.systemGray4.cgColor
        cell.contentView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        cell.contentView.layer.shadowOpacity = 1.0
        cell.contentView.layer.shadowRadius = 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 230
        
        
        
    }
    
    
    func formataStringResponsaveis(responsaveis: String) -> NSAttributedString {
        
        let tamanhoFonte =  UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? CGFloat(16) : CGFloat(19)

        let boldText = "Responsáveis: "
        let attributsBold = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: tamanhoFonte, weight: .bold)]
        let attributsNormal = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: tamanhoFonte, weight: .regular)]
        let attributedString = NSMutableAttributedString(string: responsaveis, attributes:attributsNormal)
        let boldStringPart = NSMutableAttributedString(string: boldText, attributes:attributsBold)
        
        boldStringPart.append(attributedString)
        
        return boldStringPart
        
    }
    
}

