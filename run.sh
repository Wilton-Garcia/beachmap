pipenv shell
python3 -m pytest
cd gerenciador_projetos
uvicorn --reload gerenciador_projetos.projetos:app