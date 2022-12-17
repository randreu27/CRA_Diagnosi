inici :-
 write('Identificador d\'animals.'), nl,
 write('Et demanarem algunes característiques.'), nl,
 repeat,
 hypotesis(Animal),
 write('Crec que és: '),
 write(Animal),
 nl,
 desfer,
 writeln('Vols identificar un altre animal: ? (si/no)'),
 read(Resp),nl,
 (Resp == si ->
 writeln('Nova sessió.'),
 fail % backtrack al repeat
 ; writeack
 ).
/* hypotesis a comprovar */
hypotesis(guepard) :- guepard, !.
hypotesis(tigre) :- tigre, !.
hypotesis(girafa) :- girafa, !.
hypotesis(zebra) :- zebra, !.
hypotesis(estruc) :- estruc, !.
hypotesis(pingüí) :- pingüí, !.
hypotesis(gavina) :- gavina, !.
hypotesis(desconegut). /* no hi ha identificació */
/* Per verificar alguna cosa */
verifica(S) :-
 (si(S)
 ->
 true ;
 (no(S)
 ->
 fail ;
 pregunta(S))).
/* regles per identificar cada animal */
guepard :- mamifer,
 carnivor,
 verifica(te_color_amarronat),
 verifica(te_taques_fosques).
tigre :- mamifer,
 carnivor,
 verifica(te_color_amarronat),
 verifica(te_ratlles_negres).
girafa :- ungulat,
 verifica(te_coll_llarg),
 verifica(te_potes_llargues).
zebra :- ungulat,
 verifica(te_ratlles_negres).
estruc :- ocell,
 verifica(no_vola),
 verifica(te_coll_llarg).
pingüí :- ocell,
 verifica(no_vola),
 verifica(neda),
 verifica(es_blanc_i_negre).
gavina :- ocell,
 verifica(te_bec_groc),
 verifica(vola_be),
 verifica(es_veu_a_la_costa).
mamifer :- verifica(te_pel), !.
mamifer :- verifica(dona_llet).
ocell :- verifica(te_plomes), !.
ocell :- verifica(vola),verifica(posa_ous).
carnivor :- verifica(menja_carn), !.
carnivor :- verifica(te_dents_esmolats),
 verifica(te_urpes),
 (te_ulls_orientacio_frontal).
ungulat :- mamifer,
 verifica(te_peulles), !.
ungulat :- mamifer,
 verifica(rumia).
/* per preguntar als usuaris */
pregunta(Pregunta) :-
 write('Té aquesta característica: '),
 write(Pregunta),
 write('? '),
 read(Resposta),
 nl,
 ( (Resposta == si ; Resposta == s)
 ->
 assert(si(Pregunta)) ;
 assert(no(Pregunta)), fail).
:- dynamic si/1,no/1.
/* desfer totes les assercions si/no per iniciar nova sessió */
desfer :- retract(si(_)),fail.
desfer :- retract(no(_)),fail.
desfer.
