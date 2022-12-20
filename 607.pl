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

hypotesis(mal_de_muntanya_agut):- mal_de_muntanya_agut, !.
hypotesis(no_mal_de_muntanya):- no_mal_de_muntanya, !.

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
