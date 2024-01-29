select distinct m.ime, m.prezime from Muzicar m
join Muzicar_instrument mi on m.id = mi.id_muzicar
join Muzicar_bend mb on m.id = mb.id_muzicar
join Koncert_muzicar_bend kmb on m.id = kmb.id_muzicar
join Koncert k on kmb.id_koncert = k.id
where mi.instrument = 'gitara' and mb.datum_napustanje < k.datum