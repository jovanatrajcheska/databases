create view najmnogu_pati as
    select m1.ime from Mesto m
    join Objekt o on m.id = o.id_mesto
    join Poseta p ON m.id = p.id_mesto
    join Mesto m1 on o.id_grad = m1.id
    GROUP BY m1.ime
    ORDER BY COUNT(p.kor_ime) DESC
    LIMIT 1
;
select * from najmnogu_pati
