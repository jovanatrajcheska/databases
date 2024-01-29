select v.ID as vraboten, ts.datum as datum, count(ts.ID) as broj_transakcii from Vraboten v
left join Shalterski_rabotnik sr on v.ID = sr.ID
join Transakcija_shalter ts on v.ID = ts.ID_v
group by v.ID, ts.datum
having count(ts.ID) = (
    select max(broj_transakcii) from (select v.ID, ts.datum as datum, count(ts.ID) as broj_transakcii from Vraboten v
    left join Shalterski_rabotnik sr on v.ID = sr.ID
    join Transakcija_shalter ts on v.ID = ts.ID_v
    group by v.ID, ts.datum) as subq
    where subq.ID = v.ID
)