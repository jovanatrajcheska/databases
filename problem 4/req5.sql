with preporaki as (
    select k_ime_od, count(k_ime_od) as kor_brojac
    from Preporaka
    group by k_ime_od
),

korisnik_najmnogu as (
    select max(kor_brojac) as maximum
    from preporaki
)

select k_ime, count(k_ime) as dobieni_preporaki
from korisnik_najmnogu kn join preporaki p on p.kor_brojac = kn.maximum
join Korisnik k on p.k_ime_od = k.k_ime
join Preporaka pr on pr.k_ime_na = k.k_ime
group by k_ime