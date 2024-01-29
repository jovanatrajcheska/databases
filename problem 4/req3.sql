select distinct k.ime, k.prezime from Korisnik k
join Premium_korisnik pk on k.k_ime = pk.k_ime
left join Preporaka p on k.k_ime = p.k_ime_od
left join Video_zapis v on p.naslov = v.naslov
where v.vremetraenje > 120 and p.ocena >= 4
order by k.datum_reg