create view najmnogu_pati as
    select g.id_mesto from Grad g
    join Poseta p on p.id_mesto = g.id_mesto
    group by g.id_mesto
    order by count(*) desc
    limit 1
;

select m.ime from Objekt o
join Mesto m on o.id_mesto = m.id
where o.id_grad in najmnogu_pati
order by 1 desc