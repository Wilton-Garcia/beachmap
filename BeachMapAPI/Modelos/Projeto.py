from pydantic import BaseModel, constr
from typing import List

class Projeto(BaseModel):
    id: int
    nome: constr(min_length=3, max_length=100)
    escritorio: str
    status: str
    dataUltimaAtualizacao: str
    descricao: constr(min_length=5, max_length=4000)
    desafios: str
    techStack: str
    oportunidade: List[str]
    responsaveis: str