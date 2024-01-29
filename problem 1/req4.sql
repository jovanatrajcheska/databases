create trigger trigger_on_insert
after insert on Transakcija_shalter
for each row
begin
    update Klient
    set brSmetkiTransakcii = (select  count(DISTINCT ts.broj) from Transakcija_shalter ts where ts.MBR_k = new.MBR_k)
    where MBR_k = new.MBR_k;
end;


create trigger trigger_on_update
after update on Transakcija_shalter
for each row
begin
    update Klient
    set brSmetkiTransakcii = (
        select count(DISTINCT ts.broj)
        from Transakcija_shalter ts
        where new.MBR_k = ts.MBR_k
    )
    where MBR_k = new.MBR_k;
    --- 
    update Klient
    set brSmetkiTransakcii = (
        select count(DISTINCT ts.broj)
        from Transakcija_shalter ts
        where old.MBR_k = ts.MBR_k
    )
    where MBR_k = old.MBR_k;
end;