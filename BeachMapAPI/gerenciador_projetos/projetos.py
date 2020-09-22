import psycopg2
from gerenciador_projetos.Dados_Projeto import Dados_Projeto
from fastapi import FastAPI
from Modelos.Projeto import Projeto

app = FastAPI()


@app.get("/projetos")
def listar_projetos():
    return Dados_Projeto.PROJETOS

@app.post("/projeto", response_model=Projeto, status_code=201)
def adicionar_projeto(projeto: Projeto):
    novo_projeto = projeto.dict()
    Dados_Projeto.PROJETOS.append(novo_projeto)
    return novo_projeto

@app.get("/projetos2")
def listar_projetos_api():
    conenxaoAoBanco = psycopg2.connect(host='localhost', database='beachmapdb',
    user='postgres', password='1995')
    cur = conenxaoAoBanco.cursor()
    cur.execute('select * from projetos')
    recset = cur.fetchall()
    json_data=[]
    row_headers=[x[0] for x in cur.description]
    for rec in recset:
        json_data.append(dict(zip(row_headers,rec)))
    conenxaoAoBanco.close()
    return json_data




