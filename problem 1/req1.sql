create table Vraboten(

    ID integer,
    ime varchar(50),
    prezime varchar(50),
    datum_r varchar(30),
    datum_v varchar(30),
    obrazovanie varchar(50),
    plata integer,

    primary key (ID),

    constraint check_dates check (datum_r < datum_v)

);
create table Shalterski_rabotnik(

    ID integer,

    primary key (ID),
    foreign key (ID) references Vraboten(ID) on delete cascade on update cascade

);
create table Transakcija_shalter(

    ID integer,
    ID_v integer,
    MBR_k text,
    MBR_k_s text,
    broj integer,
    datum varchar(30),
    suma integer,
    tip varchar(20),

    primary key (ID),
    foreign key (MBR_k) references Klient(MBR_k) on delete cascade on update cascade,
    foreign key (MBR_k_s, broj) references Smetka(MBR_k_s, broj) on delete cascade on update cascade,
    foreign key (ID_v) references Shalterski_rabotnik(ID) on delete set null on update cascade,
    
    constraint check_date check (datum not between '2020-12-30' and '2021-01-14'),
    constraint check_type check (tip in ('uplata','isplata'))

);

