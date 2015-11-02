:- dynamic([memory/2]).

% Pytania
question(Text, 1) :- Text= 'Jak czêsto czytasz ksi¹¿ki '.
question(Text, 2) :- Text= 'Gdzie zazwyczaj czytasz ksi¹¿ki '.
question(Text, 3) :- Text= 'Który przymiotnik lepiej Ciê opisuje '.
question(Text, 4) :- Text= 'Uwa¿asz, ¿e rozwiniêta wyobraŸnia jest istotna w ¿yciu codziennym '.
question(Text, 5) :- Text= 'Czy lubisz podró¿e i odkrywanie nowych miejsc '.
question(Text, 6) :- Text= 'Szklanka jest do po³owy …. '.
question(Text, 7) :- Text= 'Czy interesujesz siê faktami i zdarzeniami historycznymi '.
question(Text, 8) :- Text= 'Czy wierzysz, ¿e poza Ziemi¹ istnieje ¿ycie '.
question(Text, 9) :- Text= 'Które okreœlenie najlepiej do Ciebie pasuje '.
question(Text, 10) :- Text= 'Czy interesujesz siê odkryciami naukowymi i zdobywaniem wiedzy '.
question(Text, 11) :- Text= 'W jakie gry komputerowe najczesciej grasz '.
question(Text, 12) :- Text= 'Czy interesujesz siê intrygami i ³amig³ówkami '.
question(Text, 13) :- Text= 'Jakie filmy czêœciej ogl¹dasz w kinie '.
question(Text, 14) :- Text= 'Na wakacje najchêtniej pojecha³byœ: '.
question(Text, 15) :- Text= 'Wolisz ogl¹daæ '.
question(Text, 16) :- Text= 'Widzisz na ulicy bezdomnego zbieraj¹cego na jedzenie. Co robisz: '.
question(Text, 17) :- Text= 'Który kierunek studiów by³by dla Ciebie najbardziej interesuj¹cy '.
question(Text, 18) :- Text= 'Swoj¹ drug¹ po³ówkê w dniu jego/jej urodzin zabra³byœ: '.
question(Text, 19) :- Text= 'Któr¹ z tych mocy byæ wybra³ gdybyœ móg³ '.
question(Text, 20) :- Text= 'Czy posiadasz swoj¹ ulubion¹ postaæ historyczn¹, o której dyskutowa³eœ ze znajomym '.


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
    
% G³ówna funkcja
wykonaj_ksiazki :-
    polec(X),!,write('Polecam Ci '), write(X), nl, wyczysc_fakty.
    
wykonaj_ksiazki :-
    write('Nie znalazlem dopasowania'),nl,
    wyczysc_fakty.