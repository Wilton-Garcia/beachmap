#!/usr/bin/python
# Aqui está a classe que será usada
# como módulo de conexão.
#driver de conexão com pgsql
import psycopg2

class Connect:

    #atributo global para ser
    #usado no modelo
    global cur;

    #método construtor
    def __init__(self):
        #conexão com banco de dados
        try:
            conn = psycopg2.connect("\
                    dbname='beachmapdb'\
                    user='postgres'\
                    host='127.0.1.1'\
                    password='1995'\
            ");

            self.cur = conn.cursor;
            
        except:
            print "Erro ao se conectar a base de dados!";

    #método destrutor
    def __del__(self):
        print "Conexão finalizada!";
        del self;