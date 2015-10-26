:- module(se2,[wykonaj]).

:- dynamic([xpozytywne/2, xnegatywne/2]).

% hipotesa : lekka pozycja fantasy
polec(lekka_pozycja_fantasy) :-
	lubi(fantastyka),
	czyta(rzadko).
	
% fakt posredni : czyta rzadko
czyta(rzadko) :-
	pytaj_o_czytanie(tramwaj).
	
% pytania o czytanie
pytaj_o_czytanie(X) :-
	!, write(' Gdzie najczesciej czytasz (Dom,Tramwaj,Miedzy zajeciami)\n'),
	readln([Replay]),
	odpowiedz_o_czytaniu(Replay, X).
	
odpowiedz_o_czytaniu(Replay, dom):-
	sub_string(Replay, 0, _, _, 'Dom').

odpowiedz_o_czytaniu(Replay, tramwaj):-
	sub_string(Replay, 0, _, _, 'Tramwaj').
	
odpowiedz_o_czytaniu(Replay, zajecia):-
	sub_string(Replay, 0, _, _, 'Miedzy zajeciami').
	 
% fakt posredni : lubi fantastyke
lubi(fantastyka) :-
	pytaj_o_gre(rpg).
	
% pytania o to w co gra
pytaj_o_gre(X) :-
	!, write(' W jakie gry komputerowe najczesciej grasz? (Shootery,RPG,Strategie)\n'),
	readln([Replay]),
	odpowiedz_o_grze(Replay, X).
	
odpowiedz_o_grze(Replay, rpg):-
	sub_string(Replay, 0, _, _, 'RPG').

odpowiedz_o_grze(Replay, shootery):-
	sub_string(Replay, 0, _, _, 'Shootery').
	
odpowiedz_o_grze(Replay, strategie):-
	sub_string(Replay, 0, _, _, 'Strategie').

	
% do odpalania
wykonaj_ksiazki :-
	polec(X),!,write('Polecam Ci '), write(X), nl.



	