:- dynamic([xpytaj_o_czytanie/1]).

% hipoteza : lekka pozycja fantasy
polec(lekka_pozycja_fantasy) :-
	lubi(fantastyka),
	czyta(rzadko).
	
% fakt posredni : czyta rzadko
czyta(rzadko) :-
	pytaj_o_czytanie(tramwaj).
	
czyta(rzadko) :-
	pytaj_o_czytanie(zajecia).
	
% pytania o czytanie

pytaj_o_czytanie(X) :-
	xpytaj_o_czytanie(X),!.
	
pytaj_o_czytanie(X) :-
	!,not(xpytaj_o_czytanie(X)),
	write(' Gdzie najczesciej czytasz (Dom,Tramwaj,Zajecia)\n'),
	readln([Replay]),
	odpowiedz_o_czytaniu(Replay, X). 
	
odpowiedz_o_czytaniu(Replay, X):-
	sub_string(Replay, 0, _, _, 'Dom'),
	assertz(xpytaj_o_czytanie(X)).

odpowiedz_o_czytaniu(Replay, X):-
	sub_string(Replay, 0, _, _, 'Tramwaj'),
	assertz(xpytaj_o_czytanie(X)).
	
odpowiedz_o_czytaniu(Replay, X):-
	sub_string(Replay, 0, _, _, 'Zajecia'),
	assertz(xpytaj_o_czytanie(X)).
	 
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
	

% czyszczenie zapisanych danych
wyczysc_fakty :-
	write('\nNacisnij enter aby zakonczyc\n'),
	retractall(xpytaj_o_czytanie(_)),
	readln(_).
	
% do odpalania
wykonaj_ksiazki :-
	polec(X),!,write('Polecam Ci '), write(X), nl, wyczysc_fakty.



	