/* Preparació per crear la llista amb els símptomes */

:- dynamic lista/1.
lista([]).

inserta([], X, [X]).
inserta([H|T], N, [H|R]):- inserta(T, N, R).
nouSimptoma(Y):- lista(X), inserta(X, Y, Nova), asserta(lista(Nova)).


/* Main */

inici:-
    write('Programa de diagnosi del Mal de Muntanya Agut.'), nl,
    write('Et demanarem que responguis si o no a alguns simptomes.'), nl,
    repeat,
    hypotesis(Malaltia),
    write('Crec que tens: '),
    write(Malaltia),
    nl,
    writeln('Vols saber perquè he arribat a aquesta conclusió? (si/no)'),
    read(Resposta1), nl,
    (Resposta1 == si ->
    perque
    ;
    !
    ),
    nl,
    desfer,
    writeln('Vols tornar a fer el diagnostic? (si/no)'),
    read(Resp), nl,
    (Resp == si ->
    writeln('Nova sessió.'),
     fail % backtrack al repeat
    ;   writeln('Acabem, doncs.'),
    ! % Acabem el backtrack
    ).
/* Codi per escriure la llista amb els símptomes */
perque:-
    hypotesis(Malaltia),
    write('Crec que tens '),
    write(Malaltia),
    write(' perquè té aquestes característiques:'),
    nl,
    lista(X),
    writeln(X),
    desfer.


/* Hypotesis a comprovar */

hypotesis(mal_de_muntanya_agut_greu):- mal_de_muntanya_agut_greu,!.
hypotesis(mal_de_muntanya_agut_suau):- mal_de_muntanya_agut_suau,!.
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

/* Mal de Muntanya Agut Suau */

mal_de_muntanya_agut_suau:- gran_altura,
    nàusees_i_vomits.

mal_de_muntanya_agut_suau:-
    gran_altura,
    verifica(mareig),
    verifica(mal_de_cap).

mal_de_muntanya_agut_suau:-
    gran_altura,
    verifica(dificultat_per_el_esforç_fisic),
    verifica(inflamació_de_mans_peus_i_cara),
    verifica(dolors_musculars).

mal_de_muntanya_agut_suau:-
    gran_altura,
    verifica(batec_cardiac_ràpid),
    verifica(dificultat_per_respirar).

mal_de_muntanya_agut_suau:-
    gran_altura,
    verifica(insomni),
    verifica(irritabilitat),
    verifica(pèrdua_de_gana).

gran_altura:- verifica(estàs_a_gran_altura),!.
nàusees_i_vomits:- verifica(nàusees_i_vomits),!.

/* Mal de Muntanya Agut Greu */

mal_de_muntanya_agut_greu:-
    mal_de_muntanya_agut_suau,
    verifica(tossir).

mal_de_muntanya_agut_greu:-
    mal_de_muntanya_agut_suau,
    verifica(congestió).

mal_de_muntanya_agut_greu:-
    mal_de_muntanya_agut_suau,
    verifica(pell_pàlida).

mal_de_muntanya_agut_greu:-
    mal_de_muntanya_agut_suau,
    verifica(manca_de_equilibri).

mal_de_muntanya_agut_greu:-
    mal_de_muntanya_agut_suau,
    verifica(autoreclusió_social).

/* Part per preguntar a l'usuari */

pregunta(Pregunta):-
    write('Tens el símptoma de: '),
    write(Pregunta),
    write('? '),
    read(Resposta),
    nl,
    (   (Resposta == si ; Resposta == s)
    ->
    assert(si(Pregunta)),nouSimptoma(Pregunta);
    assert(no(Pregunta)), fail).
:- dynamic si/1,no/1.

/* Desfer totes les assercions si/no per iniciar una nova sessió */

desfer :- retract(si(_)), fail.
desfer :- retract(no(_)), fail.
desfer :- retract(lista(_)),fail.
desfer.






