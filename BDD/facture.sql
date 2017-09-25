set @nb_abonne = 1;

create or replace view tempp1 as
SELECT t.ID_TP as ID_TP, t.DATE_E,t.DATE_S, e.NOM as nom_e, s.NOM as nom_s, sum( d.DIST_TRON ) as distance,t.NB_BADGE as nb_badge
FROM ticket_tp t
JOIN es e ON ( e.ID_ES = t.ID_ETP )
JOIN es s ON ( s.ID_ES = t.ID_STP )
JOIN es d ON ( (d.ID_ES >= t.ID_ETP AND d.ID_ES < t.ID_STP) OR (d.ID_ES >= s.ID_ES AND t.ID_STP < t.ID_ETP ) )
GROUP BY t.ID_TP;


CREATE or replace view tempp2 as
SELECT t.ID_TP as ID_TP,t.DATE_E, t.DATE_S, e.NOM as nom_e, s.NOM as nom_s, round(sum( tr.prix ),2) as prix,t.NB_BADGE as nb_badge
FROM ticket_tp t
JOIN es e ON ( e.ID_ES = t.ID_ETP )
JOIN es s ON ( s.ID_ES = t.ID_STP )
JOIN tronc tr ON ( tr.id_veh= t.id_veh and ( (tr.ID_ES >= t.ID_ETP AND tr.ID_ES < t.ID_STP) OR (tr.ID_ES >= s.ID_ES AND tr.ID_ES < t.ID_ETP) ) )
GROUP BY t.ID_TP;

create or replace view facture as
select t1.DATE_E,t1.DATE_S, t1.nom_e, t1.nom_s, t1.distance distance, t2.prix as prix,t1.nb_badge as nb_badge
from tempp1 t1
join tempp2 t2 on t1.ID_TP = t2.ID_TP;

select * from facture where nb_badge=1;

select sum(prix), sum(distance) from facture where nb_badge=1;
