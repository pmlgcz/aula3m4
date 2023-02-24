-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/02/2023 às 15:38
-- Versão do servidor: 10.4.8-MariaDB
-- Versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cinema`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `clienteId` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dia`
--

CREATE TABLE `dia` (
  `diaId` int(11) NOT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `dia`
--

INSERT INTO `dia` (`diaId`, `data`) VALUES
(1, '2023-02-18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filme`
--

CREATE TABLE `filme` (
  `filmeId` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `filme`
--

INSERT INTO `filme` (`filmeId`, `nome`) VALUES
(1, 'a morte dos programadores');

-- --------------------------------------------------------

--
-- Estrutura para tabela `horario`
--

CREATE TABLE `horario` (
  `horarioId` int(11) NOT NULL,
  `diaId` int(11) DEFAULT NULL,
  `hora` int(11) DEFAULT NULL,
  `minuto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `horario`
--

INSERT INTO `horario` (`horarioId`, `diaId`, `hora`, `minuto`) VALUES
(1, 1, 13, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingresso`
--

CREATE TABLE `ingresso` (
  `ingressoId` int(11) DEFAULT NULL,
  `sessaoId` int(11) DEFAULT NULL,
  `clienteId` int(11) DEFAULT NULL,
  `poltronaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `poltronas`
--

CREATE TABLE `poltronas` (
  `poltronaId` int(11) NOT NULL,
  `sessaoId` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sala`
--

CREATE TABLE `sala` (
  `salaId` int(11) NOT NULL,
  `salaNumero` int(11) DEFAULT NULL,
  `totalacentos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `sala`
--

INSERT INTO `sala` (`salaId`, `salaNumero`, `totalacentos`) VALUES
(1, 1, 42);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessao`
--

CREATE TABLE `sessao` (
  `sessaoId` int(11) NOT NULL,
  `filmeId` int(11) DEFAULT NULL,
  `horarioId` int(11) DEFAULT NULL,
  `salaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `sessao`
--

INSERT INTO `sessao` (`sessaoId`, `filmeId`, `horarioId`, `salaId`) VALUES
(2, 1, 1, 1);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`clienteId`);

--
-- Índices de tabela `dia`
--
ALTER TABLE `dia`
  ADD PRIMARY KEY (`diaId`);

--
-- Índices de tabela `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`filmeId`);

--
-- Índices de tabela `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`horarioId`),
  ADD KEY `diaId` (`diaId`);

--
-- Índices de tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD KEY `sessaoId` (`sessaoId`),
  ADD KEY `clienteId` (`clienteId`),
  ADD KEY `poltronaId` (`poltronaId`);

--
-- Índices de tabela `poltronas`
--
ALTER TABLE `poltronas`
  ADD PRIMARY KEY (`poltronaId`),
  ADD KEY `sessaoId` (`sessaoId`);

--
-- Índices de tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`salaId`);

--
-- Índices de tabela `sessao`
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`sessaoId`),
  ADD KEY `filmeId` (`filmeId`),
  ADD KEY `horarioId` (`horarioId`),
  ADD KEY `salaId` (`salaId`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `clienteId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dia`
--
ALTER TABLE `dia`
  MODIFY `diaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `filme`
--
ALTER TABLE `filme`
  MODIFY `filmeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `horario`
--
ALTER TABLE `horario`
  MODIFY `horarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `poltronas`
--
ALTER TABLE `poltronas`
  MODIFY `poltronaId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `salaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sessao`
--
ALTER TABLE `sessao`
  MODIFY `sessaoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`diaId`) REFERENCES `dia` (`diaId`);

--
-- Restrições para tabelas `ingresso`
--
ALTER TABLE `ingresso`
  ADD CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`sessaoId`) REFERENCES `sessao` (`sessaoId`),
  ADD CONSTRAINT `ingresso_ibfk_2` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`clienteId`),
  ADD CONSTRAINT `ingresso_ibfk_3` FOREIGN KEY (`poltronaId`) REFERENCES `poltronas` (`poltronaId`);

--
-- Restrições para tabelas `poltronas`
--
ALTER TABLE `poltronas`
  ADD CONSTRAINT `poltronas_ibfk_1` FOREIGN KEY (`sessaoId`) REFERENCES `sessao` (`sessaoId`);

--
-- Restrições para tabelas `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`filmeId`) REFERENCES `filme` (`filmeId`),
  ADD CONSTRAINT `sessao_ibfk_3` FOREIGN KEY (`horarioId`) REFERENCES `horario` (`horarioId`),
  ADD CONSTRAINT `sessao_ibfk_4` FOREIGN KEY (`salaId`) REFERENCES `sala` (`salaId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
