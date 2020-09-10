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
  
    @IBAction func CriaProjeto(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "CriaProjeto")
        self.navigationController?.pushViewController(controller , animated: true)
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
        return projetos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! ProjetosTableViewCell
        
        let projeto = projetos[indexPath.row]
        let stringResponsaveisProjetosFormatada = FormatarDadosDeProjeto().formataResponsaveis(responsaveis: projeto.responsaveis)
        
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
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        let projetoSelecionado = projetos[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(identifier: "detalhes") as! DetalhesViewController
        controller.projetoSelecionado = projetoSelecionado
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

