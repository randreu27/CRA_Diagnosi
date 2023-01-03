/* Introducció dels casos */

:-consult(casos).

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
    writeln('Vols generar un arxiu <resultats.pl> que contingui tots el fets observats? (si/no)'),
    read(Resposta2), nl,
    (Resposta2 == si ->
    lista(X),
    write_list_to_file('resultats.pl', X),
     nl
     ;
    !
    ),
    writeln('Vols saber perquè he arribat a aquesta conclusió? (si/no)'),
    writeln('ATENCIÓ : Si respons amb un <si.>, la sessió finalitzarà.'),
    read(Resposta1), nl,
    (Resposta1 == si ->
    perque,
    desfer,
    nl,
    writeln('Acabem, doncs.'),
    write('Si vols fer un altre sessió escriu <inici.> al terminal')
    ;
    nl,
    desfer,
    writeln('Vols tornar a fer el diagnostic? (si/no)'),
    read(Resp),
    nl,
    (Resp == si ->
    writeln('Nova sessió.'),
    fail % backtrack al repeat
    ;
    writeln('Acabem, doncs.'),
    ! % Acabem el backtrack
    )).

/* Codi per escriure la llista amb els símptomes */

perque:-
    hypotesis(Malaltia),
    write('Crec que tens '),
    write(Malaltia),
    write(' perquè té aquestes característiques:'),
    nl,
    lista(X),
    writeln(X).

/* Preparació per el diagnosi en 'batch' */

loop_through_list(File, List):-
    member(Element, List),
    writeln(File, Element),
    writeln(File, ' '),
    fail.

write_list_to_file(Filename,List):-
    hypotesis(Malaltia),
    open(Filename, write, File),
    write(File, Malaltia),
    writeln(File, ':'),
    writeln(File, 'Evidències:'),
    \+ loop_through_list(File, List),
    (Malaltia == cas_1; Malaltia == cas_2; Malaltia == cas_3; Malaltia == cas_4; Malaltia == cas_5 ->
    writeln(File, 'Identificació de la malaltia: Mal de Muntanya Suau')
    ;
    Malaltia == cas_6; Malaltia == cas_7; Malaltia == cas_8; Malaltia == cas_9; Malaltia == cas_10 ->
    writeln(File, 'Identificació de la malaltia: Mal de Muntanya Greu')
    ;
    writeln(File,'Identificació de la malaltia: Desconegut')
    )
    ,
    close(File).


/* Hypotesis a comprovar */

hypotesis(cas_6):- cas_6,!.
hypotesis(cas_7):- cas_7,!.
hypotesis(cas_8):- cas_8,!.
hypotesis(cas_9):- cas_9,!.
hypotesis(cas_10):- cas_10,!.
hypotesis(cas_1):- cas_1,!.
hypotesis(cas_2):- cas_2,!.
hypotesis(cas_3):- cas_3,!.
hypotesis(cas_4):- cas_4,!.
hypotesis(cas_5):- cas_5,!.
hypotesis(error_de_identificacio).

/* Verificació */

verifica(S):-
 (si(S)
 ->
 true ;
 (no(S)
 ->
 fail ;
 pregunta(S))).

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
desfer :- retractall(lista(_)), fail.
desfer :- asserta(lista([])), fail.

desfer.






