
-- create list appartments with meter readings							
create table appartments ( appartm integer, owner_id integer, area_apprtmnt decimal, previus_water decimal, previus_electricity decimal, previus_date date,  
update_water decimal, update_electricity decimal, arears decimal,
				CONSTRAINT appartm PRIMARY KEY (appartm),
				CONSTRAINT water_check CHECK (update_water > previus_water),
				CONSTRAINT electricity_check CHECK (update_electricity > previus_electricity));
			
			
insert into appartments values ( 21,null,75, 1000, 2000, '2010-10-07',1005, 2200, 50), 
								( 22,null ,77,1010, 2020,'2010-10-08',1015, 2225,51),
								( 23,null ,78,1030, 2030,'2010-10-09', 1035, 2330,52);

--select  * from public.appartments 


--create members of family									

create table residents ( appartm  integer,  lastname text, name_ text,surname text, telephone text, birthday date, owner_ boolean, tenant boolean);
                
									
insert into residents  values ( 21, 'Кучма', 'Леонід', 'Іліч', '050123456', '1950-01-01', true, false), 
									 (21, 'Кучма', 'Ольга','Юріївна','050234257', '1955-07-02', false,false),
									 (22, 'Ющенко', 'Петро', 'Андрійович','050123346', '1964-01-01', true, false),
									 (22, 'Ющенко', 'Орися','Захарівна','050124456', '1969-01-01', false, false),
									 (22, 'Ющенко', 'Оксана', 'Петрівна','050173456', '1995-01-01', false, false),
									 (22, 'Тимошенко', 'Дарина', 'Володимірівна','050123496', '1967-01-01', false, true),
									 (23, 'Фаріон', 'Іван', 'Іванович','050128846', '1963-12-01', true, false),
									 (23, 'Фаріон', 'Єлизавета', 'Юхимівна','050214456', '1965-12-13', false, false),
									 (23, 'Фаріон', 'Олеся', 'Миколаївна','050343456', '1989-04-01', false, false);

--select  * from public.residents



 