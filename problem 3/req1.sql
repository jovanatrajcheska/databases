create table Korisnik(

    kor_ime varchar(100),
    ime varchar(50),
    prezime varchar(50),
    pol varchar(10),
    data_rag varchar(30),
    data_reg varchar (30),

    primary key (kor_ime)

    constraint check_dates check (data_rag < data_reg)

);

create table Korisnik_email(

    kor_ime text,
    email varchar(100),
    
    primary key (kor_ime, email),
    foreign key (kor_ime) references Korisnik(kor_ime) on delete cascade on update cascade,
    
    constraint check_email_validation check (length(email) >= 10 and email like '%.com')

);

create table Poseta(

    id text, 
    kor_ime text,
    id_mesto text,
    datum varchar(30),

    primary key(id),
    foreign key (kor_ime) references Korisnik(kor_ime) on delete set null on update cascade,
    foreign key (id_mesto) references Mesto(id) on delete cascade on update cascade,

    constraint check_date check (datum < Date())

);