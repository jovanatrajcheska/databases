create table Korisnik(

    k_ime text,
    ime text,
    prezime text,
    tip text,
    pretplata text,
    datum_reg varchar(30),
    tel_broj text,
    email varchar(100), 

    primary key (k_ime),

    constraint check_date check ((datum_reg < '2015-01-01' and pretplata is not'pretplata 3') or datum_reg >= '2015-01-01')

);


create table Premium_korisnik(

    k_ime text,
    datum varchar(30),
    procent_popust integer default 10,

    primary key (k_ime),
    foreign key (k_ime) references Korisnik(k_ime) on delete cascade on update cascade,

    constraint check_percentage check (procent_popust is not null or procent_popust=10)
    
);

create table Lista_zelbi(

    ID integer,
    naslov text,
    k_ime text,
    ime text,

    primary key (ID),
    foreign key (naslov) references Video_zapis(naslov) on delete set null on update cascade,
    foreign key (k_ime, ime) references Profil(k_ime,ime) on delete cascade on update cascade

);