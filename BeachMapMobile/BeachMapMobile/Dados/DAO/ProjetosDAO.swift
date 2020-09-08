//
//  ProjetosDAO.swift
//  BeachMapMobile
//
//  Created by LAVitor Pires on 08/09/20.
//  Copyright © 2020 LAVitor Pires. All rights reserved.
//

import Foundation

class ProjetosDAO {
    
    func retornaProjetos() -> [Projeto] {
        
        return [
            Projeto(id: 0, nome: "The Good News Corona Virus",
                    escritorio: "BRASIL",
                    descricao: "Criamos este site para mostrar que existe esperança em meio ao caos. Aqui mostraremos todas as notícias positivas em relação ao corona vírus, com o objetivo de deixar esses dias mais leves e esperançosos, mas lembrem-se, nosso cenário atual é bastante crítico. Fiquem em casa e lavem as mãos.",
                    responsaveis: "fernando.fernandes@email.com",
                    desafios: "Desenvolvimento todo baseado em React.",
                    techStack: """
                                * React
                                * Firebase
                                * Google Analytics
                                """,
                    oportunidades: ["B.A."], status: "Em Progresso",
                    dataUltimaAtualizacao: "10/06/2020"),
            Projeto(id: 1, nome: "BeachMap",
                    escritorio: "Belo Horizonte",
                    descricao: "Atualmente, a TW tem pessoas na praia que querem ter alguma experiência prática em um projeto e experimentar novas tecnologias e metodologias. O objetivo do BeachMap é conectar essas pessoas a projetos de praia disponíveis, ajudá-los a se desenvolver e contribuir para o lançamento de novos projetos incríveis. Além disso, o BeachMap tem o objetivo de centralizar e tornar visíveis os projetos que de fato estão acontecendo, que antes eram gerenciados por formulários e distribuídos pelas praias dos escritórios.",
                    responsaveis: "fvieira@email.com",
                    desafios: "Integração com Okta; Integração com Jigsaw; Integração com CircleCI; Praticar testes automatizados; Praticar Redux; Cumprir os critérios de segurança estabelecidos pelo time de TechOps",
                    techStack: """
                            * React
                            * Heroku
                            * Jest
                            * React Testing Library
                            * Flask
                            * Python 3.7
                            * PostgreSQL
                            * Redux
                            * Webpack
                            * CSS Modules
                            * Pytest
                            """,
                    oportunidades: ["XD"], status: "Em progresso",
                    dataUltimaAtualizacao: "06/08/2020"),
            Projeto(id: 2, nome: "Atendo em Libras",
            escritorio: "BRASIL",
            descricao: "No meio dessa pandemia, muitas pessoas surdas estão desamparadas justamente pela barreira na comunicação. O objetivo é reunir os diversos profissionais dispostos, que saibam Libras em algum grau, a ajudar por meio de algum serviço em única plataforma. Por exemplo: psicólogos, professores de reforço escolar, palestras dos assuntos relacionados ao coronavírus, etc. A ideia inicial é criar uma plataforma onde é possível cadastrar os profissionais interessados a colaborar Como o projeto ainda está no papel, necessitamos de todos os profissionais necessários para lançar o site no ar, mesmo que seja MVP.",
            responsaveis: "laura.melo@email.com, felipe.fahrion@email.com, marco.beduschi@email.com, beatriz.lonskis@email.com, mtorreao@email.com",
            desafios: "Criar a plataforma do zero; pensar na forma eficaz do cadastro dos profissionais interessados. Planejar como seria o acompanhamento dos serviços oferecidos, para que estejam dentro do principal objetivo, que é saber Libras e ser capaz de conversar com as pessoas surdas.",
            techStack: """
                    * React
                    * Heroku
                    * Jest
                    * React Testing Library
                    """,
            oportunidades: ["Dev"], status: "Em progresso",
            dataUltimaAtualizacao: "31/08/2020")
        ]
        
    }
}
