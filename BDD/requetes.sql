select count(*) as compte from facture
  where (HOUR(DATE_E) = 07) or (HOUR(DATE_S) =07)

select sum(distance)/count(*) as dist from facture
  where (HOUR(DATE_E) = 07) or (HOUR(DATE_S) =07)

create view traffic as select HOUR(DATE_E) as date, count(*) as compte from facture
group by HOUR(DATE_E);

create view traffic1 as select HOUR(DATE_E),HOUR(DATE_S) as datee, count(*) as compte from facture
where HOUR(DATE_E)=HOUR(DATE_S)
group by HOUR(DATE_E),HOUR(DATE_S);

create view traffic2 as select HOUR(DATE_E),HOUR(DATE_S) as datee, count(*) as compte from facture
where HOUR(DATE_E)!=HOUR(DATE_S)
group by HOUR(DATE_E),HOUR(DATE_S);

SELECT datee , compte
FROM traffic1
UNION SELECT
FROM traffic2
