/*1) Donnez le numéro, le nom de tous les médecins ayant la spécialité S1 */
	SELECT NUMMED, NOMMED FROM medecin WHERE SPECIALITE='S1'; 
/* 2 Donnez les différentes spécialités*/
	   SELECT DISTINCT(SPECIALITE) FROM medecin;
 /*3. Donnez le numéro, le nom et la date de naissance de tous les malades de sexe
masculin par ordre croissant de l’âge.*/
	SELECT NUMPATIENT,NOMPATIENT,DATENAISS FROM patient WHERE SEXE='masculin' ORDER BY DATENAISS DESC;
/*Donnez le numéro, le nom et la date de naissance de tous les malades de sexe
féminin dont l’adresse contient « p » par ordre croissant du nom.*/
	SELECT NUMPATIENT,NOMPATIENT,DATENAISS FROM patient WHERE ADRESSELIKE '%P%' AND SEXE='feminin' ORDER BY NOMPATIENT;	
/*5. Donnez le numéro, le nom et la date de naissance du malade ainsi que le
numéro, la catégorie et le type de la chambre occupé par chaque malade.*/
	SELECT patient.NUMPATIENT,patient.NOMPATIENT,patient.DATENAISS,lit.NUMCHAMBRE,CATCHAMBRE,TYPECHAM FROM patient, chambre,occuper,lit WHERE patient.NUMPATIENT=occuper.NUMPATIENT AND lit.NUMCHAMBRE=chambre.NUMCHAMBRE AND occuper.IDLIT=lit.IDLIT;
/*6. Donnez le numéro, le nom et la date de naissance du malade ainsi que le
numéro et le des départements où le malade né le 22-4-2012 ont été internés.*/
	SELECT patient.NUMPATIENT, patient.NOMPATIENT, patient.DATENAISS, interner.IDDEP, departement.NOMDEP FROM patient, interner, departement WHERE patient.NUMPATIENT = interner.NUMPATIENT AND departement.IDDEP = interner.IDDEP AND day(patient.DATENAISS) = 22 AND YEAR(patient.DATENAISS)=2012 AND MONTH(patient.DATENAISS)=4 ;
/*7. Donnez le numéro, le nom et la date de naissance de tous les malades suivis
par le médecin M3*/
	SELECT patient.NUMPATIENT, patient.NOMPATIENT,patient.DATENAISS FROM patient, consulter, medecin WHERE patient.NUMPATIENT=consulter.NUMPATIENT AND consulter.NUMMED=medecin.NUMMED AND NOMMED='M3';
/*8. Donnez le numéro, le nom et la date de naissance de tous les malades suivis
par le médecin M3 et qui ont occupé le lit numéro 21.*/	
SELECT patient.NUMPATIENT, patient.NOMPATIENT,patient.DATENAISS FROM patient, consulter, medecin,occuper WHERE patient.NUMPATIENT=consulter.NUMPATIENT AND consulter.NUMMED=medecin.NUMMED AND patient.NUMPATIENT=occuper.NUMPATIENT AND NOMMED='M3' AND IDLIT=21;
/*9. Donnez le numéro, le nom et la date de naissance de tous les malades qui ont
occupé le lit numéro 21.*/
	SELECT patient.NUMPATIENT, patient.NOMPATIENT,patient.DATENAISS FROM patient,occuper WHERE patient.NUMPATIENT= occuper.NUMPATIENT AND IDLIT=21;
/*10.Donnez le numéro, le nom et la date de naissance du malade ainsi que le
numéro et la date pour le suivit de l’évolution du malade numéro 11.*/
	SELECT patient.NUMPATIENT, patient.NOMPATIENT,patient.DATENAISS, feuille.NUMFEUILLE, feuille.DATE FROM patient, feuille WHERE patient.NUMPATIENT= feuille.NUMPATIENT AND feuille.NUMFEUILLE=11;
/*11.Donnez le nombre de malades internés dans chaque département.*/
	SELECT interner.IDDEP, departement.NOMDEP, COUNT( interner.IDDEP) FROM interner, departement WHERE interner.IDDEP=departement.IDDEP GROUP BY (interner.IDDEP);
/*12.Donnez le numéro, le nom, l’adresse du malade ainsi que le nom du médecin
de tous les malades suivis par un médecin du département D2.*/
	SELECT patient.NUMPATIENT, patient.NOMPATIENT,patient.ADRESSE,medecin.NOMMED FROM patient , consulter,medecin, departement,interner WHERE patient.NUMPATIENT=consulter.NUMPATIENT AND consulter.NUMMED=medecin.NUMMED and medecin.IDDEP=departement.IDDEP AND departement.NOMDEP='D2';
/*13.Donnez le numéro, le nom, l’adresse de tous les malades qui ont été internés
au mois de février ou au mois de décembre.*/
	SELECT p.NUMPATIENT, p.NOMPATIENT, p.ADRESSE FROM patient p, interner i WHERE P.NUMPATIENT=i.NUMPATIENT AND ( MONTH(i.DATE)=2 OR 12);
/*14.Donnez toutes les informations de la chambre ayant accueilli le plus de
malade.*/
	SELECT chambre.NUMCHAMBRE,chambre.CATCHAMBRE,chambre.TYPECHAM, COUNT(occuper.NUMPATIENT)as plusoccuper FROM lit JOIN chambre on lit.NUMCHAMBRE=chambre.NUMCHAMBRE JOIN occuper ON occuper.IDLIT=lit.IDLIT group by lit.NUMCHAMBRE ORDER BY plusoccuper DESC LIMIT 1 ;
/*15.Donnez toutes les informations du département ayant accueilli le plus de
malade*/
	SELECT departement.IDDEP,departement.NOMDEP, COUNT(patient.NOMPATIENT) AS NOMBRE FROM departement JOIN interner on interner.IDDEP=departement.IDDEP JOIN patient ON patient.NUMPATIENT=interner.NUMPATIENT group by interner.IDDEP order by NOMBRE DESC LIMIT 1 ;
/*16.Donnez toutes les informations de la chambre ayant accueilli le plus de
malade.*/
SELECT chambre.NUMCHAMBRE,chambre.CATCHAMBRE,chambre.TYPECHAM, COUNT(occuper.NUMPATIENT)as plusoccuper FROM lit JOIN chambre on lit.NUMCHAMBRE=chambre.NUMCHAMBRE JOIN occuper ON occuper.IDLIT=lit.IDLIT group by lit.NUMCHAMBRE ORDER BY plusoccuper DESC LIMIT 1 ;
/*17.Donnez toutes les informations du médecin ayant suivi le plus de malade.*/
	SELECT m.NUMMED, m.NOMMED,m.SPECIALITE ,COUNT(p.NUMPATIENT) as nbrconsultation FROM medecin m JOIN consulter c ON m.NUMMED=c.NUMMED JOIN patient p ON P.NUMPATIENT=C.NUMPATIENT ORDER by m.NUMMED ASC LIMIT 1 ;
/*18.Donnez le numéro, le nom et la date de naissance du malade, le numéro de la
chambre et le numéro du lit des patients qui son suivi par un médecin avec la
spécialité S2*/
	SELECT p.NUMPATIENT,p.NOMPATIENT,p.ADRESSE,p.SEXE,p.DATENAISS,p.LIEUNAISS FROM patient p JOIN occuper on p.NUMPATIENT=occuper.NUMPATIENT JOIN LIT ON occuper.IDLIT=lit.IDLIT JOIN chambre ON chambre.NUMCHAMBRE=lit.NUMCHAMBRE JOIN consulter CON ON P.NUMPATIENT=con.NUMPATIENT JOIN medecin ON CON.NUMMED=medecin.NUMMED where medecin.SPECIALITE='S2' ;
/*19.Donnez l’évolution du premier malade qui à été interné au département D2
en juin 2020*/
SELECT ETAT FROM feuille f JOIN departement d ON f.IDDEP=d.IDDEP JOIN interner i on i.IDDEP=D.IDDEP where year(i.DATE)=2020 and MONTH(i.DATE)=6 ORDER BY I.DATE LIMIT 1 ;
/*20.Donnez le numéro des lits qui n’ont pas été occupés au mois de mars.*/
SELECT DISTINCT lit.IDLIT FROM LIT, occuper WHERE LIT.IDLIT NOT IN (SELECT occuper.IDLIT FROM occuper WHERE MONTH(occuper.DATE)=3) 