# database-locadora-de-carros# Projeto Final do Curso de MySQL

Este projeto foi desenvolvido como conclusão do curso de MySQL. Ele contém a modelagem, criação e consultas de um banco de dados relacional com foco em locadora de veículos

## 🚀 Funcionalidades do Banco

- Criação de tabelas com chaves primárias e estrangeiras
- Inserção de dados
- Consultas com `JOIN`, `GROUP BY`, `ORDER BY`, `WHERE`
- Funções agregadas
- Subconsultas

## 🗃️ Estrutura do Projeto

- `script-criacao.sql`: Tabelas e relacionamentos
- `script-inserts.sql`: Dados de exemplo
- `script-consultas.sql`: Exemplos de SELECTs, JOINS, etc
- `diagrama-er.png`: Diagrama Entidade-Relacionamento

## 📸 Exemplo de Consulta

```sql
SELECT clientes.nome, carros.modelo
FROM locacoes
JOIN clientes ON locacoes.id_cliente = clientes.id
JOIN carros ON locacoes.id_carro = carros.id;
