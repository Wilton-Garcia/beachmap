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

struct ProjetosAPI{
    
    var delegate: ProjetosAPIDelegate?
    
    func getData() -> () {
        let urlString = "https://still-oasis-83911.herokuapp.com/projetos"
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
}
