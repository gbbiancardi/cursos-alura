DESC NOTA;

DESC RESPOSTA;

DESC EXERCICIO;

DESC SECAO;

SELECT C.NOME, AVG(N.NOTA) FROM NOTA N
	JOIN RESPOSTA R ON R.ID = N.RESPOSTA_ID
	JOIN EXERCICIO E ON E.ID = R.EXERCICIO_ID
	JOIN SECAO S ON S.ID = E.SECAO_ID
	JOIN CURSO C ON C.ID = S.CURSO_ID;

SELECT C.NOME, AVG(N.NOTA) FROM NOTA N
	JOIN RESPOSTA R ON R.ID = N.RESPOSTA_ID
	JOIN EXERCICIO E ON E.ID = R.EXERCICIO_ID
	JOIN SECAO S ON S.ID = E.SECAO_ID
	JOIN CURSO C ON C.ID = S.CURSO_ID
GROUP BY C.NOME;

SELECT COUNT(E.ID) FROM EXERCICIO E
	JOIN SECAO S ON S.ID = E.SECAO_ID
	JOIN CURSO C ON C.ID = S.CURSO_ID
GROUP BY C.NOME;

SELECT C.NOME, COUNT(E.ID) AS QUANTIDADE FROM EXERCICIO E
	JOIN SECAO S ON S.ID = E.SECAO_ID
	JOIN CURSO C ON C.ID = S.CURSO_ID
GROUP BY C.NOME;

SELECT C.NOME, COUNT(A.ID) FROM CURSO C
	JOIN MATRICULA M ON M.CURSO ID = C.ID
	JOIN ALUNO A ON A.ID = M.ALUNO_ID
GROUP BY C.NOME;

-- Exiba a m�dia das notas por curso.
SELECT C.NOME, AVG(C.NOTA) AS MEDIA FROM NOTA N
	JOIN RESPOSTA R ON R.ID = N.RESPOSTA_ID
	JOIN EXERCICIO E ON E.ID = R.EXERCICIO_ID
	JOIN SECAO S ON S.ID = E.SECAO_ID
	JOIN CURSO C ON C.ID = S.CURSO_ID
GROUP BY C.NOME;

-- Selecione o curso e as m�dias de notas, levando em conta somente alunos que tenham "Silva" ou "Santos" no sobrenome.
SELECT C.NOME, AVG(C.NOTA) AS MEDIA FROM NOTA N
	JOIN RESPOSTA R ON R.ID = N.RESPOSTA_ID
	JOIN EXERCICIO E ON E.ID = R.EXERCICIO_ID
	JOIN SECAO S ON S.ID = E.SECAO_ID
	JOIN CURSO C ON C.ID = S.CURSO_ID
	JOIN ALUNO A ON A.ID = R.ALUNO_ID
WHERE A.NOME LIKE '%SILVA%' OR A.NOME LIKE '%SANTOS%'
GROUP BY C.NOME;

-- Conte a quantidade de respostas por exerc�cio. Exiba a pergunta e o n�mero de respostas.
SELECT E.PERGUNTA, COUNT(R.ID) AS QUANTIDADE FROM EXERCICIO E
	JOIN RESPOSTA R ON E.ID = R.EXERCICIO_ID
GROUP BY E.PERGUNTA;

-- Pegue a resposta do exerc�cio anterior, e ordene por n�mero de respostas, em ordem decrescente.
SELECT E.PERGUNTA, COUNT(R.ID) AS QUANTIDADE FROM EXERCICIO E
	JOIN RESPOSTA R ON E.ID = R.EXERCICIO_ID
GROUP BY E.PERGUNTA
ORDER BY COUNT(R.ID) DESC;

-- Podemos agrupar por mais de um campo de uma s� vez. Por exemplo, se quisermos a m�dia de notas por aluno por curso, podemos fazer GROUP BY aluno.nome, curso.nome.
SELECT A.NOME, C.NOME, AVG(C.NOTA) AS MEDIA FROM NOTA N
	JOIN RESPOSTA R ON R.ID = N.RESPOSTA_ID
	JOIN EXERCICIO E ON E.ID = R.EXERCICIO_ID
	JOIN SECAO S ON S.ID = E.SECAO_ID
	JOIN CURSO C ON C.ID = S.CURSO_ID
	JOIN ALUNO A ON A.ID = R.ALUNO_ID
GROUP BY A.NOME, C.NOME;