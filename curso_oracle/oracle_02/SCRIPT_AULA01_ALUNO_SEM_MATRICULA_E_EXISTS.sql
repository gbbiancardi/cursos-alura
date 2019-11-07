SELECT ALUNO.NOME, CURSO.NOME FROM ALUNO
JOIN MATRICULA ON MATRICULA.ALUNO_ID = ALUNO.ID
JOIN CURSO ON CURSO.ID = MATRICULA.CURSO_ID;

SELECT A.NOME FROM ALUNO A; -- APELIDO PARA A TABELA

SELECT A.NOME, C.NOME FROM ALUNO A -- QUERY UTILIZANDO APELIDOS PARA AS TABELAS
JOIN MATRICULA M ON M.ALUNO_ID = A.ID
JOIN CURSO C ON M.CURSO_ID = C.ID;

SELECT COUNT(*) FROM ALUNO;

SELECT A.NOME FROM ALUNO A
WHERE EXISTS (
	SELECT M.ID FROM MATRICULA M
	WHERE M.ALUNO_ID = A.ID
);

SELECT A.NOME FROM ALUNO A
WHERE NOT EXISTS (
	SELECT M.ID FROM MATRICULA M
	WHERE M.ALUNO_ID = A.ID
);

SELECT * FROM EXERCICIO E
WHERE NOT EXISTS (
	SELECT R.ID FROM RESPOSTA R
	WHERE R.EXERCICIO_ID = E.ID
);

SET LINESIZE 200;

SELECT C.NOME FROM CURSO C
WHERE NOT EXISTS(
	SELECT M.ID FROM MATRICULA M
	WHERE M.CURSO_ID = C.ID
);

-- Busque todos os alunos que n�o tenham nenhuma matr�cula nos cursos.
SELECT A.NOME FROM ALUNO A
WHERE NOT EXISTS (
	SELECT M.ID FROM MATRICULA M
	WHERE M.ALUNO_ID = A.ID
);

-- Busque todos os alunos que n�o tiveram nenhuma matr�cula no �ltimo ano, usando a instru��o EXISTS.
SELECT A.NOME FROM ALUNO A
WHERE NOT EXISTS(
	SELECT M.ID FROM MATRICULA M
	WHERE M.ALUNO_ID = A.ID AND M.DATA > (SELECT SYSDATE - INTERVAL '1' YEAR FROM DUAL)
);

-- � poss�vel fazer a mesma consulta sem usar EXISTS? Se sim, d� o c�digo. Se n�o, fale um pouco sobre isso.
SELECT A.NOME FROM ALUNO A
WHERE (
    SELECT COUNT(M.ID) FROM MATRICULA M
	WHERE M.ALUNO_ID = A.ID AND
	M.DATA > (SELECT SYSDATE - INTERVAL '1' YEAR FROM DUAL)) = 0;