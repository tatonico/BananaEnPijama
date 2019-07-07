%%Base de conocimiento


%Por las dudas la enie
anio(2019).

%candidato(nombre, partido)
candidato(frank, rojo).
candidato(claire, rojo).
candidato(catherine, rojo).
candidato(linda, azul).
candidato(garrett, azul).
candidato(jackie, amarillo).
candidato(seth, amarillo).
candidato(heather, amarillo).

edad(frank,50).
edad(claire,52).
edad(catherine,59).
edad(linda,30).
edad(garrett,64).
edad(jackie,38).
edad(heather,50).



edad(Nombre,Edad):-
	nacimiento(Nombre,Nacimiento),
	anio(AnioActual),
	Edad is AnioActual-Nacimiento.

nacimiento(heather,1969).


%de seth no se sabe la edad lo busqué por google Linda = azul (bs as, chaco, tierra, sanluis,neuquen) Frank = rojo (bs as, stfe, cordoba, chbt, tierra, sanluis)
sePostulaEn(rojo, buenosAires).
sePostulaEn(rojo, santaFe).
sePostulaEn(rojo, cordoba).
sePostulaEn(rojo, chubut).
sePostulaEn(rojo, tierraDelFuego).
sePostulaEn(rojo, sanLuis).
% sePostulaEn(rojo, formosa).
sePostulaEn(azul, buenosAires).
sePostulaEn(azul, chaco).
sePostulaEn(azul, tierraDelFuego).
sePostulaEn(azul, sanLuis).
sePostulaEn(azul, neuquen).
sePostulaEn(amarillo, chaco).
sePostulaEn(amarillo, formosa).
sePostulaEn(amarillo, tucuman).
sePostulaEn(amarillo, salta).
sePostulaEn(amarillo, santaCruz).
sePostulaEn(amarillo, laPampa).
sePostulaEn(amarillo, corrientes).
sePostulaEn(amarillo, misiones).
sePostulaEn(amarillo, buenosAires).

cantidadHabitantes(buenosAires, 15355000).
cantidadHabitantes(chaco, 1143201).
cantidadHabitantes(tierraDelFuego, 160720).
cantidadHabitantes(sanLuis, 489255).
cantidadHabitantes(neuquen, 637913).
cantidadHabitantes(santaFe, 3397532).
cantidadHabitantes(cordoba, 3567654).
cantidadHabitantes(chubut, 577466).
cantidadHabitantes(formosa, 527895).
cantidadHabitantes(tucuman, 1687305).
cantidadHabitantes(salta, 1333365).
cantidadHabitantes(santaCruz, 273964).
cantidadHabitantes(laPampa, 349299).
cantidadHabitantes(corrientes,992595).
cantidadHabitantes(misiones, 1189446).

% intencionDeVotoEn(Provincia, Partido, Porcentaje)
intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).


%%punto 2
esPicante(Provincia) :-
    cantidadHabitantes(Provincia, Cantidad),
    Cantidad > 1000000,
    sePostulaEn(Partido, Provincia),
    sePostulaEn(OtroPartido, Provincia),
    Partido \= OtroPartido.

%%punto 3 suponiendo que se quiere saber si primer candidato gana

leGanaA(Candidato, OtroCandidato, Provincia) :-
    sonDelMismoPartido(Candidato, OtroCandidato, Partido),
    sePostulaEn(Partido, Provincia).

leGanaA(Candidato, OtroCandidato, Provincia) :-
    sePresentaEnLaProvincia(Candidato, Provincia),
    not(sePresentaEnLaProvincia(OtroCandidato, Provincia)).
    %not(sePostulanEnLaMismaProvincia(Candidato, OtroCandidato, Provincia)).

leGanaA(Candidato, OtroCandidato, Provincia) :-
    sePostulanEnLaMismaProvincia(Candidato, OtroCandidato, Provincia),
    candidato(Candidato, Partido),
    candidato(OtroCandidato, OtroPartido),
    compararResultados(Provincia, Partido, OtroPartido).



%auxiliar
compararResultados(Provincia, Partido, OtroPartido) :-
    intencionDeVotoEn(Provincia, Partido, Porcentaje1),
    intencionDeVotoEn(Provincia, OtroPartido, Porcentaje2),
    Porcentaje1>Porcentaje2.

%auxiliar
sonDelMismoPartido(UnCandidato, OtroCandidato, Partido) :-
    candidato(UnCandidato, Partido),
    candidato(OtroCandidato, Partido).

sePostulanEnLaMismaProvincia(Candidato, OtroCandidato, Provincia) :-
    sePresentaEnLaProvincia(Candidato, Provincia),
    sePresentaEnLaProvincia(OtroCandidato, Provincia).

sePresentaEnLaProvincia(Candidato, Provincia) :-
  candidato(Candidato, Partido),
  sePostulaEn(Partido, Provincia).

%punto 4
elGranCandidato(Nombre) :-
    leGanaATodos(Nombre),
    esCandidatoMasJovenDelPartido(Nombre).

%auxiliares
leGanaATodosEnLaProvincia(Candidato,Provincia):-
 candidato(Candidato,_),
 intencionDeVotoEn(Provincia, _, _),

 forall((sePresentaEnLaProvincia(Candidato2, Provincia),Candidato2\=Candidato),leGanaA(Candidato,Candidato2,Provincia)).
        
leGanaATodos(Candidato):-
candidato(Candidato,_),
 forall((sePresentaEnLaProvincia(Candidato,Provincia)),leGanaATodosEnLaProvincia(Candidato,Provincia)). 

esCandidatoMasJovenDelPartido(Candidato) :-
    candidato(Candidato, Partido),
    forall((candidato(Candidato2, Partido), Candidato2 \= Candidato), esMasJoven(Candidato,Candidato2)).

esMasJoven(Candidato,Candidato2):-
 edad(Candidato,Edad1),
 edad(Candidato2,Edad2),
 Edad1<Edad2.    



%punto 5
ajusteConsultora(Partido, Provincia, Porcentaje):-
    partidoLeGanaATodosEnProvincia(Partido,Provincia),
    intencionDeVotoEn(Provincia, Partido, Porcentaje1), Porcentaje is Porcentaje1 - 20 .

ajusteConsultora(Partido, Provincia, Porcentaje):-
    intencionDeVotoEn(Provincia, Partido, PorcDelPart),
    not(partidoLeGanaATodosEnProvincia(Partido,Provincia)),
    Porcentaje is PorcDelPart + 5.

partidoLeGanaATodosEnProvincia(Partido,Provincia):-
    intencionDeVotoEn(Provincia,Partido,_),
    forall((candidato(_, OtroPartido), Partido \= OtroPartido),compararResultados(Provincia, Partido, OtroPartido)).

%punto 6

% inflacion(cotaInferior, cotaSuperior)
% construir(listaDeObras)
% nuevosPuestosDeTrabajo(cantidad)

% edilicio(hospital, 800)

promete(azul, construir([edilicio(hospital,1000), edilicio(jardin,100), edilicio(escuela,5)])).
promete(azul, inflacion(2,4)).
promete(amarillo, construir([edilicio(hospital,100), edilicio(universidad,1), edilicio(comisaria,200)])).
promete(amarillo, nuevosPuestosDeTrabajo(10000)).
promete(amarillo, inflacion(1,415)).
promete(rojo, nuevosPuestosDeTrabajo(800000)).
promete(rojo, inflacion(10,30)).

%punto 7

%influenciaDePromesas(Promesa,Variacion)

influencia(inflacion(Menor,Mayor),Variacion):-
    Variacion is (Menor + Mayor)*(-0.5).

influencia(nuevosPuestosDeTrabajo(Cant),3):-
    Cant > 50000.

influencia(nuevosPuestosDeTrabajo(Cant),0):-
    Cant =< 50000.

influencia(construir(Lista),Variacion):-
    obtenerPorcentaje(edilicio(Tipo, Cant),_),
    findall(PorcPorConstru, obtenerPorcentaje(edilicio(Tipo, Cant),PorcPorConstru), Lista),
    sumlist(Lista, Variacion).

obtenerPorcentaje(edilicio(hospital, _), 2).

obtenerPorcentaje(edilicio(universidad, _), 0).

obtenerPorcentaje(edilicio(comisaria, 200), 2).

obtenerPorcentaje(edilicio(jardin, Cant),PorcPorConstru):-
    obtenerJardinOEscuela(Cant, PorcPorConstru).

obtenerPorcentaje(edilicio(escuela, Cant),PorcPorConstru):-
    obtenerJardinOEscuela(Cant, PorcPorConstru).

obtenerPorcentaje(edilicio(Algo, _), -1):-
    Algo \= hospital,
    Algo \= universidad,
    Algo \= escuela,
    Algo \= jardin,
    Algo \= comisaria.


obtenerJardinOEscuela(Cant, PorcPorConstru):-
    PorcPorConstru is Cant * 0.1.

%punto 8
promedioDeCrecimiento(Partido, Sumatoria):-
    findall(Variacion, variacionDePromesasDePartido(Partido, Variacion), Lista),
    sumlist(Lista, Sumatoria).

variacionDePromesasDePartido(Partido,Variacion):-
    promete(Partido,Promesa),
    influencia(Promesa,Variacion).


