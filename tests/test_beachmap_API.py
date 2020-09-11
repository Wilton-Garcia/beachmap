from starlette.testclient import TestClient
from starlette.status import HTTP_200_OK
from gerenciador_projetos.projetos import app


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
    resposta = client.post("/projeto", json={"nome_projeto": 2 * "*"})
    assert resposta.status_code == 422
    resposta = client.post("/projeto", json={"nome_projeto": 101 * "*"})
    assert resposta.status_code == 422
