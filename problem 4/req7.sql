create view prosecna_ocena as
    select p.naslov, avg(p.ocena) as ocena from Preporaka p
    group by p.naslov
;


select prof.ime, avg(prosecna_ocena.ocena) as po_profil from Profil prof
join Lista_zelbi lz on prof.ime = lz.ime
join prosecna_ocena on lz.naslov = prosecna_ocena.naslov
group by prof.ime