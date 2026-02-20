--Afisarea detaliilor despre facturi, incluzand numele clientului si al angajatului care a emis factuta
--Testez legatura intre factura, client si angajat
SELECT
c.nume AS "Nume Client",
a.nume || ' ' || a.prenume AS "Angajat Emitent",
f.data AS "Data facturarii",
f.valoarea || ' RON' AS "Valoarea Totala",
CASE 
WHEN f.persoana_fizica = 'Da' THEN 'Persoana Fizica'
ELSE 'Persoana Juridica'
END AS "Tip Client"
FROM factura f
JOIN client c ON f.id_client = c.id_client
JOIN angajat a ON f.id_angajat = a.id_angajat
ORDER BY f.data DESC;

--Contract de aprovizionare care contine furnizorul si angajatul responsabil
--Testez legatura dintre furnizor, contract si angajat
SELECT
fur.nume AS "Nume furnizor",
fur.telefon AS "Telefon furnizor",
con.specificatii AS "Specficatii contract",
con.data_incepere AS "Data incepere",
con.data_incheiere AS "Data incheiere",
a.nume || ' ' || a.prenume AS "Responsabil contract",
a.functie AS "Functie responsabil"
FROM contract con
JOIN furnizor fur ON con.iban = fur.iban
JOIN angajat a ON con.id_angajat = a.id_angajat;

--Lista clientilor si conturilor lor in aplicatie 
--Testez legatura dintre client si cont_in_aplicatie
SELECT
cl.nume AS "Nume in factura",
cl.adresa AS "Adresa livrare",
cont.nume AS "Username aplicatie",
cont.email AS "Email aplicatie"
FROM client cl
JOIN cont_in_aplicatie cont ON cl.id_cont = cont.id_cont;

--Testare constrangeri primary key
--Nu pot exista doi furnizori cu acelasi IBAN 
INSERT INTO furnizor(iban, nume, telefon)
VALUES('RO10BTRL0000111122223333', 'Furnizor Duplicat SRL', 0700000000);
--ORA-00001: unique constraint (RO_A285_SQL_S45.FURNIZOR_IBAN_PK) violated

--Testare constrangere NOT NULL
--Adaugarea unui produs fara denumire trebuie sa fie interzisa
INSERT INTO produs(denumire, brand, stoc, tip_produs, pret, data_expirare)
VALUES(NULL, 'Brand test', 100, 'Test', 50, SYSDATE);
--ORA-01400: cannot insert NULL into ("RO_A285_SQL_S45"."PRODUS"."DENUMIRE")

--Testare constrangere UNIQUE KEY
--Nu pot exista doi angajati cu acelasi CNP
INSERT INTO angajat(cnp, nume, prenume, salariu, functie, email)
VALUES(2900101123456, 'Popescu', 'Ion', 5000, 'vanzator', 'ion.popescu@gmail.com');
--ORA-00001: unique constraint (RO_A285_SQL_S45.ANGAJAT_CNP_UK) violated

--Testare constrangere check
--Emailul trebuie sa respecte formatul standard
INSERT INTO angajat(cnp, nume, prenume, salariu, functie, email)
VALUES(1990000000000, 'Test', 'email', 3000, 'casier', 'email_gresit.com');
--ORA-02290: check constraint (RO_A285_SQL_S45.ANGAJAT_EMAIL_CK) violated

--Testare constrangere foreign key
--Nu se poate adauga o factura pentru un client inexistent
INSERT INTO factura(persoana_fizica, persoana_juridica, data, valoarea, id_angajat, id_client)
VALUES('Da', 'Nu', SYSDATE, 50, 251, 9999);
--ORA-02291: integrity constraint (RO_A285_SQL_S45.ANGAJAT_FACTURA_FK) violated - parent key not found

--Testare constrangere foreign key
--Nu se poate sterge un furnzior daca acesta are contracte active asociate
DELETE FROM furnizor WHERE iban = 'RO10BTRL0000111122223333';
--ORA-02292: integrity constraint (RO_A285_SQL_S45.FURNIZOR_CONTRACT_FK) violated - child record found
