create view broj_bendovi as
    select id_festival, count(distinct id_bend) as kolku from Festival_bend
    group by id_festival
;

create view broj_odrzuvanja as
    select datum_od, count(*)
    from Festival_odrzuvanje
    group by datum_od
;

select f.ime, n.cena, n.kapacitet, count(b1.datum_od) as broj_odrzuvanja, b2.kolku as broj_bendovi from Festival f 
join Nastan n on f.id = n.id
join Festival_odrzuvanje fo on fo.id = f.id
join broj_odrzuvanja b1 on fo.datum_od = b1.datum_od
join broj_bendovi b2 on f.id = b2.id_festival
group by f.ime
order by n.kapacitet desc       