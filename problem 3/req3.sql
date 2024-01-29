select distinct k.ime, k.prezime
from Korisnik k
join Poseta p1 on k.kor_ime = p1.kor_ime
join Objekt o1 on p1.id_mesto = o1.id_mesto
join Grad g1 on o1.id_grad = g1.id_mesto

join Poseta p2 on k.kor_ime = p2.kor_ime
join Objekt o2 on p2.id_mesto = o2.id_mesto
join Grad g2 on o2.id_grad = g2.id_mesto

join Sosedi s on g1.id_mesto = s.grad1 and g2.id_mesto = s.grad2

where s.rastojanie < 300