//
//  BeachMapMobileTests.swift
//  BeachMapMobileTests
//
//  Created by Jean Macena on 09/09/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import XCTest
@testable import BeachMapMobile

class BeachMapMobileTests: XCTestCase {

    func testValidarNomeDoProjeto(){
        let projetos = ProjetosDAO().retornaProjetos()
        XCTAssertEqual("The Good News Corona Virus", projetos[0].nome)
        
    }
    
    func testValidarFormatoDataUltimaAtualizacao(){
        let projetos = ProjetosDAO().retornaProjetos()
        let dataUltimaAtualizacao = DetalhesViewController().formataData(data: projetos[0].dataUltimaAtualizacao)
        XCTAssertEqual("Data da última atualização: 10/06/2020", dataUltimaAtualizacao)
    }

}
