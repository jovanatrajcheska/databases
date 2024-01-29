create view vraboteni_isplata as
    select * from Vraboten v
    left join Shalterski_rabotnik sr on v.ID = sr.ID
    join Transakcija_shalter ts on v.ID = ts.ID_v
    join Smetka s on ts.MBR_k = s.MBR_k and ts.broj = s.broj
    where ts.tip = 'isplata' and s.valuta = 'EUR' and ts.suma > 1000
    order by v.ime
;

select distinct ime,prezime from vraboteni_isplata