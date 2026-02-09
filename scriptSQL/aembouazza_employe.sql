CREATE DATABASE EMPLOYES ;

--- Création des tables ---
--- (l'ordre est peu important) ---

CREATE TABLE EMP (
	ENO int PRIMARY KEY,
	ENOM varchar(50),
	PROF varchar(50),
	DATEEMB date,
	SAL float,
	COMM FLOAT,
	DNO int
	);
	
CREATE TABLE DEPT (
	DNO int PRIMARY KEY,
	DNOM varchar(50),
	DIR int,
	VILLE varchar(50)
		) ;
	
--- Insertion des données ---
--- (l'ordre est peu important) ---

INSERT INTO EMP values (10, 'Joe', 'Ingénieur', '01/10/1993', 4000.00, 3000.00, 3) ;
INSERT INTO EMP values (20, 'Jack', 'Technicien', '01/05/1988', 3000.00, 2000.00, 2) ;
INSERT INTO EMP values (30, 'Jim', 'Vendeur', '01/03/1980', 5000.00, 5000.00, 1) ;
INSERT INTO EMP values (40, 'Lucy', 'Ingénieur', '01/03/1980', 5000.00, 5000.00, 3) ;

INSERT INTO DEPT values (1, 'Commercial', 30, 'New York') ;
INSERT INTO DEPT values (2, 'Production', 20, 'Houston') ;
INSERT INTO DEPT values (3, 'Développement', 40, 'Boston') ;

--- Insertion des clés étrangères ---
--- Références circulaires ---

ALTER TABLE EMP ADD CONSTRAINT fk_DNO FOREIGN KEY (dno) REFERENCES DEPT(DNO) ;
ALTER TABLE DEPT ADD CONSTRAINT fk_eno FOREIGN KEY (dir) REFERENCES EMP(eno) ;

--question1 )

select ENOM,SAL from emp ;

--question 2)

select distinct PROF from emp ;

--question 3)

select DATEEMB from emp where PROF='technicien';

--question 4)

select * from dept,emp ;

--question 5)

select ENOM , DNOM from dept,emp 
where dept.DNO=emp.DNO
and VILLE='boston';

--question 6)

select ENOM, DIR from emp,dept 
WHERE emp.DNO=dept.DNO
and (dept.DNO=1 or dept.DNO=3)
and dept.DIR=emp.ENO;

-- question 7)

select ENO, ENOM , COMM from EMP 
where COMM is not NULL ;

-- question 8)
select ENOM ,PROF , SAL from EMP 
order by PROF ASC, SAL desc;

--question 9) 

select avg(SAL) from EMP;

--question 10)

select count(EMP.*)
from EMP , DEPT 
where EMP.DNO = DEPT.DNO
and DEPT.DNOM = 'PRODUCTION';

--question 11)

select DNO, MAX(SAL)
from EMP
group by DNO;

--question 12)

select E1.ENOM
from EMP as E1
where E1.DNO in (select E2.DNO
			from EMP as E2
			where E2.prof='INGENIEUR'
			);

--question 13)

select ENOM , SAL from EMP 
where SAL > any (select SAL 
				from EMP
				where PROF='INGENIEUR' 
				);


--question 14)

select ENOM , SAL from EMP 
where SAL > all (select SAL 
				from EMP
				where PROF='INGENIEUR' 
				);

--question 15)

select * from DEPT 
where DNO not in (select DNO from EMP);

--question 16)

select ENOM from EMP  , DEPT 
WHERE EMP.DNO=DEPT.DNO
and DNOM='COMMERCIAL'
and DATEEMB in ( select DATEEMB from EMP , DEPT
                 where EMP.DNO=DEPT.DNO
				 and DNOM='PRODUCTION');

--question 17 )

select ENOM from EMP 
where DATE < all (select DATEEMB from EMP 
                  where DNO=1);

--question 18 )

select ENOM from EMP,DEPT 
where ENOM<> 'JOE'
and EMP.DNO=DEPT.DNO
and (PROF,DIR) = (select PROF,DIR from EMP,DEPT 
                  where ENOM = 'JOE'
				  and EMP.DNO = DEPT.DNO);


--question 19 )

select ENOM from EMP 
where ENOM <> "JIM"
and DNO in (select D.DNO 
			from DEPT.D
			where D.DIR in (
				select D2.DIR
				from Dept D2 , Emp E2 
				where D2.DNO = E2.DNO
				and ENOM ="JIM"
				)	
			);

--question 20 )

--option 1
select ENOM from EMP
where (DNO,SAL) in (select (DNO ,MAX(SAL)) from EMP
					group by DNO 
					);

--option 2 

select ENOM from EMP E
where SAL >= all(
				select SAL from EMP F
				where F.DNO = E.DNO
				);

--question 21)

select PROF , avg(SAL) from EMP 
Group by PROF ; 

--question 22 ) 

select avg(SAL) from EMP E1
Group by PROF 
HAVING avg(SAL) <= all (
					select avg(SAL) from EMP E2 
					where E1.PROF= E2.PROF
					);

--question 23 )

select PROF , avg(SAL) from EMP 
Group by PROF 
Having avg(SAL) = (select min(avg(SAL)) from EMP 
					Group by PROF 
					);