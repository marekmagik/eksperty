:- dynamic([memory/2]).

% Pytania
question(Text, Answers, 1) :- Text= 'Jak czêsto czytasz ksi¹¿ki ', Answers = [].
question(Text, Answers, 2) :- Text= 'Gdzie zazwyczaj czytasz ksi¹¿ki ', Answers = [dom,tramwaj,zajecia].
question(Text, Answers, 3) :- Text= 'Który przymiotnik lepiej Ciê opisuje ', Answers = [opanowany,impulsywny].
question(Text, Answers, 4) :- Text= 'Uwa¿asz, ¿e rozwiniêta wyobraŸnia jest istotna w ¿yciu codziennym ', Answers = [].
question(Text, Answers, 5) :- Text= 'Czy lubisz podró¿e i odkrywanie nowych miejsc ', Answers = [tak,nie].
question(Text, Answers, 6) :- Text= 'Szklanka jest do po³owy …. ', Answers = [pelna,pusta].
question(Text, Answers, 7) :- Text= 'Czy interesujesz siê faktami i zdarzeniami historycznymi ', Answers = [tak,nie].
question(Text, Answers, 8) :- Text= 'Czy wierzysz, ¿e poza Ziemi¹ istnieje ¿ycie ', Answers = [].
question(Text, Answers, 9) :- Text= 'Które okreœlenie najlepiej do Ciebie pasuje ', Answers = [].
question(Text, Answers, 10) :- Text= 'Czy interesujesz siê odkryciami naukowymi i zdobywaniem wiedzy ', Answers = [tak,nie].
question(Text, Answers, 11) :- Text= 'W jakie gry komputerowe najczesciej grasz ', Answers = [shootery,rpg,strategie,przygodowe,horrory].
question(Text, Answers, 12) :- Text= 'Czy interesujesz siê intrygami i ³amig³ówkami ', Answers = [tak,nie].
question(Text, Answers, 13) :- Text= 'Jakie filmy czêœciej ogl¹dasz w kinie ', Answers = [].
question(Text, Answers, 14) :- Text= 'Na wakacje najchêtniej pojecha³byœ: ', Answers = [gory].
question(Text, Answers, 15) :- Text= 'Wolisz ogl¹daæ ', Answers = [].
question(Text, Answers, 16) :- Text= 'Widzisz na ulicy bezdomnego zbieraj¹cego na jedzenie. Co robisz: ', Answers = [].
question(Text, Answers, 17) :- Text= 'Który kierunek studiów by³by dla Ciebie najbardziej interesuj¹cy ', Answers = [kryminalistyka].
question(Text, Answers, 18) :- Text= 'Swoj¹ drug¹ po³ówkê w dniu jego/jej urodzin zabra³byœ: ', Answers = [].
question(Text, Answers, 19) :- Text= 'Któr¹ z tych mocy byæ wybra³ gdybyœ móg³ ', Answers = [].
question(Text, Answers, 20) :- Text= 'Czy posiadasz swoj¹ ulubion¹ postaæ historyczn¹, o której dyskutowa³eœ ze znajomym ', Answers = [tak,nie].


% Hipotezy
polec(lekka_pozycja_fantasy) :-
    lubi(fantastyka),
    czyta(rzadko).

polec(ciezka_pozycja_fantasy) :-
    lubi(fantastyka),
    czyta(czesto).
    
polec(kryminal) :-
	lubi(zagadki),
	czyta(rzadko).
	
polec(ksiazka_przygodowa) :-
	czyta(rzadko),
	lubi(podroze),
	typ(ekstrawertyk).
	
polec(horror) :-
	lubi(horrory),
	czyta(duzo).
	
polec(biografia) :-
	lubi(biografia),
	czyta(duzo).

polec(science_fiction) :-
	czyta(duzo),
	lubi(podroze),
	lubi(nauka).
	
    
% Fakty posrednie

czyta(duzo) :-
	czyta(czesto).

czyta(rzadko) :-
    question(Q,A,2),
    pytaj(Q,A,[tramwaj,zajecia],czytanie).

czyta(czesto) :-
    question(Q,A,2),
    pytaj(Q,A,[dom],czytanie).

lubi(fantastyka) :-
    question(Q,A,11),
    pytaj(Q,A,[rpg],granie).
    
lubi(zagadki) :-
	question(Q,A,12),
	pytaj(Q,A,[tak],zagadki),
	lubi_grac_w(przygodowe),
	chcialby_studiowac(kryminalistyka).
	
lubi(podroze) :-
	question(Q, A, 5),
	pytaj(Q,A,[tak],podroze),
	question(Q2, A2, 14),
	pytaj(Q2,A2,[gory],wakacje).
	
lubi(horrory) :-
	lubi_grac_w(horrory),
	typ(introwertyk),
	charakter(opanowany).
	
lubi(biografia) :-
	lubi(historia),
	postac_historyczna(tak).
	
lubi(historia) :-
	fakty_historyczne(tak).
	
lubi(nauka) :-
	question(Q, A, 10),
	pytaj(Q,A,[tak],nauka).
	
fakty_historyczne(X) :-
	question(Q, A, 7),
	pytaj(Q,A,[X],fakty).
	
postac_historyczna(X) :-
	question(Q, A, 20),
	pytaj(Q,A,[X],postac).
	
charakter(X) :-
	question(Q, A, 3),
	pytaj(Q,A,[X],charakter).
	
typ(ekstrawertyk) :-
	question(Q, A, 6),
	pytaj(Q,A,[pelna],szklanka).
	
typ(introwertyk) :-
	question(Q, A, 6),
	pytaj(Q,A,[pusta],szklanka).
	
lubi_grac_w(X) :-
	question(Q,A,11),
    pytaj(Q,A,[X],granie).

chcialby_studiowac(X) :-
	question(Q2,A2,17),
	pytaj(Q2,A2,[X],studia).
        

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