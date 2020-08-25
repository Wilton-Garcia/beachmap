from fastapi import FastAPI


app = FastAPI()

PROJETOS = [
    {
        "id": 1,
        "nome": "Projeto exemplo 1",
        "descricao": "Descrição de exemplo, Descrição de exemplo",
        "escritorio": "BH",
        "responsavel": "vitor.pires@email.com"
    },
        {
        "id": 2,
        "nome": "Projeto exemplo 2",
        "descricao": "Descrição de exemplo, Descrição de exemplo",
        "escritorio": "SP",
        "responsavel": "wilton.garcia@email.com"
    },
    {
        "id": 3,
        "nome": "Projeto exemplo 3",
        "descricao": "Descrição de exemplo, Descrição de exemplo",
        "escritorio": "POA",
        "responsavel": "wilton.garcia@email.com"
    },
       {
        "id": 4,
        "nome": "Projeto exemplo 4",
        "descricao": "Descrição de exemplo, Descrição de exemplo",
        "escritorio": "Recife",
        "responsavel": "vitor.pires@email.com"
    }
]

@app.get("/projetos")
def listar_projetos():
    return PROJETOS