# 📊 Projeto de Dados da ANP (Agência Nacional do Petróleo)
Este é o repositório do meu projeto focado na análise de dados públicos da Agência Nacional do Petróleo (ANP). O objetivo foi ir desde a extração dos dados da ANP, passando por processos como: ETL, EDA, construção de um dashboard interativo e completo no Power BI, cobrindo todo o ciclo de vida dos dados.

<img src="https://github.com/user-attachments/assets/1aa7b2b4-58b1-4a08-bd54-148591309a01" alt="Demonstração do Dashboard Interativo" width="60%">

## 🎯 Sobre o Projeto
Este projeto nasceu da vontade de aplicar minha capacidade analítica, conhecimentos em Ciência de dados e Análise de dados em um cenário real, utilizando dados públicos de alta relevância para o Brasil. O dashboard final é dividido em três análises principais:

* **Análise de Comércio Exterior:** Focada na balança comercial (importação vs. exportação) de produtos petrolíferos, Gás natural e Etanol.
* **Análise de Combustíveis:** Centrada nos preços médios (Gasolina, Etanol, Diesel) por estado, tendências temporais e dominância das bandeiras de revendedores.
* **Análise das Refinarias:** Uma visão detalhada sobre as Refinarias e seus processamentos, além da origem de produção do petróleo brasileiro.

## 🗃️ Fonte dos Dados
Todos os dados foram extraídos do site de Dados Abertos da ANP. Abaixo você pode acessar o Link para todos os dados utilizados nesse projeto:

[🔗 Clique aqui para acessar a Fonte de Dados da ANP](https://dados.gov.br/dados/organizacoes/visualizar/agencia-nacional-do-petroleo-gas-natural-e-biocombustiveis-anp)


## ⚙️ Processos do Projeto
O projeto foi estruturado em um pipeline completo de dados, desde a coleta bruta até a visualização final, dividido nas seguintes etapas:

### 1. Coleta e Ambiente de Dados
* **Seleção dos Dados:** Escolha e download dos datasets públicos de interesse do portal de Dados Abertos da ANP.
* **Ambiente de Banco de Dados:** Criação de um contêiner Docker (via `docker-compose`) para instanciar um banco de dados MySQL, que serviu como nosso Data Warehouse.

### 2. Análise Exploratória de Dados (EDA)
* **Primeiro Contato:** Utilização de Jupyter Notebooks e Pandas para ter o primeiro contato com os dados.
* **Análise Estrutural:** Verificação da estrutura geral dos arquivos, tipos de dados (`dtypes`), identificação de valores nulos, e análise de problemas iniciais de qualidade.
* **Definição do Modelo:** Separação conceitual das colunas que serviriam como métricas (Fato) e como contexto (Dimensão).

### 3. Modelagem do Data Warehouse
* **Desenho Conceitual:** Modelagem dos dados no **Draw.io** para desenhar o Diagrama Entidade-Relacionamento (DER) e definir o **Esquema Galáxia (Galaxy Schema)** por possuir 4 negócios diferentes a serem analisados.
* **Criação do Schema (DDL):** Escrita do script `schemas.sql` para criar todas as tabelas Fato e Dimensão no MySQL, definindo colunas, tipos de dados, Chaves Primárias (PKs) e Chaves Estrangeiras (FKs).

<img src="Assets/SchemaDados.drawio.svg" alt="Modelo de Dados do Projeto" width="70%">

### 4. Processo de ETL 
* **Carga no DW:** Utilização de Python (Pandas e SQLAlchemy) para carregar os dados tratados para dentro das tabelas criadas no MySQL.
* **Tratamento de Dados:** Aplicação de transformações, limpeza e padronização de dados durante o processo.
* **Otimização de Carga:** Para arquivos CSV muito grandes (que juntos somavam mais de 5 milhões de linhas), foi utilizado um iterador com `chunksize` para carregar os dados em lotes, evitando o esgotamento de memória.
* **Verificação:** Validação pós-carga para garantir que todos os registros foram carregados com sucesso.

### 5. Visualização e Análise (Power BI)
* **Conexão e ETL Fino:** Conexão do Power BI ao Data Warehouse MySQL. O Power Query foi utilizado para alguns tratamentos e ajustes finos nos dados.
* **Modelagem de Dados:** Verificação das relações, cardinalidade (1-para-Muitos) e ocultação de chaves na exibição de modelo do Power BI, confirmando o Galaxy Schema.
* **Design (UI):** Criação de um layout "Dark Mode" e um plano de fundo utilizando o Canva.
* **Desenvolvimento (UX):** Desenvolvimento dos visuais, métricas DAX, e implementação da navegação interativa (botões, marcadores) diretamente no Power BI.

Para uma descrição mais detalhada, sobre o processo envolvendo o PowerBI + Vídeo demonstração, dê uma olhada meu post completo no LinkedIn:

[🔗 Clique aqui para ver o post no LinkedIn sobre este projeto](https://www.linkedin.com/posts/marlon-porto-torres_powerbi-dataanalysis-businessintelligence-activity-7394806768364830720-Qqc9)

## 💡 Principais Insights Retirados

* **Balança Comercial Geral:** No geral, pode-se visualizar que a balança comercial do Brasil melhorou bastante ao decorrer dos anos, visto que a partir de 2016 mais exportamos do que importamos, isso é um sinal de superávit comercial, indica que o país está sendo competitivo internacionalmente. Considerando o período de 2016 a 2024, o valor exportado cresceu cerca de 301% (de aproximadamente 14,5 bilhões para 58,2 bilhões de USD), enquanto as importações aumentaram cerca de 107% (de 13,6 bilhões para 28,2 bilhões de USD), o que reforça que as exportações vêm crescendo em ritmo bem mais acelerado do que as importações. Em consequência, o superávit comercial também se expandiu de cerca de 0,9 bilhão em 2016 para quase 29,9 bilhões de USD em 2024, evidenciando o ganho de competitividade externa do país nesse período. 
* **Principal Produto:** É sólido afirmar que o petróleo é, de fato, o produto mais negociado, liderando tanto as exportações quanto as importações, em valor e em volume. Nas exportações, o petróleo representa cerca de 72% de todo o volume físico negociado entre os dez principais produtos e aproximadamente 69% do valor total exportado desse grupo, mostrando altíssima concentração da pauta exportadora nesse item. Do lado das importações, embora a pauta seja um pouco mais diversificada, o petróleo ainda responde por cerca de 34% do volume e 37% do valor total entre os dez produtos mais importados, mantendo-se como o principal item também na conta de compras externas. Considerando apenas o petróleo, o volume exportado é aproximadamente 2,3 vezes maior que o volume importado, e o valor das exportações é cerca de 2 vezes superior ao das importações, reforçando o papel estratégico desse produto para a geração de superávit comercial e a importância de boas práticas logísticas e de comércio exterior nesse segmento.
* **Pressão de preços e desigualdade regional:** Entre 2004 e 2025, o diesel se consolida como o combustível que mais pressiona o custo de energia no Brasil, acumulando alta de cerca de 336% no período, contra aproximadamente 276% do etanol e 195% da gasolina, com pico em 2022, quando atinge em torno de R$ 6,63 frente a cerca de R$ 6,32 da gasolina e R$ 4,85 do etanol, sinalizando maior sensibilidade do diesel a choques externos (petróleo e câmbio) e à política de preços.

  Ao mesmo tempo, a comparação entre estados revela uma forte desigualdade regional, onde o Acre sustenta, de forma recorrente e histórica, os maiores preços médios, com gasolina em torno de R$ 4,26, etanol próximo de R$ 3,27 e diesel em cerca de R$ 3,82, enquanto São Paulo apresenta os menores valores médios, com gasolina em torno de R$ 3,42, etanol em R$ 2,23 e diesel em aproximadamente R$ 2,58 (Perdendo apenas para Pernambuco, Ceará e Santa Catarina), o que significa que, em termos relativos, a gasolina chega a ser cerca de 25% mais cara no Acre, o etanol em torno de 47% e o diesel aproximadamente 48% mais caro do que em São Paulo, evidenciando o peso da logística, da distância das refinarias e da estrutura produtiva local na formação de preços e sugerindo que consumidores e empresas em regiões periféricas sofrem um impacto proporcionalmente maior no custo de mobilidade e transporte.
* **Estratégia de bandeira e sensibilidade a preço:** A bandeira branca se consolida como o principal formato de revenda no país, reunindo 11.118 postos, quase o dobro do número de revendedores associados à Petrobras (5.743) e cerca de três vezes mais do que a Ipiranga (3.705), o que indica uma forte preferência dos revendedores por maior liberdade de compra e negociação frente às distribuidoras tradicionais. Do ponto de vista de preço, essa opção mais flexível também se traduz em competitividade para o consumidor: em 2025, os postos de bandeira branca praticam, em média, preços ligeiramente menores que as grandes bandeiras em todos os principais combustíveis, com o diesel cerca de 2,8% mais barato que na Petrobras e 2,5% abaixo da Ipiranga, a gasolina aproximadamente 3% e 2,2% mais barata, respectivamente, e o etanol com desconto ainda maior, em torno de 4,8% frente à Petrobras e 2,9% frente à Ipiranga, sugerindo que a ausência de contratos de exclusividade tende a favorecer uma estrutura de preços mais agressiva e potencialmente mais favorável ao consumidor final.
* **Concentração no Processamento** Os dados mostram uma forte concentração do refino em São Paulo, que reúne 6 das 18 refinarias do conjunto analisado e responde sozinho por cerca de 43% de todo o volume processado no período de 2000 à 2025, algo em torno de 1,17 bilhão de m³, enquanto Bahia participa com aproximadamente 13%, Rio de Janeiro com cerca de 12% e Rio Grande do Sul com algo próximo de 8,7%; somados, os seis estados mais relevantes (São Paulo, Bahia, Rio de Janeiro, Paraná, Rio Grande do Sul e Minas Gerais) concentram perto de 95% do processamento nacional, evidenciando um parque de refino altamente concentrado em poucos polos regionais, principalmente em São Paulo. Nesse contexto, a REPLAN, localizada em São Paulo, se consolida como a maior refinaria do país, processando cerca de 525 milhões de m³ ao longo da série e respondendo sozinha por aproximadamente 19% de todo o volume das 18 refinarias, enquanto as três maiores unidades (REPLAN, REFMAT e REVAP) somadas chegam a quase 45% do total processado, o que reforça o peso estrutural dessas plantas na oferta de derivados e na segurança do abastecimento nacional.
* **Origem estratégica e soberania no refino:** A análise da origem da produção deixa claro que o petróleo brasileiro é predominantemente offshore: cerca de 93% do volume total produzido vem do mar, contra apenas 7% extraído em terra, o que indica que o foco estrutural de investimento em exploração, tecnologia e mitigação de riscos precisa estar concentrado nas bacias marítimas, especialmente no offshore profundo e no pré-sal. Ao mesmo tempo, quando olhamos para o que efetivamente entra nas refinarias, percebe-se que aproximadamente 81% de todo o volume processado ao longo do período é de petróleo nacional, enquanto cerca de 17% corresponde a petróleo importado e pouco mais de 2% a outras cargas, evidenciando que o parque de refino brasileiro opera majoritariamente ancorado em matéria-prima extraída no próprio território, o que reforça a importância estratégica das reservas domésticas para a segurança energética e reduz, em parte, a vulnerabilidade do país a choques de oferta externa.

## 🛠️ Principais Tecnologias Utilizadas
* **Python**
* **SQL** 
* **Docker**
* **Power BI** 
* **GitHub**
* **Draw.io**  
* **Excel**

## 🧑 Créditos
* **Autor:** Marlon Torres
* **[LinkedIn](https://www.linkedin.com/in/marlon-porto-torres/)**
* **[GitHub](https://github.com/marlonportotorres4)**
