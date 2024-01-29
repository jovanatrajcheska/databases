create trigger on_insert_bendovi
after insert on Muzicar_bend
for each row
begin
    update Muzicar
    set br_bendovi = br_bendovi + 1
    where id = new.id_muzicar;
end;