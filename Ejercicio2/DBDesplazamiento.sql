create database desplazamiento_comunidad
go
use desplazamiento_comunidad
go
create table pais (
CodigoPais nchar(2) primary key,
NombrePais varchar(50) not null
) 
create table departamentos(
CodigoDepartamento nchar(5) primary key,
CodigoPais nchar(2),
NombreDepartamento varchar(50) not null 
)
create table tiempo(
CodigoTiempo int identity(1,1) primary key,
Fecha date,
dia int, 
mes int
) 
create table datos_desplazamiento(
CodigoDepartamento nchar(5) not null,
CodigoTiempo int identity(1,1),
MovParque float not null,
MovTSF float not null,
MovCR float not null,
MovTransito float not null,
MovTrabajo float not null,
MovResidencia float not null
)

--llaves foraneas 
alter table datos_desplazamiento
add constraint fk_departamento foreign key(CodigoDepartamento)
 references departamentos(CodigoDepartamento)

 alter table datos_desplazamiento
add constraint fk_tiempo foreign key(CodigoTiempo)
 references tiempo(CodigoTiempo)

 alter table departamentos
add constraint fk_departamento_pais foreign key(CodigoPais)
 references pais(CodigoPais)


select * from datos_desplazamiento

use master
drop database desplazamiento_comunidad

select * from pedido 