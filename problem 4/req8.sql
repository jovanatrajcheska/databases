create trigger recommendations
after insert on Preporaka
for each row
begin
    update Korisnik
    set broj_preporaki = broj_preporaki + 1
    where k_ime = new.k_ime_od or k_ime = new.k_ime_na;
end;