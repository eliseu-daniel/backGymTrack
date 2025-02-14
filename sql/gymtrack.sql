CREATE DATABASE gymtrack;

USE gymtrack;

CREATE TABLE usuarios(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(100) NOT NULL,
    telefoneUsuario VARCHAR(15) NOT NULL,
    emailUsuario VARCHAR(100) NOT NULL,
    senhaUsuario TEXT NOT NULL,
    tipoUsuario ENUM('admin', 'usuario') NOT NULL,
    tipoPlanoUsuario ENUM('free', 'pago'),
    pagamentoUsuario ENUM('S', 'N')
);

CREATE TABLE pacientes(
    idPaciente INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    nomePaciente VARCHAR(100) NOT NULL,
    emailPaciente VARCHAR(50) NOT NULL,
    telefonePaciente VARCHAR(15) NOT NULL,
    nascimentoPaciente DATE NOT NULL,
    planoAcompanhamento VARCHAR(100) NOT NULL,
    inicioAcompanhamento DATE,
    fimAcompanhamento DATE,
    sexoPaciente ENUM('F', 'M'),
    pagamento VARCHAR(100) NOT NULL,
    alergias VARCHAR(100),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario)
);

CREATE TABLE antropometria(
    idAntropometria INT PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT,
    pesoInicial DECIMAL(5,2) NOT NULL,
    altura DOUBLE NOT NULL,
    gorduraCorporal DECIMAL(5,2) NOT NULL,
    nivelAtvFisica VARCHAR(50),
    objetivo VARCHAR(50),
    tmb DECIMAL(5,2),
    getAntro INT,
    lesoes VARCHAR(100),
    FOREIGN KEY (idPaciente) REFERENCES pacientes(idPaciente)
);

CREATE TABLE dietas(
    idDieta INT PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT,
    idAntropometria INT,
    inicioDieta DATE NOT NULL, 
    horarioRefeicao VARCHAR(6) NOT NULL,
    tipoDieta VARCHAR(50),
    pesoAtual,
    FOREIGN KEY (idPaciente) REFERENCES pacientes(idPaciente),
    FOREIGN KEY (idAntropometria) REFERENCES antropometria(idAntropometria)
);

CREATE TABLE treinos(
    idTreino INT PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT,
    idAntropometria INT,
    inicioTreino DATE NOT NULL,
    tipoTreino VARCHAR(50),
    grupoMuscular VARCHAR(50),
    seriesTreino INT,
    repeticoesTreino INT,
    cargaInicial DECIMAL(5,2),
    cargaAtual DECIMAL(5,2),
    tempoDescanso TEXT,
    diaSemana VARCHAR(50),
    linksExecucao TEXT,
    FOREIGN KEY (idPaciente) REFERENCES pacientes(idPaciente),
    FOREIGN KEY (idAntropometria) REFERENCES antropometria(idAntropometria)
);

CREATE TABLE calendario(
    idCalendario INT PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT,
    prazoPlanoCliente VARCHAR(50) NOT NULL,
    tipoPagamentoCliente VARCHAR(50) NOT NULL,
    FOREIGN KEY (idPaciente) REFERENCES pacientes(idPaciente)
);