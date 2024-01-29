create table Test(

    id integer,
    shifra varchar(30),
    tip varchar(50),
    datum varchar(30),
    rezultat varchar(30),
    laboratorija varchar(50),

    primary key(id,shifra),
    foreign key (id) references Lice(id) on delete cascade on update cascade,

    constraint check_lab_and_type check ((tip='seroloshki' and laboratorija='lab-abc') OR laboratorija != 'lab-abc')

);

create table Vakcinacija(
    id_lice integer,
    id_med_lice integer, 
    shifra_vakcina varchar(30),

    primary key (id_lice, id_med_lice, shifra_vakcina),
    foreign key (id_lice) references Lice(id) on delete set default on update cascade,
    foreign key (id_med_lice) references Med_lice(id) on delete set default on update cascade,
    foreign key (shifra_vakcina) references Vakcina(shifra) on delete set default on update cascade,

    constraint check_ids_people check (id_lice != id_med_lice)

);

create table Vakcinacija_datum(
    id_lice integer,
    id_med_lice integer, 
    shifra_vakcina varchar(30),
    datum varchar(30),

    primary key (id_lice, id_med_lice, shifra_vakcina, datum),
    foreign key (id_lice, id_med_lice, shifra_vakcina) references Vakcinacija(id_lice, id_med_lice, shifra_vakcina) on update cascade on delete set null,

    constraint check_ids_people check (id_lice != id_med_lice)

);
