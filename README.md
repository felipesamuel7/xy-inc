XY Inc - Site de busca por localidades próximas a determinadas coordenadas e distância;

Este projeto usa Spring MVC, Spring ORM JPA, Spring Framework e Bootstrap.

Script para criação de banco:
CREATE SCHEMA xyinc;
USE xyinc;
CREATE TABLE xyinc.ponto_interesse (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  coordenada_x INT(10) NOT NULL,
  coordenada_y INT(10) NOT NULL,
  PRIMARY KEY (id));
  
Usuário: root
Senha: 123456
Qualquer alteração no usuário, senha ou nome do banco, é necessário atualizar os dados de conexão no arquivo xyinc-dispatcher-servlet.xml

link para execução: localhost:8080/xyinc/
