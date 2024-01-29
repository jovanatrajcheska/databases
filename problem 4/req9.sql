create trigger add_recommendation
after insert on Preporaka
for each row
begin
    UPDATE Video_zapis
    set prosechna_ocena = (SELECT avg(ocena) FROM Preporaka where naslov = new.naslov)
    where naslov = new.naslov;
end;

create trigger update_recommendation
after update on Preporaka
for each row 
begin
    update Video_zapis
    set prosechna_ocena = (SELECT avg(ocena) FROM Preporaka where naslov = new.naslov)
    where naslov = new.naslov;
end;