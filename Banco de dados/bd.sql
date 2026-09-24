CREATE TABLE Pagamento (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo VARCHAR(30) UNIQUE
);

CREATE TABLE Usuario(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    login VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cargo VARCHAR(20) NOT NULL CHECK (cargo IN ('ADMIN','ATENDENTE'))
);

CREATE TABLE Produto(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor NUMERIC(10,2) NOT NULL CHECK (valor > 0),
    categoria VARCHAR(30) NOT NULL,
    disponivel BOOLEAN NOT NULL DEFAULT true,
    data_atualizacao TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE Comanda(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mesa VARCHAR(50) NOT NULL,
    nome_cliente VARCHAR(100),
    status VARCHAR(20) NOT NULL DEFAULT 'ABERTA',
    data_abertura TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    data_fechamento TIMESTAMPTZ,
    valor_total NUMERIC(10,2),
    usuario_abertura BIGINT NOT NULL,
    pagamento_id BIGINT,

    FOREIGN KEY (usuario_abertura) REFERENCES Usuario(id) ON DELETE RESTRICT,
    FOREIGN KEY (pagamento_id) REFERENCES Pagamento(id) ON DELETE RESTRICT
);

CREATE TABLE Item_Comanda(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    comanda_id BIGINT NOT NULL,
    produto_id BIGINT NOT NULL,
    quantidade integer check(quantidade>0),
    preco_unitario NUMERIC(10,2) NOT NULL CHECK(preco_unitario > 0),

    FOREIGN KEY (comanda_id) REFERENCES Comanda(id) ON DELETE RESTRICT,
    FOREIGN KEY (produto_id) REFERENCES Produto(id) ON DELETE RESTRICT
)

