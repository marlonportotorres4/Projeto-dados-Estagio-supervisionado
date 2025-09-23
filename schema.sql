
USE projetopetroleo;


/* Dimensão Calendário
    descrição: Tabela com os dados de calendário
 */

CREATE TABLE dim_calendario  (
    id_calendario INT PRIMARY KEY,
    ano INT,
    mes_numero INT,
    mes_nome VARCHAR(20),
    data_completa DATE,
    trimestre_numero INT,
    trimestre_nome VARCHAR(20),
    semestre_numero INT,
    semestre_nome VARCHAR(20),
    dia_da_semana VARCHAR(20),
    dia_numero INT
) ENGINE=InnoDB;


/* Dimensão Localização
    descrição: Tabela com os dados de localização
 */

CREATE TABLE dim_localizacao  (
    id_localizacao INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(100),
    municipio VARCHAR(100),
    uf_sigla CHAR(2),
    regiao VARCHAR(50),
    bairro VARCHAR(100),
    cep CHAR(10),
    nome_rua VARCHAR(255),
    numero_rua VARCHAR(20)
) ENGINE=InnoDB;

/* Dimensão Revendedor
    descrição: Tabela com os dados de revendedor
 */

CREATE TABLE dim_revendedor  (
    id_revendedor INT PRIMARY KEY AUTO_INCREMENT,
    cnpj CHAR(20) NOT NULL,
    revenda_nome VARCHAR(255),
    bandeira VARCHAR(100)
) ENGINE=InnoDB;

/* Dimensão Refinaria
    descrição: Tabela com os dados de refinaria
 */

CREATE TABLE dim_refinaria  (
    id_refinaria INT PRIMARY KEY AUTO_INCREMENT,
    id_localizacao INT,
    nome_refinaria VARCHAR(100),

    CONSTRAINT fk_refinaria_localizacao
        FOREIGN KEY (id_localizacao)
        REFERENCES dim_localizacao(id_localizacao)
) ENGINE=InnoDB;

/* Dimensão Produto
    descrição: Tabela com os dados de produto
 */

CREATE TABLE dim_produto  (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    produto_nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(100),
    subcategoria VARCHAR(100),
    origem_producao VARCHAR(50),
    origem_materia_prima VARCHAR(100)
) ENGINE=InnoDB;

/* Fato Produção
    descrição: Tabela com os dados de produção
 */

CREATE TABLE f_producao  (
    id_calendario INT NOT NULL,
    id_localizacao INT NOT NULL,
    id_produto INT NOT NULL,
    volume_produzido DECIMAL(18, 4),
    
    CONSTRAINT fk_producao_calendario
        FOREIGN KEY (id_calendario)
        REFERENCES dim_calendario(id_calendario),
    CONSTRAINT fk_producao_produto
        FOREIGN KEY (id_produto)
        REFERENCES dim_produto(id_produto),
    CONSTRAINT fk_producao_localizacao
        FOREIGN KEY (id_localizacao)
        REFERENCES dim_localizacao(id_localizacao)
) ENGINE=InnoDB;


/* Fato Processamento
    descrição: Tabela com os dados de processamento
 */

CREATE TABLE f_processamento  (
    id_calendario INT NOT NULL,
    id_produto INT NOT NULL,
    id_refinaria INT NOT NULL,
    volume_processado DECIMAL(18, 4),
    
    CONSTRAINT fk_processamento_calendario
        FOREIGN KEY (id_calendario) 
        REFERENCES dim_calendario(id_calendario),
    CONSTRAINT fk_processamento_produto
        FOREIGN KEY (id_produto) 
        REFERENCES dim_produto(id_produto),
    CONSTRAINT fk_processamento_refinaria
        FOREIGN KEY (id_refinaria) 
        REFERENCES dim_refinaria(id_refinaria)
) ENGINE=InnoDB;

/* Fato Comercio Exterior
    descrição: Tabela com os dados de exterior
 */

CREATE TABLE f_comercio_exterior  (
    id_calendario INT NOT NULL,
    id_produto INT NOT NULL,
    volume_negociado DECIMAL(22, 8),
    valor_negociado DECIMAL(18, 4),
    tipo_operacao VARCHAR(15),
    
    CONSTRAINT fk_comercio_calendario
        FOREIGN KEY (id_calendario) 
        REFERENCES dim_calendario(id_calendario),
    CONSTRAINT fk_comercio_produto
        FOREIGN KEY (id_produto) 
        REFERENCES dim_produto(id_produto)
) ENGINE=InnoDB;

/* Fato Preços Combustível
    descrição: Tabela com os dados de preços
 */

CREATE TABLE f_precos_combustiveis (
    id_calendario INT NOT NULL,
    id_localizacao INT NOT NULL,
    id_produto INT NOT NULL,
    id_revendedor INT NOT NULL,
    unidade_medida VARCHAR(20),
    valor_venda DECIMAL(18, 4),
    valor_compra DECIMAL(18, 4),

    
    CONSTRAINT fk_precos_calendario
        FOREIGN KEY (id_calendario) 
        REFERENCES dim_calendario(id_calendario),
    CONSTRAINT fk_precos_localizacao
        FOREIGN KEY (id_localizacao) 
        REFERENCES dim_localizacao(id_localizacao),
    CONSTRAINT fk_precos_produto
        FOREIGN KEY (id_produto) 
        REFERENCES dim_produto(id_produto),
    CONSTRAINT fk_precos_revendedor
        FOREIGN KEY (id_revendedor) 
        REFERENCES dim_revendedor(id_revendedor)
) ENGINE=InnoDB;