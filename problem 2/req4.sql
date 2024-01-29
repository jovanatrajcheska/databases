create trigger imunizacija
after insert on Vakcinacija_datum
for each row
begin
    update Lice
    set celosno_imuniziran = (
        select
            case when COUNT(distinct datum) >= 2 then 1 else 0 end
        from Vakcinacija_datum
        where id_lice = NEW.id_lice
    )
    where id = NEW.id_lice;  
end;
