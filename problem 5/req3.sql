select distinct b1.ime as B1, b2.ime as B2 from Bend b1
join Bend b2 on b1.godina_osnovanje = b2.godina_osnovanje and b1.id != b2.id
where b2.ime < b1.ime