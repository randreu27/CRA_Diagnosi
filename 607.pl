inici:-
    write('Programa de diagnosi del Mal de Muntanya Agut.'), nl,
    write('Et demanarem que responguis si o no a alguns simptomes.'), nl,
    repeat,
    hypotesis(Malaltia),
    write('Crec que tens'),
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

hypotesis(mal_de_muntanya_agut_suau):- mal_de_muntanya_agut_suau.
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

/* Mal de Muntanya Agut Suau */

mal_de_muntanya_agut_suau:- gran_altura,
    nàusees_i_vomits, !.

mal_de_muntanya_agut_suau:-
    verifica(mareig),
    verifica(mal_de_cap).

mal_de_muntanya_agut_suau:-
    verifica(dolors_musculars),
    verifica(insomni),
    verifica(irritabilitat),
    verifica(pèrdua_de_gana),
    verifica(inflamació_de_mans_peus_i_cara),
    verifica(batec_cardiac_ràpid),
    verifica(dificultat_per_respirar),
    verifica(dificultat_per_el_esforç_fisic).

gran_altura:- verifica(estàs_a_gran_altura), !.
nàusees_i_vomits:- verifica(nàusees_i_vomits), !.

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
    assert(si(Pregunta));
    assert(no(Pregunta)), fail).
:- dynamic si/1,no/1.

/* Desfer totes les assercions si/no per iniciar una nova sessió */

desfer :- retract(si(_)), fail.
desfer :- retract(no(_)), fail.
desfer.
