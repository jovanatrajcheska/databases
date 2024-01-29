create table Bend (
    id integer,
    ime varchar(50),
    godina_osnovanje integer,
    primary key (id),
    constraint check_year check (godina_osnovanje >= 1970)
);

create table Bend_zanr (
    id_bend integer,
    zanr varchar(50),
    primary key (id_bend, zanr),
    FOREIGN key (id_bend) REFERENCES Bend(id) on delete cascade on update cascade
);

create table Festival_bend (
    id_festival integer,
    datum_od varchar(20),
    id_bend integer,
    primary key (id_festival, datum_od, id_bend),
    FOREIGN key (id_bend) REFERENCES Bend(id) on delete SET DEFAULT on update cascade,
    FOREIGN key (id_festival, datum_od) REFERENCES Festival_odrzuvanje(id, datum_od) on delete cascade on update cascade,
    
    constraint check_ids check ((id_bend=5 and id_festival!=2) or id_festival!=2)
 
);