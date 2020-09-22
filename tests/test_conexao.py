from modeloteste import ModeloTeste;

print "\niniciando teste...\n";

#instância da classe do modelo
#e executa a query
teste = ModeloTeste();
rows = teste.query();

#impressão dos result sets da query
import pprint;
print "\n -- Lista de pessoas -- \n";
pprint.pprint(rows);