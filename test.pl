:- dynamic([memory/2]).

% Pytania
question(Text, 1) :- Text= 'Jak cz�sto czytasz ksi��ki '.
question(Text, 2) :- Text= 'Gdzie zazwyczaj czytasz ksi��ki '.
question(Text, 3) :- Text= 'Kt�ry przymiotnik lepiej Ci� opisuje '.
question(Text, 4) :- Text= 'Uwa�asz, �e rozwini�ta wyobra�nia jest istotna w �yciu codziennym '.
question(Text, 5) :- Text= 'Czy lubisz podr�e i odkrywanie nowych miejsc '.
question(Text, 6) :- Text= 'Szklanka jest do po�owy �. '.
question(Text, 7) :- Text= 'Czy interesujesz si� faktami i zdarzeniami historycznymi '.
question(Text, 8) :- Text= 'Czy wierzysz, �e poza Ziemi� istnieje �ycie '.
question(Text, 9) :- Text= 'Kt�re okre�lenie najlepiej do Ciebie pasuje '.
question(Text, 10) :- Text= 'Czy interesujesz si� odkryciami naukowymi i zdobywaniem wiedzy '.
question(Text, 11) :- Text= 'W jakie gry komputerowe najczesciej grasz '.
question(Text, 12) :- Text= 'Czy interesujesz si� intrygami i �amig��wkami '.
question(Text, 13) :- Text= 'Jakie filmy cz�ciej ogl�dasz w kinie '.
question(Text, 14) :- Text= 'Na wakacje najch�tniej pojecha�by�: '.
question(Text, 15) :- Text= 'Wolisz ogl�da� '.
question(Text, 16) :- Text= 'Widzisz na ulicy bezdomnego zbieraj�cego na jedzenie. Co robisz: '.
question(Text, 17) :- Text= 'Kt�ry kierunek studi�w by�by dla Ciebie najbardziej interesuj�cy '.
question(Text, 18) :- Text= 'Swoj� drug� po��wk� w dniu jego/jej urodzin zabra�by�: '.
question(Text, 19) :- Text= 'Kt�r� z tych mocy by� wybra� gdyby� m�g� '.
question(Text, 20) :- Text= 'Czy posiadasz swoj� ulubion� posta� historyczn�, o kt�rej dyskutowa�e� ze znajomym '.


% Hipotezy
polec(lekka_pozycja_fantasy) :-
    lubi(fantastyka),
    czyta(rzadko).

polec(ciezka_pozycja_fantasy) :-
    lubi(fantastyka),
    czyta(czesto).
    
    
% Fakty posrednie
czyta(rzadko) :-
    question(Q,2),
    pytaj(Q,[dom,tramwaj,zajecia],[tramwaj,zajecia],czytanie).

czyta(czesto) :-
    question(Q,2),
    pytaj(Q,[dom,tramwaj,zajecia],[dom],czytanie).

lubi(fantastyka) :-
    question(Q,11),
    pytaj(Q,[shootery,rpg,strategie],[rpg],granie).
        

% Funkcje pomocnicze
pamietaj(X, Y) :-
    assertz(memory(X, Y)).
    
sprawdz([],_) :- false.    
sprawdz([X|Rest],Type) :- memory(Type,X);sprawdz(Rest,Type).

pytaj(_,_,Answer,Type) :-
	memory(Type,Answer).
	
pytaj(Question,Answers,Answer,Type) :-
	(sprawdz(Answer,Type));
	(not(sprawdz(Answers, Type)),
	uzyskaj_poprawna_odpowiedz(Question,Answers,Reply),
	pamietaj(Type,Reply),
	member(Reply, Answer)).
	
uzyskaj_poprawna_odpowiedz(Question,Answers,Reply):-
	repeat,
	write(Question),write(Answers),write('?: '),nl,
	readln([Reply]),
	(member(Reply,Answers)),!.


% Czyszczenie zapisanych danych
wyczysc_fakty :-
    write('Nacisnij enter aby zakonczyc'),
    retractall(memory(_,_)),
    readln(_).
    
% G��wna funkcja
wykonaj_ksiazki :-
    polec(X),!,write('Polecam Ci '), write(X), nl, wyczysc_fakty.
    
wykonaj_ksiazki :-
    write('Nie znalazlem dopasowania'),nl,
    wyczysc_fakty.