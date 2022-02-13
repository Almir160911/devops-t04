Existem basicamente duas formas de criar imagem Docker:

1. A partir de um container em execução que você fez customizações.
2. A partir de um arquivo chamado Dockerfile

Nossa missão será criar o Dockerfile  que terá a missão de criar uma imagem de Docker customizada com a nossa aplicação Python preparada para rodar no container criado a partir dessa imagem.

---

###1.
Vamos acessar o nosso Visual Studio Code para fazer as alterações no repositório. Caso você prefira fazer pelo terminal fique a vontade.

No Visual Studio vamos criar uma nova Branch para fazer esse processo de colocar a aplicação no Docker

![](https://trello.com/1/cards/61fc6e30719a31076e5ba42e/attachments/61fc726ff5e5c20cf7a46ec0/download/image.png)

---

###2.
Crie um Dockerfile com o conteúdo abaixo:

```
# Use uma Imagem Official do Python
FROM python:rc-slim

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Garante que será iniciado a aplicação.
CMD ["gunicorn", "app:app"]

