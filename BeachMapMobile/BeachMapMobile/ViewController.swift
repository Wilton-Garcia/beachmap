//
//  ViewController.swift
//  BeachMapMobile
//
//  Created by LAVitor Pires on 26/08/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ProjetosAPIDelegate{
    @IBOutlet weak var tabelaProjetos: UITableView!
    
    var projetosAPI = ProjetosAPI()
    var projetos = [Projeto]() {
        didSet {
            DispatchQueue.main.async {
                self.tabelaProjetos.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        projetosAPI.delegate = self
        projetosAPI.getData()
        tabelaProjetos.delegate = self
        tabelaProjetos.dataSource = self
        AdicionaNavBar()
         self.tabelaProjetos.reloadData()
    }
    
    func atualizarProjeto(projetos: [Projeto]) {
        self.projetos = projetos
    }
  
    func AdicionaNavBar () {

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "beachmap")
        imageView.image = image
        navigationItem.titleView = imageView
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(projetos.count) Teste")
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
        
        cell.textView.textContainer.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        let projetoSelecionado = projetos[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(identifier: "detalhes") as! DetalhesViewController
        controller.projetoSelecionado = projetoSelecionado
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

