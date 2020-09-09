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
    
    
    var projetos:[Projeto]!
    
    override func setUp() {
        super.setUp()
        projetos = ProjetosDAO().retornaProjetos()
    }
    
    override class func tearDown() {
        super.tearDown()
    }

    func testValidarNomeDoProjeto(){
        XCTAssertEqual("The Good News Corona Virus", projetos[0].nome)
        
    }
    
    func testValidarFormatoDataUltimaAtualizacao(){
        let dataUltimaAtualizacao = FormatarDadosDeProjeto().formataData(data: projetos[0].dataUltimaAtualizacao)
        XCTAssertEqual("Data da última atualização: 10/06/2020", dataUltimaAtualizacao)
    }
    
    func testValidarMensagemDoStatusRetornado(){
        let retornoDoStatus = FormatarDadosDeProjeto().retornaStatus(status: projetos[0].status)
        XCTAssertEqual("Em Progresso", retornoDoStatus)
    }
    
    func testValidarFormatoDeOportunidades(){
        let oportunidades = FormatarDadosDeProjeto().retornaOportunidades(oportunidades: projetos[0].oportunidade)
        XCTAssertEqual("* B.A.\n* XD\n", oportunidades)
    }

}
