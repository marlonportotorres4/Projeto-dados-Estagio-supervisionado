# Projeto de Análise de Dados de Petróleo e Combustíveis no Brasil. (EM DESENVOLVIMENTO)

Este repositório contém o desenvolvimento de um projeto para análise de dados públicos da ANP sobre o mercado de petróleo e combustíveis.

O conjunto de dados consiste em bases de dados que mostram sobre sua produção(1997 - 2025), processamento(1990 - 2025), importação e exportação do petróleo e seus derivados(2000 - 2025) e, por ultimo, sobre o combustivel automotivo que tem total relação com o petróleo(2004, 2010, 2016, 2020, 2022 e 2025).

O objetivo é fazer um processo de dados completo, desde estruturação incial e entendimento do negócio, até a Modelagem de dados, EDA, ETL, POWER BI (Dashboards) e Machine learning.

## Pipeline Inicial do Projeto de Análise de Dados de Petróleo e Combustíveis

### Fase 1: Estruturação e Entendimento (Onde estamos)
1.1. Definição do Problema de Negócio
1.2. Coleta e Análise Exploratória PRELIMINAR
- Para cada arquivo CSV, faremos uma análise inicial (.info(), .head())
- Documentaremos os achados (tipos de dados a corrigir, colunas importantes)
1.3. Modelagem de Dados
- Com base nos achados, vamos desenhar nosso Star Schema (Tabelas Fato e Dimensão)

### Fase 2: Engenharia de Dados (ETL - Extract, Transform, Load)
2.1. Criação da Estrutura no Banco de Dados
- Escreveremos o código SQL para criar as tabelas vazias no MySQL.
2.2. Desenvolvimento do Script de Carga e Tratamento
- Criaremos o script Python que lê os CSVs, limpa os dados (corrige tipos, trata nulos), e carrega nas tabelas do MySQL.

### Fase 3: Visualização inicial com POWER BI
- 3.1. Conexão do Power BI ao Banco de Dados
- 3.2. Criação de dashboards iniciais 

### Fase 4: Análise Exploratória de Dados PROFUNDA (EDA)
- 4.1. Análise Univariada (estudo de cada variável)
- 4.2. Análise Bivariada e Multivariada (cruzamento de variáveis)
- 4.3. Geração de Gráficos e Descoberta de Insights

### Fase 5: Modelagem Preditiva (Machine Learning)
- 5.1. Preparação dos Dados para o Modelo
- 5.2. Treinamento de Modelos Não-Supervisionados (clusters, anomalias)
- 5.3. Interpretação dos Resultados

#### Fase 6: Visualização e Apresentação Detalhada com Power BI
- 6.2. Criação de Dashboards mais detalhados
- 6.3. Apresentação dos Resultados e Insights

## Modelo de Dados (Star Schema)

Abaixo está o Diagrama Entidade-Relacionamento (DER) do nosso Data Warehouse, modelado com uma arquitetura de Constelação de Fatos.

![Modelo de Dados do Projeto](Assets/SchemaDados.drawio.svg)

## Fonte dos Dados

Aqui você pode encontrar a fonte utilizada para obter os dados:

https://dados.gov.br/dados/organizacoes/visualizar/agencia-nacional-do-petroleo-gas-natural-e-biocombustiveis-anp
