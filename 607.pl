inici:-
    write('Programa de diagnosi del Mal de Muntanya Agut.'), nl,
    write('Et demanarem que responguis si o no a alguns simptomes.'), nl,
    repeat,
    hypotesis(Malaltia),
    write(Malaltia),
    nl,
    desfer,
    writeln('Vols tornar a fer el diagnostic: ? (si/no'),
    read(Resp), nl,
    (Resp == si ->
    writeln('Nova sessió.'),
     fail % backtrack al repeat
    ;   writeack
    ).

/* Hypotesis a comprovar*/

hypotesis(mal_de_muntanya_agut_suau):- mal_de_muntanya_agut_suau, !.
hypotesis(mal_de_muntanya_agut_greu):- mal_de_muntanya_agut_greu, !.
hypotesis(no_mal_de_muntanya).

/* Verificació */

verifica(S):-
 (si(S)
 ->
 true ;
 (no(S)
 ->
 fail ;
 pregunta(S))).

/* Regles d'identificació */

mal_de_muntanya_agut_suau:- gran_altura,
    verifica(mareig),
    verifica(mal_de_cap),
    verifica(dolors_musculars),
    verifica(insomni),
