from fastapi import FastAPI


app = FastAPI()

PROJETOS = [
    {
        "id": 1,
        "nome": "Beach Map",
        "escritorio": "BH",
        "descricao": "Atualmente tem pessoas na praia que querem ter alguma experiência prática em um projeto e experimentar novas tecnologias e metodologias. O objetivo do BeachMap é conectar essas pessoas a projetos de praia disponíveis, ajudá-los a se desenvolver e contribuir para o lançamento de novos projetos incríveis. Além disso, o BeachMap tem o objetivo de centralizar e tornar visíveis os projetos que de fato estão acontecendo, que antes eram gerenciados por formulários e distribuídos pelas praias dos escritórios.",
        "desafios":"Integração com Okta; Integração com Jigsaw; Integração com CircleCI; Praticar testes automatizados; Praticar Redux; Cumprir os critérios de segurança estabelecidos pelo time de TechOps",
        "techStack":"* React \n * Heroku \n* Jest \n* React Testing Library",
        "oportunidade":["DEV", "XD"],
        "status":"emProgresso",
        "dataUltimaAtualizacao":"01/01/2001",
        "responsaveis": "vitor.pires@email.com"
    },
    {
        "id": 2,
        "nome": "Beach Map 2",
        "escritorio": "BH",
        "descricao": "Atualmente tem pessoas na praia que querem ter alguma experiência prática em um projeto e experimentar novas tecnologias e metodologias. O objetivo do BeachMap é conectar essas pessoas a projetos de praia disponíveis, ajudá-los a se desenvolver e contribuir para o lançamento de novos projetos incríveis. Além disso, o BeachMap tem o objetivo de centralizar e tornar visíveis os projetos que de fato estão acontecendo, que antes eram gerenciados por formulários e distribuídos pelas praias dos escritórios.",
        "desafios":"Integração com Okta; Integração com Jigsaw; Integração com CircleCI; Praticar testes automatizados; Praticar Redux; Cumprir os critérios de segurança estabelecidos pelo time de TechOps",
        "techStack":"* React \n * Heroku \n* Jest \n* React Testing Library2",
        "oportunidade":["DEV", "XD"],
        "status":"emProgresso",
        "dataUltimaAtualizacao":"01/01/2001",
        "responsaveis": "vitor.pires@email.com"
    },
 {
        "id": 3,
        "nome": "Beach Map 3",
        "escritorio": "BH",
        "descricao": "Atualmente tem pessoas na praia que querem ter alguma experiência prática em um projeto e experimentar novas tecnologias e metodologias. O objetivo do BeachMap é conectar essas pessoas a projetos de praia disponíveis, ajudá-los a se desenvolver e contribuir para o lançamento de novos projetos incríveis. Além disso, o BeachMap tem o objetivo de centralizar e tornar visíveis os projetos que de fato estão acontecendo, que antes eram gerenciados por formulários e distribuídos pelas praias dos escritórios.",
        "desafios":"Integração com Okta; Integração com Jigsaw; Integração com CircleCI; Praticar testes automatizados; Praticar Redux; Cumprir os critérios de segurança estabelecidos pelo time de TechOps",
        "techStack":"* React \n * Heroku \n* Jest \n* React Testing Library3",
        "oportunidade":["DEV", "XD"],
        "status":"emProgresso",
        "dataUltimaAtualizacao":"01/01/2001",
        "responsaveis": "vitor.pires@email.com"
    },
]

@app.get("/projetos")
def listar_projetos():
    return PROJETOS