#!/usr/bin/python
# Essa é a classe da camada de modelo
# Onde ficam as queries.

__author__="metalpunkpointer"
__date__ ="$31/08/2010 11:50:27$"

"""
    Envie seu comentários, sugestões e/ou críticas
"""

#importa o módulo de conexão
from conexao import Connect;

class ModeloTeste:

    #método construtor
    def __init__(self):
        print;

    #query para teste
    def query(self):
        #instância da classe de conexão
        conn = Connect();
        #usa o atributo de cursor da classe 
        #de conexão para fazer a query
        qry = conn.cur(); 
        qry.execute("SELECT * FROM projetos");
        return qry.fetchall();

    #método destrutor
    def __del__(self):
        del self;