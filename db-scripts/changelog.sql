-- liquibase formatted sql

--changeset koushik:1 labels:release-1.0 context:prod
--comment: Create table and insert initial data

    CREATE TABLE employees (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

    INSERT INTO employees (id, name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');

-- Rollback DROP TABLE employees;

--changeset koushik:2 labels:task-1234 context:prod
--comment: insert data
    INSERT INTO employees (id, name) VALUES
    (4, 'Diana'),
    (5, 'Edward');

-- Rollback DELETE FROM employees WHERE id IN (4,5);

--changeset koushik:3 labels:bugfix-5678 context:prod
--comment: alter size of name VARCHAR(200)
    ALTER TABLE employees MODIFY name VARCHAR(200); 
-- Rollback ALTER TABLE employees MODIFY name VARCHAR(100);
