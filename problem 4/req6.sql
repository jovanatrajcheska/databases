select k.k_ime, p.naslov, count(p.ID) as broj from Korisnik k
join Preporaka p on k.k_ime = p.k_ime_od
group by k.k_ime, p.naslov
having count(p.ID) = (
    select max(broj) from (
        select distinct k.k_ime, p.naslov, count(p.ID) as broj from Korisnik k
        join Preporaka p on k.k_ime = p.k_ime_od
        group by k.k_ime, p.naslov
        order by k.k_ime
    )
    as subq
    where subq.k_ime = k.k_ime
)