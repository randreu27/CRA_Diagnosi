/* Introduexi els seus casos LLEUS aqu� */

cas_1:-
    gran_altura,
    n�usees_i_vomits.

cas_2:-
    gran_altura,
    mareig,
    mal_de_cap.

cas_3:-
    gran_altura,
    dificultat_per_el_esfor�_fisic,
    inflamacio_de_mans_peus_i_cara,
    dolors_musculars.

cas_4:-
    gran_altura,
    batec_cardiac_rapid,
    dificultat_per_respirar.

cas_5:-
    gran_altura,
    insomni,
    irritabilitat,
    perdua_de_gana.

/* Introduexi els seus casos GREUS aqu� */

cas_6:-
   (   cas_1;
   cas_2;
   cas_3;
   cas_4;
   cas_5),
   verifica(tossir).

cas_7:-
    (   cas_1;
   cas_2;
   cas_3;
   cas_4;
   cas_5),
   verifica(congestio).

cas_8:-
    (   cas_1;
   cas_2;
   cas_3;
   cas_4;
   cas_5),
   verifica(pell_p�lida).

cas_9:-
    (   cas_1;
   cas_2;
   cas_3;
   cas_4;
   cas_5),
   verifica(manca_de_equilibri).

cas_10:-
    (   cas_1;
   cas_2;
   cas_3;
   cas_4;
   cas_5),
   verifica(autoreclusi�_social).

/* Introduexi aqu� les preguntes a l'usuari */

mareig:- verifica(mareig),!.
mal_de_cap:- verifica(mal_de_cap),!.
dificultat_per_el_esfor�_fisic:- verifica(dificultat_per_el_esfor�_fisic),!.
inflamacio_de_mans_peus_i_cara:- verifica(inflamacio_de_mans_peus_i_cara),!.
dolors_musculars:- verifica(dolors_musculars),!.
batec_cardiac_rapid:- verifica(batec_cardiac_rapid),!.
dificultat_per_respirar:- verifica(dificultat_per_respirar),!.
insomni:- verifica(insomni),!.
irritabilitat:- verifica(irritabilitat),!.
perdua_de_gana:- verifica(perdua_de_gana),!.
gran_altura:- verifica(est�s_a_gran_altura),!.
n�usees_i_vomits:- verifica(n�usees_i_vomits),!.
