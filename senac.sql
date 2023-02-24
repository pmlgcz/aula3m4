-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Jan-2023 às 15:01
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `senac`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `Cod_Aluno` int(11) NOT NULL,
  `Matricula_Aluno` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `Tel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`Cod_Aluno`, `Matricula_Aluno`, `Nome`, `Endereco`, `Tel`) VALUES
(1, 2023999999, 'Matheus Valviesse', 'Estrada do Magarca - Guaratiba', 2147483647),
(2, 2023909756, 'Marcelo Souto', 'Santa cruz rua sla', 2147483647),
(3, 2023125511, 'Yasmin', 'favela', 2147483647);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `Cod_Curso` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Tipo` varchar(100) DEFAULT NULL,
  `Tempo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`Cod_Curso`, `Nome`, `Tipo`, `Tempo`) VALUES
(1, 'Tecnico Informatica', 'Técnico', '1 ano e 2 meses'),
(2, 'Artes', 'Desenho', '6 meses'),
(3, 'React JS', 'Programação', '1 ano e 6meses');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `Cod_Disc` int(11) NOT NULL,
  `Ementa` varchar(300) DEFAULT NULL,
  `Cont_Prog` varchar(200) DEFAULT NULL,
  `Cod_Prof` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `Cod_Prof` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `Especialidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `Cod_Aluno` int(11) NOT NULL,
  `Cod_Turma` int(11) NOT NULL,
  `Cod_Disc` int(11) DEFAULT NULL,
  `Cod_Curso` int(11) DEFAULT NULL,
  `Data_Ini` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`Cod_Aluno`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`Cod_Curso`);

--
-- Índices para tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`Cod_Disc`),
  ADD KEY `Cod_Prof` (`Cod_Prof`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`Cod_Prof`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`Cod_Turma`),
  ADD KEY `Cod_Disc` (`Cod_Disc`),
  ADD KEY `Cod_Curso` (`Cod_Curso`),
  ADD KEY `Cod_Aluno` (`Cod_Aluno`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `Cod_Aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `Cod_Curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `Cod_Disc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `Cod_Turma` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`Cod_Prof`) REFERENCES `professor` (`Cod_Prof`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`Cod_Disc`) REFERENCES `disciplina` (`Cod_Disc`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`Cod_Curso`) REFERENCES `curso` (`Cod_Curso`),
  ADD CONSTRAINT `turma_ibfk_3` FOREIGN KEY (`Cod_Aluno`) REFERENCES `aluno` (`Cod_Aluno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
