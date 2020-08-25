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