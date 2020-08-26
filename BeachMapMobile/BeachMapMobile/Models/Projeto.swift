//
//  File.swift
//  BeachMapMobile
//
//  Created by Wilton Garcia on 26/08/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import Foundation

class Projeto{
    
    let id: Int
    let nome: String
    let escritorio: String
    let descricao: String
    let responsaveis: String
    
    init(id:Int, nome:String, escritorio:String, descricao:String,responsaveis:String){
       
        self.id = id
        self.nome = nome
        self.escritorio = escritorio
        self.descricao = descricao
        self.responsaveis = responsaveis
        
    }
    
}
