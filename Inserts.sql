DELETE FROM factura;
DELETE FROM inregistrare;
DELETE FROM client;
DELETE FROM cont_in_aplicatie;
DELETE FROM contract;
DELETE FROM furnizor;
DELETE FROM angajat;
DELETE FROM produs; 
COMMIT;

--inserare in tabel produs
--PRODUS 821
INSERT INTO produs(denumire, brand, stoc, tip_produs, pret, data_expirare)
VALUES('Fond de ten Catrice', 'Catrice', 300, 'fond de ten', 30, TO_DATE('2026-01-13', 'YYYY-MM-DD'));

--PRODUS 822
INSERT INTO produs(denumire, brand, stoc, tip_produs, pret, data_expirare)
VALUES('Creion de buze mat', 'Boys n Berries', 400, 'creion de buze', 30, TO_DATE('2027-01-01', 'YYYY-MM-DD'));

--PRODUS 823
INSERT INTO produs(denumire, brand, stoc, tip_produs, pret, data_expirare)
VALUES('Crema hidratanta pentru ten uscat', 'Cerave', 800, 'crema de fata', 60, TO_DATE('2026-01-01', 'YYYY-MM-DD'));

--PRODUS 824
INSERT INTO produs(denumire, brand, stoc, tip_produs, pret, data_expirare)
VALUES('Fard de obraz lichid hidratant', 'Ultra sheer color', 800, 'fard de obraz', 59, TO_DATE('2028-01-04', 'YYYY-MM-DD'));

--PRODUS 825
INSERT INTO produs(denumire, brand, stoc, tip_produs, pret, data_expirare)
VALUES('Pastile cu vitamina C', 'Plantuf', 800, 'alimente suplimentare', 27, TO_DATE('2028-01-01', 'YYYY-MM-DD'));

--inserare in tabel angajat
--ANGAJAT 251
INSERT INTO angajat(cnp, nume, prenume, salariu, functie, email)
VALUES(2900101123456, 'Ionescu', 'Maria', 10000.00, 'manager_de_magazin', 'ionescumaria@gmail.com');

--ANGAJAT 252
INSERT INTO angajat(cnp, nume, prenume, salariu, functie, email)
VALUES(2950505123456, 'Dimitrescu', 'Elena', 9000.00, 'director_general', 'dimitrescuelena@gmail.com');

--ANGAJAT 253
INSERT INTO angajat(cnp, nume, prenume, salariu, functie, email)
VALUES(2960404527348, 'Petrescu', 'Carina', 8000.00, 'sef_de_raion', 'carinapetrescu@gmail.com');

--ANGAJAT 254
INSERT INTO angajat(cnp, nume, prenume, salariu, functie, email)
VALUES(2911004522758, 'Craciun', 'Mirabela', 8500.00, 'casier', 'cmirabela@gmail.com');

--ANGAJAT 255
INSERT INTO angajat(cnp, nume, prenume, salariu, functie, email)
VALUES(2981109137996, 'Ciobanu', 'Cosmina', 9000.00, 'vanzator', 'ccosmina@gmail.com');

--inserare in tabel furnizor si contract
--FURNIZOR 331 CU CONTRACT 101, ANGAJAT 255, inregistrare 1
INSERT INTO furnizor(iban, nume, telefon)
VALUES('RO10BTRL0000111122223333', 'Beauty Market SRL', 0738618420);

INSERT INTO contract(data_incepere, data_incheiere, id_angajat, specificatii, clauze, iban, id)
VALUES(TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2027-01-01', 'YYYY-MM-DD'), (SELECT id_angajat FROM angajat WHERE nume='Ciobanu'), 'produse de make-up', 'clauza 1', 'RO10BTRL0000111122223333', 1);

--FURNIZOR 332 CU CONTRACT 102, ANGAJAT 255, inregistrare 2
INSERT INTO furnizor(iban, nume, telefon)
VALUES('RO50INGB0000444455556666', 'Make-up Shop SRL', 0728618364);

INSERT INTO contract(data_incepere, data_incheiere, id_angajat, specificatii, clauze, iban, id)
VALUES(TO_DATE('2026-02-12', 'YYYY-MM-DD'), TO_DATE('2027-02-12', 'YYYY-MM-DD'), (SELECT id_angajat FROM angajat WHERE nume='Ciobanu'), 'produse de make-up', 'clauza 2','RO50INGB0000444455556666', 2);

--FURNIZOR 333 CU CONTRACT 103, ANGAJAT 255, inregistrare 3
INSERT INTO furnizor(iban, nume, telefon)
VALUES('RO30BRD1111666644449999', 'Farmacia Tei SRL', 0572018362);

INSERT INTO contract(data_incepere, data_incheiere, id_angajat, specificatii, clauze, iban, id)
VALUES(TO_DATE('2026-01-24', 'YYYY-MM-DD'), TO_DATE('2027-01-24', 'YYYY-MM-DD'), (SELECT id_angajat FROM angajat WHERE nume='Ciobanu'), 'produse de skin care', 'clauza 3', 'RO30BRD1111666644449999', 3);

--FURNIZOR 334 CU CONTRACT 104, ANGAJAT 255, inregistrare 4
INSERT INTO furnizor(iban, nume, telefon)
VALUES('RO49AAAA1B31007593840000', 'Radiant Beauty Distribution', 0230765318);

INSERT INTO contract(data_incepere, data_incheiere, id_angajat, specificatii, clauze, iban, id)
VALUES(TO_DATE('2026-02-01', 'YYYY-MM-DD'), TO_DATE('2027-02-01', 'YYYY-MM-DD'), (SELECT id_angajat FROM angajat WHERE nume='Ciobanu'), 'produse de make-up', 'clauza 5', 'RO49AAAA1B31007593840000', 4);

--FURNIZOR 335 CU CONTRACT 105, ANGAJAT 255, inregistrare 5
INSERT INTO furnizor (iban, nume, telefon) 
VALUES ('RO45BTRL0000123412341234', 'Pure Nature Supplies', 0766777888);

INSERT INTO contract(data_incepere, data_incheiere, id_angajat, specificatii, clauze, iban, id)
VALUES(TO_DATE('2026-01-13', 'YYYY-MM-DD'), TO_DATE('2027-01-13', 'YYYY-MM-DD'), (SELECT id_angajat FROM angajat WHERE nume='Ciobanu'), 'produse suplimente', 'clauza 1', 'RO45BTRL0000123412341234', 5);

--inserare in tabel inregistrare
--INREGISTRARE 1
INSERT INTO inregistrare(id_produs, id_angajat, id_contract)
VALUES((SELECT id_produs FROM produs WHERE denumire='Fond de ten Catrice'), (SELECT id_angajat FROM angajat WHERE nume='Craciun'), 101);

--INREGISTRARE 2
INSERT INTO inregistrare(id_produs, id_angajat, id_contract)
VALUES((SELECT id_produs FROM produs WHERE denumire='Creion de buze mat'), (SELECT id_angajat FROM angajat WHERE nume='Craciun'), 102);

--INREGISTRARE 3
INSERT INTO inregistrare(id_produs, id_angajat, id_contract)
VALUES((SELECT id_produs FROM produs WHERE denumire='Crema hidratanta pentru ten uscat'), (SELECT id_angajat FROM angajat WHERE nume='Craciun'), 103);

--INREGISTRARE 4
INSERT INTO inregistrare(id_produs, id_angajat, id_contract)
VALUES((SELECT id_produs FROM produs WHERE denumire='Fard de obraz lichid hidratant'), (SELECT id_angajat FROM angajat WHERE nume='Craciun'), 104);

--INREGISTRARE 5
INSERT INTO inregistrare(id_produs, id_angajat, id_contract)
VALUES((SELECT id_produs FROM produs WHERE denumire='Pastile cu vitamina C'), (SELECT id_angajat FROM angajat WHERE nume='Craciun'), 105);

--inserare in tabel cont_in_aplicatie, client, factura
--CLIENT 131 CU CONT 551 SI FACTURA 421
INSERT INTO cont_in_aplicatie (nume, email, telefon) 
VALUES ('Claudia', 'claudiadbs@yahoo.com', 0744111222);

INSERT INTO client (nume, adresa, telefon, id_cont) 
VALUES ('Popescu Claudia', 'Str Florilor Nr 1', 0744111222, (SELECT id_cont FROM cont_in_aplicatie WHERE nume='Claudia'));

INSERT INTO factura(persoana_fizica, persoana_juridica, data, valoarea, id_angajat, id_client)
VALUES('Da', 'Nu', TO_DATE('2026-01-16', 'YYYY-MM-DD'), 30, (SELECT id_angajat FROM angajat WHERE nume='Craciun'), (SELECT id_client FROM client WHERE nume='Popescu Claudia'));

--CLIENT 132 CU CONT 552 SI FACTURA 422
INSERT INTO cont_in_aplicatie (nume, email, telefon) 
VALUES ('Diana', 'maria.diana@gmail.com', 0744333444);

INSERT INTO client (nume, adresa, telefon, id_cont) 
VALUES ('Maria Diana', 'Aleea Rozelor Nr 5', 0744851021, (SELECT id_cont FROM cont_in_aplicatie WHERE nume='Diana'));

INSERT INTO factura(persoana_fizica, persoana_juridica, data, valoarea, id_angajat, id_client)
VALUES('Da', 'Nu', TO_DATE('2026-11-13', 'YYYY-MM-DD'), 27, (SELECT id_angajat FROM angajat WHERE nume='Craciun'), (SELECT id_client FROM client WHERE nume='Maria Diana'));

--CLIENT 133 CU CONT 553 SI FACTURA 423
INSERT INTO cont_in_aplicatie (nume, email, telefon) 
VALUES ('Florin', 'florin.andrei@outlook.com', 0744555666);

INSERT INTO client (nume, adresa, telefon, id_cont) 
VALUES ('Florin', 'Bd. Unirii Nr 10', 0744333444, (SELECT id_cont FROM cont_in_aplicatie WHERE nume='Florin'));

INSERT INTO factura(persoana_fizica, persoana_juridica, data, valoarea, id_angajat, id_client)
VALUES('Da', 'Nu', TO_DATE('2027-01-13', 'YYYY-MM-DD'), 60, (SELECT id_angajat FROM angajat WHERE nume='Craciun'), (SELECT id_client FROM client WHERE nume='Florin'));

--CLIENT 134 CU CONT 554 SI FACTURA 424
INSERT INTO cont_in_aplicatie (nume, email, telefon) 
VALUES ('Dumitru Elena', 'elena.d@yahoo.com', 0744777888);

INSERT INTO client (nume, adresa, telefon, id_cont) 
VALUES ('Elena', 'Str. Libertatii Nr 3', 0744777888, (SELECT id_cont FROM cont_in_aplicatie WHERE nume='Dumitru Elena'));

INSERT INTO factura(persoana_fizica, persoana_juridica, data, valoarea, id_angajat, id_client)
VALUES('Da', 'Nu', TO_DATE('2026-07-13', 'YYYY-MM-DD'), 30, (SELECT id_angajat FROM angajat WHERE nume='Craciun'), (SELECT id_client FROM client WHERE nume='Elena'));

--CLIENT 135 CU CONT 555 SI FACTURA 425
INSERT INTO cont_in_aplicatie (nume, email, telefon) 
VALUES ('Vlad', 'vlad.stancu@gmail.com', 0744999000);

INSERT INTO client (nume, adresa, telefon, id_cont) 
VALUES ('Vlad', 'Str. Principala Nr 20', 0744999000, (SELECT id_cont FROM cont_in_aplicatie WHERE nume='Vlad'));

INSERT INTO factura(persoana_fizica, persoana_juridica, data, valoarea, id_angajat, id_client)
VALUES('Da', 'Nu', TO_DATE('2026-01-27', 'YYYY-MM-DD'), 59, (SELECT id_angajat FROM angajat WHERE nume='Craciun'), (SELECT id_client FROM client WHERE nume='Vlad'));


