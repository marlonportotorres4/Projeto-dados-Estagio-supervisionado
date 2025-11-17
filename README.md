# 📊 Projeto de Dados da ANP (Agência Nacional do Petróleo)
Este é o repositório do meu projeto focado na análise de dados públicos da Agência Nacional do Petróleo (ANP). O objetivo foi ir desde a extração dos dados da ANP, passando por processos como: ETL, EDA, construção de um dashboard interativo e completo no Power BI, cobrindo todo o ciclo de vida dos dados.

## 🎯 Sobre o Projeto
Este projeto nasceu da vontade de aplicar minha capacidade analítica, conhecimentos em Ciência de dados e Análise de dados em um cenário real, utilizando dados públicos de alta relevância para o Brasil. O dashboard final é dividido em três análises principais:

* **Análise de Comércio Exterior:** Focada na balança comercial (importação vs. exportação) de produtos petrolíferos, Gás natural e Etanol.
* **Análise de Combustíveis:** Centrada nos preços médios (Gasolina, Etanol, Diesel) por estado, tendências temporais e dominância das bandeiras de revendedores.
* **Análise das Refinarias:** Uma visão detalhada sobre as Refinarias e seus processamentos, além da origem de produção do petróleo brasileiro.

## 🗃️ Fonte dos Dados
Todos os dados foram extraídos do site de Dados Abertos da ANP. Abaixo você pode acessar o Link para todos os dados utilizados nesse projeto:

[🔗 Clique aqui para acessar a Fonte de Dados da ANP](https://dados.gov.br/dados/organizacoes/visualizar/agencia-nacional-do-petroleo-gas-natural-e-biocombustiveis-anp)


## ⚙️ Processo do Projeto
O projeto foi estruturado em um pipeline completo de dados, desde a coleta bruta até a visualização final, dividido nas seguintes etapas:

### 1. Coleta e Ambiente de Dados
* **Seleção dos Dados:** Escolha e download dos datasets públicos de interesse do portal de Dados Abertos da ANP.
* **Ambiente de Banco de Dados:** Criação de um contêiner Docker (via `docker-compose`) para instanciar um banco de dados MySQL, que serviu como nosso Data Warehouse.

### 2. Análise Exploratória de Dados (EDA)
* **Primeiro Contato:** Utilização de Jupyter Notebooks e Pandas para ter o primeiro contato com os dados.
* **Análise Estrutural:** Verificação da estrutura geral dos arquivos, tipos de dados (`dtypes`), identificação de valores nulos, e análise de problemas iniciais de qualidade.
* **Definição do Modelo:** Separação conceitual das colunas que serviriam como métricas (Fato) e como contexto (Dimensão).

### 3. Modelagem do Data Warehouse
* **Desenho Conceitual:** Modelagem dos dados no **Draw.io** para desenhar o Diagrama Entidade-Relacionamento (DER) e definir o **Esquema Galáxia (Galaxy Schema)**.
* **Criação do Schema (DDL):** Escrita do script `schemas.sql` para criar todas as tabelas Fato e Dimensão no MySQL, definindo colunas, tipos de dados, Chaves Primárias (PKs) e Chaves Estrangeiras (FKs).

![Modelo de Dados do Projeto](Assets/SchemaDados.drawio.svg)

### 4. Processo de ETL (Python)
* **Carga no DW:** Utilização de Python (Pandas e SQLAlchemy) para carregar os dados tratados para dentro das tabelas criadas no MySQL.
* **Tratamento de Dados:** Aplicação de transformações, limpeza e padronização de dados durante o processo.
* **Otimização de Carga:** Para arquivos CSV muito grandes (que juntos somavam mais de 5 milhões de linhas), foi utilizado um iterador com `chunksize` para carregar os dados em lotes, evitando o esgotamento de memória.
* **Verificação:** Validação pós-carga para garantir que todos os registros foram carregados com sucesso.

### 5. Visualização e Análise (Power BI)
* **Conexão e ETL Fino:** Conexão do Power BI ao Data Warehouse MySQL. O Power Query foi utilizado para alguns tratamentos e ajustes finos nos dados.
* **Modelagem de Dados:** Verificação das relações, cardinalidade (1-para-Muitos) e ocultação de chaves na exibição de modelo do Power BI, confirmando o Galaxy Schema.
* **Design (UI):** Criação de um layout "Dark Mode" e um plano de fundo utilizando o Canva.
* **Desenvolvimento (UX):** Desenvolvimento dos visuais, métricas DAX, e implementação da navegação interativa (botões, marcadores) diretamente no Power BI.

Demonstração do Dashboard Interativo desenvolvido no PowerBI:

![GifDashboard](https://github.com/user-attachments/assets/1aa7b2b4-58b1-4a08-bd54-148591309a01)

Para uma descrição mais detalhada sobre o processo envolvendo o PowerBI + Vídeo demonstração veja meu post completo no LinkedIn:

[🔗 Clique aqui para ver o post no LinkedIn sobre este projeto](https://www.linkedin.com/posts/marlon-porto-torres_powerbi-dataanalysis-businessintelligence-activity-7394806768364830720-Qqc9)

## 💡 Principais Insights Retirados


## 🛠️ Principais Tecnologias Utilizadas
* **Python**
* **SQL** 
* **Docker**
* **Power BI Desktop** 
* **GitHub**
* **Draw.io**  
* **Excel**

## 🧑 Créditos
* **Autor:** Marlon Torres
* **[LinkedIn](https://www.linkedin.com/in/marlon-porto-torres/)**
* **[GitHub](https://github.com/marlonportotorres4)**