:- dynamic([memory/2]).

% Hipotezy
polec(lekka_pozycja_fantasy) :-
    lubi(fantastyka),
    czyta(rzadko).

    
% Fakty posrednie
czyta(rzadko) :-
    pytaj_o_czytanie(tramwaj).
    
czyta(rzadko) :-
    pytaj_o_czytanie(zajecia).

lubi(fantastyka) :-
    pytaj_o_gre(rpg).


% Pytania o symptomy
pytaj_o_czytanie(X) :-
    memory(czytanie,X).

pytaj_o_czytanie(X) :-
    subtract([dom,tramwaj,zajecia],[X],L),
    nth1(1,L,F),
    nth1(2,L,S),
    not(memory(czytanie, F)),
    not(memory(czytanie, S)),
    write(' Gdzie najczesciej czytasz (dom,tramwaj,zajecia)\n'),
    readln([Replay]),
    pamietaj(czytanie, Replay),
    Replay == X,
    odpowiedz_o_czytaniu(X).

odpowiedz_o_czytaniu(dom):- true.

odpowiedz_o_czytaniu(tramwaj):- true.
    
odpowiedz_o_czytaniu(zajecia):- true.
        
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
    

% Funkcje pomocnicze
pamietaj(X, Y) :-
    assertz(memory(X, Y)).


% Czyszczenie zapisanych danych
wyczysc_fakty :-
    write('Nacisnij enter aby zakonczyc\n'),
    retractall(memory(_,_)),
    readln(_).
    
% G³ówna funkcja
wykonaj_ksiazki :-
    polec(X),!,write('Polecam Ci '), write(X), nl, wyczysc_fakty.
    
wykonaj_ksiazki :-
    write('\nNie znalazlem dopasowania'),nl,
    wyczysc_fakty.