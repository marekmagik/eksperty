:- dynamic([memory/2]).

% Hipotezy
polec(lekka_pozycja_fantasy) :-
    lubi(fantastyka),
    czyta(rzadko).

    
% Fakty posrednie
czyta(rzadko) :-
    pytaj('Gdzie najczesciej czytasz (dom,tramwaj,zajecia)?: ',[dom,tramwaj,zajecia],tramwaj,czytanie).
    
czyta(rzadko) :-
    pytaj('Gdzie najczesciej czytasz (dom,tramwaj,zajecia)?: ',[dom,tramwaj,zajecia],zajecia,czytanie).

lubi(fantastyka) :-
    pytaj('W jakie gry komputerowe najczesciej grasz (shootery,rpg,strategie)?: ',[shootery,rpg,strategie],rpg,granie).
        

% Funkcje pomocnicze
pamietaj(X, Y) :-
    assertz(memory(X, Y)).

pytaj(_,_,Answer,Type) :-
	memory(Type,Answer).
	
pytaj(Question,Answers,Answer,Type) :-
	subtract(Answers,[Answer],Subtracted),
	sprawdz(Subtracted,Type),
	write(Question),
	readln([Reply]),
	pamietaj(Type,Reply),
	Reply == Answer.
	
sprawdz([],_).
sprawdz([X|Rest],Type) :- not(memory(Type,X)),sprawdz(Rest,Type).

% Czyszczenie zapisanych danych
wyczysc_fakty :-
    write('Nacisnij enter aby zakonczyc'),
    retractall(memory(_,_)),
    readln(_).
    
% G³ówna funkcja
wykonaj_ksiazki :-
    polec(X),!,write('Polecam Ci '), write(X), nl, wyczysc_fakty.
    
wykonaj_ksiazki :-
    write('Nie znalazlem dopasowania'),nl,
    wyczysc_fakty.