select k.k_ime, p.naslov from Korisnik k 
join Premium_korisnik pk on k.k_ime = pk.k_ime
join Profil prof on k.k_ime = prof.k_ime
join Lista_zelbi l on prof.ime = l.ime
join Preporaka p on k.k_ime = p.k_ime_na and l.naslov = p.naslov
where p.datum > '2020-12-31' and p.datum < '2022-01-01' and p.ocena > 3
order by k.k_ime