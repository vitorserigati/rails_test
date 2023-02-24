# Project Bankline API

Esta API foi criada para participar de um processo seletivo. Suas funções são:

[x] Um usuário pode se cadastrar e posteriormente realizar login. (Utilizar gem Devise para agilizar o processo)

[x] Cada usuário possui uma carteira virtual. Essa carteira possui o saldo e um histórico de transações.

[x] Todo usuário, ao se registrar, recebe um crédito de 100,00 em sua carteira.

[x] Se o usuário estiver logado, ele terá acesso a uma lista com todos os usuários do sistema.

[x] Qualquer usuário pode realizar uma transferência para qualquer outro usuário. Desde que possua saldo suficiente.

[x] O sistema precisa manter um histórico de transações, para o usuário poder acompanhar o balanço de sua carteira, com saídas e entradas.

[x] O usuário, ao acessar sua carteira, vai poder ver seu saldo, seu histórico de transações e solicitar saque.

[x] O saque nada mais é do que digitar um valor menor ou igual ao que ele possui de saldo, adicionar no histórico de transações esse saque e diminuir o saldo da carteira.

[x] Criar um campo de busca no cabeçalho (visível em todas as páginas), para o usuário pesquisar ATIVOS da bolsa de valores (PETR4, PETR3, ITSA4, BIDI4, VALE3, etc). Fazer uma integração com a API da alphavantage.(https://www.alphavantage.co/documentation/). Utilizar o endpoint “https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{searched_symbol}.SA&interval=5min&apikey=PEQV59FJ89YWFKP5” para obter os resultados. Mostrar o resultado do campo Time Series (Daily) numa tabela, apenas para fins de consulta. 


## Utilização da API

1. Ao baixar o repositório, utilizar o comando bundle install para instalação de todas as gems necessárias.

2. Configurar as variáveis de ambiente para conter o devido usuário do banco de dados POSTGRES, com a variável "POSTGRES_USER".

3. Todas as requisições que necessitam de headers, necessitam do access_token, uid, e client.

4. Utilização das rotas:

    1. Users:

        - POST/ api/v1/auth -  Criação de Usuário. Parâmetros necessários: first_name, middle_name, last_name, password, password_confirmation, email, cpf, phone_number
        
        - DELETE/ api/v1/auth - Excluir usuário. Parâmetros: header
        
        - PUT/ api/v1/auth - Atualizar dados do usuário. Parâmetros possíveis: first_name, middle_name, last_name, phone_number, nickname 

        - POST/ api/v1/auth/password - Recuperar Senha. Parâmetros:  email

        - POST/ api/v1/auth/password - Password Reset. Parâmetros: email e redirect_url

        - POST/ api/v1/auth/confirmation - Reenvia email de confirmação. Parâmetros: email

        - POST/ api/v1/auth/sign_in - Realizar login. Parâmetros: email, password

        - DELETE/ api/v1/auth/sign_in - Realiza logout. Parâmetros: headers

        - GET/ api/v1/auth/validate_token - Realiza a validação do token. Parâmetros: headers

        - GET/ api/v1/user - Trás toda a lista de usuários do sistema, assim como o id de suas carteiras, excluindo o próprio requisitante. Parâmetros: headers

        - GET/ api/v1/user/:id - Trás apenas um usuário, procurando por id. Parâmetros: headers

    2. Wallet:

        - POST/ api/v1/transaction - Realiza uma transação para a carteira solicitada. Parâmetros: "to_wallet" -> wallet id, "amount" -> "quantia a ser transferida" e os headers.

        - POST/ api/v1/withdraw - Realiza um saque. Parâmetros: "amount" -> valor a ser sacado. Headers.

        - GET/ api/v1/wallet - Recupera dados da própria carteira, como balance e transações. Parâmetros: headers

        - GET/ api/v1/alphavantage - Trás informações sobre Ativos da bolsa do campo "Time Series (Daily)" conforme requisitado. Parâmetros: symbol -> Nome do ativo. Sem o ".SA". 



|   Information needed:  |  |
|             ---    | --- |
| Ruby Version | 3.1.3    |
| Database     |Postgresql|
| Rails Version|7.0.4.2   |
