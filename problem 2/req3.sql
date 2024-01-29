create view pozitiven_test_avgust as
    select * from Lice l
    left join Test t on l.id = t.id
    left join Vakcinacija v on l.id = v.id_lice
    left join Vakcinacija_datum vd on v.id_lice = vd.id_lice 
    where t.datum > '2021-07-31' and t.datum < '2021-09-01' and t.rezultat = 'pozitiven'
    group by l.id
;


create view vkupno as
    select *, count(*) as brojac from Lice l
    join Test t on l.id = t.id
    left join Vakcinacija_datum vd on l.id = vd.id_lice 
    where t.datum > '2021-07-31' and t.datum < '2021-09-01' and t.rezultat = 'pozitiven'
    group by l.id
;


select (count (distinct case when brojac < 2 then id end) * 100.0 / count(*)) as procent from vkupno
