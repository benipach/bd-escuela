USE bd_etn;

/* Vista de los alumnos de 1er y 2do año con el promedio de sus notas, para estudios posteriores debido a la NO repitencia en estos años, verificando el rendimiento de los alumnos por la misma razon */

create view promedio_alumnos as select a.DNI, a.Nombre, a.Apellido, AVG(cal.Nota) as promedio from Alumnos a inner join Calificaciones cal on a.DNI=cal.DNI_A where a.Anio_Division in (1, 2)  group by cal.DNI_A;

select * from promedio_alumnos;

-- +----------+-----------+------------+----------+
-- | DNI      | Nombre    | Apellido   | promedio |
-- +----------+-----------+------------+----------+
-- | 28000001 | Sofía    | García     |   7.1667 |
-- | 28000002 | Mateo     | Fernández  |   7.3333 |
-- | 28000003 | Valentina | López      |   7.1667 |
-- | 28000004 | Benjamín | Martínez   |   7.2500 |
-- | 28000005 | Emma      | Gómez      |   7.1667 |
-- | 28000006 | Thiago    | Díaz       |   7.3333 |
-- | 28000007 | Isabella  | Silva      |   7.1667 |
-- | 28000008 | Lucas     | Torres     |   7.2500 |
-- | 28000009 | Camila    | Rojas      |   7.1667 |
-- | 28000010 | Matías   | Morales    |   7.3333 |
-- | 28000011 | Luna      | Castro     |   7.1667 |
-- | 28000012 | Santiago  | Pérez     |   7.2500 |
-- | 28000021 | Emma      | Alvarez    |   7.1667 |
-- | 28000022 | Juan      | Vargas     |   7.3333 |
-- | 28000023 | Agustina  | Cabrera    |   7.1667 |
-- | 28000024 | Tomás    | Campos     |   7.2500 |
-- | 28000025 | Sofía    | Ibarra     |   7.1667 |
-- | 28000026 | Lucas     | Pineda     |   7.3333 |
-- | 28000027 | Valeria   | Fuentes    |   7.1667 |
-- | 28000028 | Diego     | Valdez     |   7.2500 |
-- | 28000029 | María    | Miranda    |   7.1667 |
-- | 28000030 | Bruno     | Luna       |   7.3333 |
-- | 28000031 | Isabel    | Mendoza    |   7.1667 |
-- | 28000032 | Martín   | Ramos      |   7.2500 |
-- | 28000041 | Catalina  | Moreno     |   7.1667 |
-- | 28000042 | Juan      | Bravo      |   7.3333 |
-- | 28000043 | Florencia | Salinas    |   7.1667 |
-- | 28000044 | Santiago  | Mora       |   7.2500 |
-- | 28000045 | Agustina  | Santana    |   7.1667 |
-- | 28000046 | Lucas     | Ibáñez   |   7.3333 |
-- | 28000047 | María    | Camacho    |   7.1667 |
-- | 28000048 | Tomás    | Estrada    |   7.2500 |
-- | 28000049 | Isabella  | Valle      |   7.1667 |
-- | 28000050 | Matías   | Rey        |   7.3333 |
-- | 28000051 | Mía      | Crespo     |   7.1667 |
-- | 28000052 | Bruno     | Flores     |   7.2500 |
-- | 28000061 | Isabella  | Romero     |   7.1667 |
-- | 28000062 | Mateo     | Santos     |   7.3333 |
-- | 28000063 | Sofía    | Rojas      |   7.1667 |
-- | 28000064 | Benjamín | Ortiz      |   7.2500 |
-- | 28000065 | Emma      | Castillo   |   7.1667 |
-- | 28000066 | Thiago    | Herrera    |   7.3333 |
-- | 28000067 | Camila    | Morales    |   7.1667 |
-- | 28000068 | Matías   | Molina     |   7.2500 |
-- | 28000069 | Luna      | Fuentes    |   7.1667 |
-- | 28000070 | Santiago  | Miranda    |   7.3333 |
-- | 28000071 | Mía      | Salazar    |   7.1667 |
-- | 28000072 | Agustín  | Reyes      |   7.2500 |
-- | 28000081 | Isabel    | Paz        |   7.1667 |
-- | 28000082 | Bruno     | Núñez    |   7.3333 |
-- | 28000083 | Lucía    | Salinas    |   7.1667 |
-- | 28000084 | Facundo   | Santana    |   7.2500 |
-- | 28000085 | Micaela   | Ibáñez   |   7.1667 |
-- | 28000086 | Julián   | Camacho    |   7.3333 |
-- | 28000087 | Emilia    | Estrada    |   7.1667 |
-- | 28000088 | Matías   | Valle      |   7.2500 |
-- | 28000089 | Lucía    | Rey        |   7.1667 |
-- | 28000090 | Gabriel   | Crespo     |   7.3333 |
-- | 28000091 | Catalina  | Flores     |   7.1667 |
-- | 28000092 | Martín   | Ortiz      |   7.2500 |
-- | 28000101 | Luna      | Ortiz      |   7.1667 |
-- | 28000102 | Santiago  | Castillo   |   7.3333 |
-- | 28000103 | Mía      | Herrera    |   7.1667 |
-- | 28000104 | Agustín  | Morales    |   7.2500 |
-- | 28000105 | Emma      | Molina     |   7.1667 |
-- | 28000106 | Martín   | Fuentes    |   7.3333 |
-- | 28000107 | Catalina  | Valdez     |   7.1667 |
-- | 28000108 | Diego     | Miranda    |   7.2500 |
-- | 28000109 | Julia     | Luna       |   7.1667 |
-- | 28000110 | Julián   | Mendoza    |   7.3333 |
-- | 28000111 | Emma      | Ramos      |   7.1667 |
-- | 28000112 | Lucas     | Paz        |   7.2500 |
-- | 29000001 | Ana       | Vargas     |   7.1667 |
-- | 29000002 | Martín   | Salinas    |   7.3333 |
-- | 29000003 | Carla     | Mendoza    |   7.1667 |
-- | 29000004 | Lucas     | Cabrera    |   7.2500 |
-- | 29000005 | Laura     | Campos     |   7.1667 |
-- | 29000006 | Sergio    | Fernández |   7.3333 |
-- | 29000007 | Mariana   | Pineda     |   7.1667 |
-- | 29000008 | Diego     | Herrera    |   7.2500 |
-- | 29000009 | Verónica | Reyes      |   7.1667 |
-- | 29000010 | Facundo   | Ortiz      |   7.3333 |
-- | 29000011 | Gabriela  | Castro     |   7.1667 |
-- | 29000012 | Pablo     | Paz        |   7.2500 |
-- | 29000021 | Agustina  | Pacheco    |   7.1667 |
-- | 29000022 | Martín   | Bravo      |   7.3333 |
-- | 29000023 | Julieta   | Vargas     |   7.1667 |
-- | 29000024 | Leandro   | Miranda    |   7.2500 |
-- | 29000025 | Valentina | Luna       |   7.1667 |
-- | 29000026 | Santiago  | Campos     |   7.3333 |
-- | 29000027 | Camila    | Castillo   |   7.1667 |
-- | 29000028 | Bruno     | Romero     |   7.2500 |
-- | 29000029 | Florencia | Mora       |   7.1667 |
-- | 29000030 | Lucas     | Salinas    |   7.3333 |
-- | 29000031 | Emilia    | Ibarra     |   7.1667 |
-- | 29000032 | Tomás    | Reyes      |   7.2500 |
-- | 29000041 | Carla     | Domínguez |   7.1667 |
-- | 29000042 | Pablo     | Herrera    |   7.3333 |
-- | 29000043 | Lucía    | Morales    |   7.1667 |
-- | 29000044 | Matías   | Molina     |   7.2500 |
-- | 29000045 | Emilia    | Fuentes    |   7.1667 |
-- | 29000046 | Ramiro    | Valdez     |   7.3333 |
-- | 29000047 | Paula     | Miranda    |   7.1667 |
-- | 29000048 | Diego     | Luna       |   7.2500 |
-- | 29000049 | María    | Vega       |   7.1667 |
-- | 29000050 | Javier    | Salinas    |   7.3333 |
-- | 29000051 | Florencia | Ramos      |   7.1667 |
-- | 29000052 | Sergio    | Ortiz      |   7.2500 |
-- | 29000061 | Gabriela  | Flores     |   7.1667 |
-- | 29000062 | Ramiro    | Ortiz      |   7.3333 |
-- | 29000063 | Natalia   | Sosa       |   7.1667 |
-- | 29000064 | Javier    | León      |   7.2500 |
-- | 29000065 | Lucía    | Rivas      |   7.1667 |
-- | 29000066 | Tomás    | Campos     |   7.3333 |
-- | 29000067 | María    | Navarro    |   7.1667 |
-- | 29000068 | Diego     | Romero     |   7.2500 |
-- | 29000069 | Paula     | Santos     |   7.1667 |
-- | 29000070 | Lucas     | Rojas      |   7.3333 |
-- | 29000071 | Emilio    | Ortiz      |   7.1667 |
-- | 29000072 | Florencia | Castillo   |   7.2500 |
-- | 29000081 | Sergio    | Cabrera    |   7.1667 |
-- | 29000082 | Natalia   | Campos     |   7.3333 |
-- | 29000083 | Pablo     | Suárez    |   7.1667 |
-- | 29000084 | Camila    | Ramos      |   7.2500 |
-- | 29000085 | Bruno     | Ortiz      |   7.1667 |
-- | 29000086 | Isabel    | Castillo   |   7.3333 |
-- | 29000087 | Lucas     | Herrera    |   7.1667 |
-- | 29000088 | Emilia    | Morales    |   7.2500 |
-- | 29000089 | Martín   | Molina     |   7.1667 |
-- | 29000090 | Sofía    | Fuentes    |   7.3333 |
-- | 29000091 | Diego     | Valdez     |   7.1667 |
-- | 29000092 | Lucía    | Miranda    |   7.2500 |
-- | 29000101 | Matías   | Salazar    |   7.1667 |
-- | 29000102 | Florencia | Ramos      |   7.3333 |
-- | 29000103 | Emilio    | Ortiz      |   7.1667 |
-- | 29000104 | Paula     | Castillo   |   7.2500 |
-- | 29000105 | Lucas     | Romero     |   7.1667 |
-- | 29000106 | Isabel    | Mora       |   7.3333 |
-- | 29000107 | Javier    | Salinas    |   7.1667 |
-- | 29000108 | Micaela   | Ibarra     |   7.2500 |
-- | 29000109 | Ramiro    | Reyes      |   7.1667 |
-- | 29000110 | Natalia   | Pacheco    |   7.3333 |
-- | 29000111 | Bruno     | Vargas     |   7.1667 |
-- | 29000112 | Sofía    | Salinas    |   7.2500 |
-- +----------+-----------+------------+----------+



/* Vista para ver a los directivos del colegio, con algunos de sus datos relevantes, su cargo, y la cantidad de personas que tienen a cargo para posibles dudas de los usuarios. */

/*poner el cargo*/

create view personas_a_cargo as select d.DNI,d.Nombre,d.Apellido,count(p.DNI) as cantidad_personas_a_cargo from Directivos d left join (select DNI_DIR,DNI from Docentes union all select DNI_DIR,DNI from Preceptores) p on d.DNI=p.DNI_DIR group by d.DNI,d.Nombre,d.Apellido;

select * from personas_a_cargo;

-- +----------+----------+------------+---------------------------+
-- | DNI      | Nombre   | Apellido   | cantidad_personas_a_cargo |
-- +----------+----------+------------+---------------------------+
-- | 38491273 | María   | González  |                         4 |
-- | 47283910 | Carlos   | Pérez     |                         3 |
-- | 53918274 | Laura    | Martínez  |                         3 |
-- | 61729384 | Gustavo  | Fernández |                         2 |
-- | 61827345 | Jorge    | Suárez    |                         3 |
-- | 73829104 | Lucía   | Díaz      |                        10 |
-- | 74829103 | Silvia   | Ramírez   |                         3 |
-- | 80938475 | Marcela  | Vega       |                         5 |
-- | 82937465 | Andrés  | López     |                         4 |
-- | 90238476 | Patricia | Torres     |                         3 |
-- +----------+----------+------------+---------------------------+
