

create or replace view dist_TP as
SELECT t.ID_TP as ID_TP, t.DATE_E,t.DATE_S, e.NOM as nom_e, s.NOM as nom_s, sum( d.DIST_TRON ) as distance,t.NB_BADGE as nb_badge
FROM ticket_tp t
JOIN es e ON ( e.ID_ES = t.ID_ETP )
JOIN es s ON ( s.ID_ES = t.ID_STP )
JOIN es d ON ( (d.ID_ES >= t.ID_ETP AND d.ID_ES < t.ID_STP) OR (d.ID_ES >= s.ID_ES AND t.ID_STP < t.ID_ETP ) )
GROUP BY t.ID_TP;


create or replace view prix_TP as
SELECT t.ID_TP as ID_TP,t.DATE_E, t.DATE_S, e.NOM as nom_e, s.NOM as nom_s, round(sum( tr.prix ),2) as prix,t.NB_BADGE as nb_badge
FROM ticket_tp t
JOIN es e ON ( e.ID_ES = t.ID_ETP )
JOIN es s ON ( s.ID_ES = t.ID_STP )
JOIN tronc tr ON ( tr.id_veh= t.id_veh and ( (tr.ID_ES >= t.ID_ETP AND tr.ID_ES < t.ID_STP) OR (tr.ID_ES >= s.ID_ES AND tr.ID_ES < t.ID_ETP) ) )
GROUP BY t.ID_TP;


create or replace view facture_TP as
select t1.ID_TP,t1.DATE_E,t1.DATE_S, t1.nom_e, t1.nom_s, t1.distance DISTANCE, t2.prix as PRIX,t1.nb_badge as NB_BADGE
from dist_TP t1
join prix_TP t2 on t1.ID_TP = t2.ID_TP;



create or replace view dist_NA as
SELECT t.ID_NA as ID_NA, t.DATE_E as DATE_E,t.DATE_S as DATE_S, e.NOM as NOM_E, s.NOM as NOM_S, sum( d.DIST_TRON ) as DISTANCE,t.ID_PAY as ID_PAY
FROM ticket_na t
JOIN es e ON ( e.ID_ES = t.ID_ENA )
JOIN es s ON ( s.ID_ES = t.ID_SNA )
JOIN es d ON ( (d.ID_ES >= t.ID_ENA AND d.ID_ES < t.ID_SNA) OR (d.ID_ES >= s.ID_ES AND t.ID_SNA < t.ID_ENA ) )
GROUP BY t.ID_NA;


create or replace view prix_NA as
SELECT t.ID_NA as ID_NA,t.DATE_E as DATE_E, t.DATE_S as DATE_S, e.NOM as NOM_E, s.NOM as NOM_S, round(sum( tr.prix ),2) as PRIX,t.ID_PAY as ID_PAY
FROM ticket_na t
JOIN es e ON ( e.ID_ES = t.ID_ENA )
JOIN es s ON ( s.ID_ES = t.ID_SNA )
JOIN tronc tr ON ( tr.id_veh= t.id_veh and ( (tr.ID_ES >= t.ID_ENA AND tr.ID_ES < t.ID_SNA) OR (tr.ID_ES >= s.ID_ES AND tr.ID_ES < t.ID_ENA) ) )
GROUP BY t.ID_NA;

create or replace view facture_NA as
select t1.ID_NA ID_NA, t1.DATE_E DATE_E, t1.DATE_S DATE_S, t1.NOM_E NOM_E, t1.NOM_S NOM_S, t1.DISTANCE DISTANCE, t2.PRIX as PRIX, t1.ID_PAY as ID_PAY
from dist_NA t1
join prix_NA t2 on t1.ID_NA = t2.ID_NA;



create or replace view trajet_NA as
SELECT f.DATE_E DATE_E, f.DATE_S DATE_S, f.NOM_E NOM_E, f.NOM_S NOM_S, f.DISTANCE DISTANCE, f.PRIX PRIX, p.NOM PAY
FROM facture_NA f
JOIN type_pay p ON ( f.ID_PAY = p.ID_PAY );



create or replace view trajet_TP as
SELECT f.DATE_E DATE_E, f.DATE_S DATE_S, f.NOM_E NOM_E, f.NOM_S NOM_S, f.DISTANCE DISTANCE, f.PRIX PRIX, 'Télépéage' PAY
FROM facture_TP f;

create or replace view facture as
SELECT DATE_E, DATE_S, NOM_E NOM_E,NOM_S, DISTANCE, PRIX
from facture_NA
UNION
SELECT DATE_E, DATE_S, NOM_E NOM_E,NOM_S, DISTANCE, PRIX
from facture_TP;

create or replace view trajet as
SELECT * from trajet_NA
UNION
SELECT * from trajet_TP;



create or replace view traffic_mois_heur as select MONTH(DATE_E) as MONTH_VAL, HOUR(DATE_E) as HOUR_VAL, count(*) as compte from facture
group by HOUR_VAL;


create or replace view traffic_heur_aut as select HOUR(DATE_E) as HOUR_VAL, count(*) as compte from facture
group by HOUR(DATE_E);


create or replace view traffic_heur as select HOUR_VAL, sum(compte) as compte from traffic_mois_heur
group by HOUR_VAL;


create or replace view traffic_mois as select  MONTH_VAL,  sum(compte) as compte from traffic_mois_heur
group by MONTH_VAL;

