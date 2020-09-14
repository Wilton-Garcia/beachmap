//
//  ProjetosAPI.swift
//  BeachMapMobile
//
//  Created by Jean Macena on 08/09/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import Foundation

protocol ProjetosAPIDelegate {
    func atualizarProjeto(projetos: [Projeto])
}

struct ProjetosAPI {
    
    var delegate: ProjetosAPIDelegate?
    let urlPadrao = "https://still-oasis-83911.herokuapp.com"
    
    func getData() -> () {
        let urlString = "\(urlPadrao)/projetos"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data,response,error) in
                if error != nil {
                    print("Error")
                }
                
                if let safeData = data {
                    let decode = JSONDecoder()
                    do {
                        let decoderData = try decode.decode([Projeto].self, from: safeData)
                        self.delegate?.atualizarProjeto(projetos: decoderData)
                    }
                    catch {
                        print("Error")
                    }
                }
            }
            task.resume()
        }
        
    }
    
    
    func cadastraProjeto() {
        let urlString = URL(string: "\(urlPadrao)/projeto")!
               
               let json = [
                   "id": 8,
                    "nome": "Beach Map 88 - Testando POST",
                   "escritorio": "String",
                   "descricao": "String",
                   "desafios": "String",
                   "techStack": "String",
                   "oportunidade": ["String", "String"],
                   "status": "String",
                   "dataUltimaAtualizacao": "String",
                   "responsaveis": "String"
                   ] as [String : Any]
           
                do {
                   let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                   
                   var request = URLRequest(url: urlString)
                   request.httpMethod = "POST"
                   request.httpBody = jsonData
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   
                   let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
                       data, response, error in
                       
                       if let data = data, let dataString = String(data: data, encoding: .utf8) {
                           print(dataString)
                       }
                       if let httpResponse = response as? HTTPURLResponse {
                           print(httpResponse.statusCode)
                       }
                   }
                   task.resume()
                   
                } catch {
                   print("Erro")
                   
               }
           }
           
    }

