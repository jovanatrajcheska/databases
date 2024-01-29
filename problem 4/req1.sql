create table Video_zapis(

    naslov text,
    jazik varchar(100),
    vremetraenje integer,
    datum_d varchar(30),
    datum_p varchar(30),

    primary key (naslov)

);

create table Video_zapis_zanr(
    
    naslov text,
    zanr varchar(100),

    primary key (naslov, zanr),
    foreign key (naslov) references Video_zapis(naslov) on delete cascade on update cascade

);

create table Preporaka(

    ID integer, 
    k_ime_od text,
    k_ime_na text,
    naslov text, 
    datum varchar(30),
    komentar text,
    ocena integer,

    primary key (ID),
    foreign key (k_ime_od) references Korisnik(k_ime) on delete set null on update cascade,
    foreign key (k_ime_na) references Korisnik(k_ime) on delete cascade on update cascade,
    foreign key (naslov) references Video_zapis(naslov) on delete cascade on update cascade,

    constraint check_usernames check (k_ime_na != k_ime_od),
    constraint check_date check(datum < CURRENT_DATE)

);

