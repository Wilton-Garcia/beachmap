//
//  File.swift
//  BeachMapMobile
//
//  Created by Wilton Garcia on 26/08/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import Foundation

struct Projeto: Codable{
    
    let id: Int
    let nome: String
    let escritorio: String
    let descricao: String
    let desafios: String
    let techStack: String
    let oportunidade: [String]
    let status: String
    let dataUltimaAtualizacao: String
    let responsaveis: String
    
    init(id:Int, nome:String, escritorio:String, descricao:String, responsaveis:String, desafios:String, techStack:String, oportunidades:[String], status:String, dataUltimaAtualizacao:String){
       
        self.id = id
        self.nome = nome
        self.escritorio = escritorio
        self.descricao = descricao
        self.responsaveis = responsaveis
        self.desafios = desafios
        self.techStack = techStack
        self.oportunidade = oportunidades
        self.status = status
        self.dataUltimaAtualizacao = dataUltimaAtualizacao
        
        
    }
    
}
