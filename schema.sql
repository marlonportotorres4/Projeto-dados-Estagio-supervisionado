
-- DIMENSÕES


CREATE TABLE dim_calendario (
    id_calendario INT PRIMARY KEY,
    data_completa DATE,
    ano INT,
    mes_numero INT,
    mes_nome VARCHAR(20),
    dia_numero INT,
    trimestre_numero INT,
    trimestre_nome VARCHAR(20),
    semestre_numero INT,
    semestre_nome VARCHAR(20),
    dia_da_semana VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE dim_localizacao (
    id_localizacao INT AUTO_INCREMENT PRIMARY KEY,
    municipio VARCHAR(100),
    estado VARCHAR(100),
    uf_sigla CHAR(2),
    regiao VARCHAR(50),
    bairro VARCHAR(100),
    cep CHAR(10),
    nome_rua VARCHAR(255),
    numero_rua VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE dim_revendedor (
    id_revendedor INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(20) NOT NULL,
    revenda_nome VARCHAR(255),
    bandeira VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE dim_produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    produto_nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(100),
    subcategoria VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE dim_refinaria (
    id_refinaria INT AUTO_INCREMENT PRIMARY KEY,
    nome_refinaria VARCHAR(100),
    id_localizacao INT,
    CONSTRAINT fk_refinaria_localizacao
        FOREIGN KEY (id_localizacao) REFERENCES dim_localizacao(id_localizacao)
) ENGINE=InnoDB;


-- FATOS


CREATE TABLE f_producao (
    id_calendario INT NOT NULL,
    id_localizacao INT NOT NULL,
    id_produto INT NOT NULL,
    tipo_origem_producao VARCHAR(50),
    volume_produzido DECIMAL(22, 8),
    CONSTRAINT fk_producao_calendario FOREIGN KEY (id_calendario) REFERENCES dim_calendario(id_calendario),
    CONSTRAINT fk_producao_localizacao FOREIGN KEY (id_localizacao) REFERENCES dim_localizacao(id_localizacao),
    CONSTRAINT fk_producao_produto FOREIGN KEY (id_produto) REFERENCES dim_produto(id_produto)
) ENGINE=InnoDB;

CREATE TABLE f_processamento (
    id_calendario INT NOT NULL,
    id_produto INT NOT NULL,
    id_refinaria INT NOT NULL,
    volume_processado DECIMAL(22, 8),
    CONSTRAINT fk_processamento_calendario FOREIGN KEY (id_calendario) REFERENCES dim_calendario(id_calendario),
    CONSTRAINT fk_processamento_produto FOREIGN KEY (id_produto) REFERENCES dim_produto(id_produto),
    CONSTRAINT fk_processamento_refinaria FOREIGN KEY (id_refinaria) REFERENCES dim_refinaria(id_refinaria)
) ENGINE=InnoDB;

CREATE TABLE f_comercio_exterior (
    id_calendario INT NOT NULL,
    id_produto INT NOT NULL,
    tipo_operacao VARCHAR(20),
    volume_negociado DECIMAL(22, 8),
    valor_negociado DECIMAL(18, 4),
    CONSTRAINT fk_comercio_calendario FOREIGN KEY (id_calendario) REFERENCES dim_calendario(id_calendario),
    CONSTRAINT fk_comercio_produto FOREIGN KEY (id_produto) REFERENCES dim_produto(id_produto)
) ENGINE=InnoDB;

CREATE TABLE f_precos_combustiveis (
    id_calendario INT NOT NULL,
    id_localizacao INT NOT NULL,
    id_produto INT NOT NULL,
    id_revendedor INT NOT NULL,
    unidade_medida VARCHAR(20),
    valor_venda DECIMAL(18, 4),
    valor_compra DECIMAL(18, 4),
    CONSTRAINT fk_precos_calendario FOREIGN KEY (id_calendario) REFERENCES dim_calendario(id_calendario),
    CONSTRAINT fk_precos_localizacao FOREIGN KEY (id_localizacao) REFERENCES dim_localizacao(id_localizacao),
    CONSTRAINT fk_precos_produto FOREIGN KEY (id_produto) REFERENCES dim_produto(id_produto),
    CONSTRAINT fk_precos_revendedor FOREIGN KEY (id_revendedor) REFERENCES dim_revendedor(id_revendedor)
) ENGINE=InnoDB;