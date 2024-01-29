create view lica_nevakcinirani as
    select * from Lice l
    join Test t on l.id = t.id
    join Vakcinacija_datum v on l.id = v.id_lice and t.datum < v.datum
    where t.rezultat = 'pozitiven'
    order by id
;

select distinct id from lica_nevakcinirani