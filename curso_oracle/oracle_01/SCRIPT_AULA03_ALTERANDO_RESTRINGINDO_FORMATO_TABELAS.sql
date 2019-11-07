DESC COMPRAS;

INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, RECEBIDO)
VALUES (ID_SEQ.NEXTVAL, 500, '03-AUG-2015', NULL, '1');

SELECT * COMPRAS;

SELECT * FROM COMPRAS
WHERE OBSERVACOES IS NULL;

SELECT * FROM COMPRAS
WHERE COMPRAS IS NOT NULL;

DELETE FROM COMPRAS
WHERE OBSERVACOES IS NULL;

SELECT * FROM COMPRAS
WHERE OBSERVACOES IS NULL;

ALTER TABLE COMPRAS MODIFY (
OBSERVACOES VARCHAR2(30) NOT NULL
);

INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, RECEBIDO)
VALUES (ID_SEQ.NEXTVAL, 500, '03-AUG-2015', NULL, '1');

DESC COMPRAS;

INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, RECEBIDO)
VALUES (ID_SEQ.NEXTVAL, 500, '03-AUG-2015', 'PRESENTE PRO FILHO', '1');

ALTER TABLE COMPRAS MODIFY (RECEBIDO CHAR DEFAULT '0' CHECK (RECEBIDO IN (0, 1)));

INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES)
VALUES (ID_SEQ.NEXTVAL, 500, '03-AUG-2015', 'PRESENTE PRO FILHO');

ALTER TABLE COMPRAS
ADD (FORMA_PAGT VARCHAR2(10) CHECK (FORMA_PAGT IN ('BOLETO', 'DINHEIRO', 'CARTAO')));

DESC COMPRAS;

INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, FORMA_PAGT)
VALUES (ID_SEQ.NEXTVAL, 500, '15-AUG-2015', 'PRESENTE PRO MAE', 'BOLETO');

UPDATE COMPRAS
SET FORMA_PAGT = 'DINHEIRO' WHERE FORMA_PAGT IS NULL;

ALTER TABLE COMPRAS 
RENAME COLUM FORMA_PAGT TO FORMA_PAGTO;