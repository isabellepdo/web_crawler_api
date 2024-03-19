# Web Crawler API

Esta é uma API construída em Ruby on Rails que utiliza um web crawler para buscar frases categorizadas no site [Quotes to Scrape](http://quotes.toscrape.com/) e disponibiliza os resultados para consulta via API.

## Funcionamento

A API possui um endpoint `/quotes/{SEARCH_TAG}`, onde `{SEARCH_TAG}` é a tag desejada para buscar frases relacionadas. A API verifica se as informações para a tag especificada já estão armazenadas no MongoDB. Se as informações estiverem armazenadas, elas serão retornadas do banco de dados. Caso contrário, a API realizará uma nova consulta ao site para buscar as frases relacionadas à tag especificada.

Além disso, a API possui um job configurado para ser executado duas vezes ao dia, com o objetivo de verificar se há atualizações nas frases relacionadas às tags já consultadas. Se houver atualizações, as novas frases serão armazenadas no MongoDB, sem duplicar os vínculos já existentes.

## Requisitos

- Ruby on Rails
- MongoDB
- Sidekiq
- API REST (protegida por token de acesso)

## Como Executar o Projeto

1. Clone este repositório para o seu ambiente de desenvolvimento:

   ```
   git clone https://github.com/seu-usuario/web-crawler-api.git
   ```

2. Instale as dependências do projeto:

   ```
   bundle install
   ```

3. Execute as migrations para configurar o banco de dados:

   ```
   rails db:migrate
   ```

4. Inicie o servidor Rails:

   ```
   rails server
   ```

5. Acesse a API em `http://localhost:3000`.

## Endpoints

- **GET /quotes/{SEARCH_TAG}**: Retorna as frases relacionadas à tag especificada. Requer um token de acesso válido para autenticação.

## Autenticação

A API utiliza um sistema de autenticação baseado em token. Para obter um token de acesso válido, faça uma solicitação GET para `/get_token`. O token será retornado na resposta da solicitação.

## Exemplo de Uso

Você pode testar a API usando o [Postman](https://www.postman.com/). Aqui está uma [coleção de solicitações](https://www.postman.com/pdoisabelle/workspace/event-organizer-api/collection/9014600-57c0ffc3-2c3b-48e5-b21e-0d9c07a190d1?action=share&creator=9014600) do Postman com exemplos de solicitações para os endpoints disponíveis.
