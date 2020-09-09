//
//  FormatarDadosDeProjeto.swift
//  BeachMapMobile
//
//  Created by Jean Macena on 09/09/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import Foundation
import UIKit

class FormatarDadosDeProjeto{

    func retornaStatus(status: String) -> String {
        
        switch status {
        case "emProgresso":
            return "Em Progresso"
        case "Rascunho":
            return "Rascunho"
        case "Deletado":
            return "Deletado"
        case "Parado":
            return "Parado"
        case "Concluido":
            return "Concluído"
        case "NaoIniciado":
            return "Não Iniciado"
        default:
            return "Sem status"
        }
        
    }

    func retornaOportunidades(oportunidades: [String]) -> String {
        var oportunidadeRetorno = ""
        
        for oportunidade in oportunidades {
            oportunidadeRetorno += "* " + oportunidade + "\n"
        }
        return oportunidadeRetorno
    }

    func formataData(data:String) -> String {
        return "Data da última atualização: \(data)"
    }
    
    func formataResponsaveis(responsaveis: String) -> NSAttributedString {
        
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
