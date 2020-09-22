from starlette.testclient import TestClient
from starlette.status import HTTP_200_OK
from gerenciador_projetos.projetos import app

projeto_generico = {
    "id": 0,
    "nome": "Beach Map",
    "escritorio": "Belo Horizonte",
    "status": "Em Progresso",
    "dataUltimaAtualizacao": "01/01/2020",
    "descricao": "Um projeto muito legal",
    "desafios": "Aprender Swift",
    "techStack": "Swift Python",
    "oportunidade": ["XD","DEV"],
    "responsaveis": "vitor.pires@email.com"
}



def test_API_retorna_200():
    cliente = TestClient(app)
    resposta = cliente.get("/projetos")
    assert resposta.status_code == HTTP_200_OK
    

def test_quando_listar_projetos_formato_de_retorno_deve_ser_json():
    cliente = TestClient(app)
    resposta = cliente.get("/projetos")
    assert resposta.headers["Content-Type"] == "application/json"


def test_quando_listar_projetos_retorno_deve_ser_uma_lista():
    cliente = TestClient(app)
    resposta = cliente.get("/projetos")
    assert isinstance(resposta.json(), list)

def test_quando_submeter_projeto_deve_ter_titulo():
    cliente = TestClient(app)
    resposta = cliente.post("/projeto", json={})
    assert resposta.status_code == 422

def test_nome_projeto_deve_conter_entre_3_e_100_caracteres():
    client = TestClient(app)
    resposta = client.post("/projeto", json={"nome": 2 * "*"})
    assert resposta.status_code == 422
    resposta = client.post("/projeto", json={"nome": 101 * "*"})
    assert resposta.status_code == 422

def test_projeto_deve_ter_uma_descricao():
    client = TestClient(app)
    resposta = client.post("/projeto", json={"nome":"Beach Map"})
    assert resposta.status_code == 422

def test_descricao_do_projeto_deve_ter_entre_5_e_4000_caracteres():
    client = TestClient(app)
    resposta = client.post("/projeto", json={"nome":"Beach Map", "descricao": 4001 * "*"})
    assert resposta.status_code == 422

def test_quando_criar_um_projeto_o_mesmo_deve_ser_retornado():
    client = TestClient(app)
    resposta = client.post("/projeto", json=projeto_generico)
    assert resposta.json() == projeto_generico

def test_quando_criar_um_projeto_o_status_deve_ser_201():
    client = TestClient(app)  
    resposta = client.post("/projeto", json=projeto_generico)
    assert resposta.status_code == 201