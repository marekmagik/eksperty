:- dynamic([memory/2]).

% Pytania
question(Text, Answers, 1) :- Text= 'Jak cz�sto czytasz ksi��ki ', Answers = [codziennie,okazjonalnie,rzadko].
question(Text, Answers, 2) :- Text= 'Gdzie zazwyczaj czytasz ksi��ki ', Answers = [dom,tramwaj,zajecia].
question(Text, Answers, 3) :- Text= 'Kt�ry przymiotnik lepiej Ci� opisuje ', Answers = [opanowany,impulsywny].
question(Text, Answers, 4) :- Text= 'Uwa�asz, �e rozwini�ta wyobra�nia jest istotna w �yciu codziennym ', Answers = [tak,nie].
question(Text, Answers, 5) :- Text= 'Czy lubisz podr�e i odkrywanie nowych miejsc ', Answers = [tak,nie].
question(Text, Answers, 6) :- Text= 'Szklanka jest do po�owy �. ', Answers = [pelna,pusta].
question(Text, Answers, 7) :- Text= 'Czy interesujesz si� faktami i zdarzeniami historycznymi ', Answers = [tak,nie].
question(Text, Answers, 8) :- Text= 'Czy wierzysz, �e poza Ziemi� istnieje �ycie ', Answers = [tak,nie].
question(Text, Answers, 9) :- Text= 'Kt�re okre�lenie najlepiej do Ciebie pasuje ', Answers = [introwertyk,ekstrawertyk,melancholik].
question(Text, Answers, 10) :- Text= 'Czy interesujesz si� odkryciami naukowymi i zdobywaniem wiedzy ', Answers = [tak,nie].
question(Text, Answers, 11) :- Text= 'W jakie gry komputerowe najczesciej grasz ', Answers = [shootery,rpg,strategie,przygodowe,horrory].
question(Text, Answers, 12) :- Text= 'Czy interesujesz si� intrygami i �amig��wkami ', Answers = [tak,nie].
question(Text, Answers, 13) :- Text= 'Jakie filmy cz�ciej ogl�dasz w kinie ', Answers = [akcji,familijne,psychologiczne,przygodowe,basnie,thrillery,dramaty].
question(Text, Answers, 14) :- Text= 'Na wakacje najch�tniej pojecha�by�: ', Answers = [gory,morze,zwiedzanie_zabytkow,kamping].
question(Text, Answers, 15) :- Text= 'Wolisz ogl�da� ', Answers = [].
question(Text, Answers, 16) :- Text= 'Widzisz na ulicy bezdomnego zbieraj�cego na jedzenie. Co robisz: ', Answers = [].
question(Text, Answers, 17) :- Text= 'Kt�ry kierunek studi�w by�by dla Ciebie najbardziej interesuj�cy ', Answers = [informatyka,fizyka,historia,prawo].
question(Text, Answers, 18) :- Text= 'Swoj� drug� po��wk� w dniu jego/jej urodzin zabra�by�: ', Answers = [kolacja,film_w_domu,spotkanie_z_przyjaciolmi].
question(Text, Answers, 19) :- Text= 'Kt�r� z tych mocy by� wybra� gdyby� m�g� ', Answers = [].
question(Text, Answers, 20) :- Text= 'Czy posiadasz swoj� ulubion� posta� historyczn�, o kt�rej dyskutowa�e� ze znajomym ', Answers = [tak,nie].


% Hipotezy
polec(lekka_pozycja_fantasy) :-
    lubi(fantastyka),
    lubi(lekkie_pozycje).

polec(ciezka_pozycja_fantasy) :-
    lubi(fantastyka),
    lubi(ciezkie_pozycje).

polec(popularnonaukowa) :-
    lubi(naukowe),
    lubi(ciezkie_pozycje).
	
polec(romans) :-
    lubi(romans),
    lubi(lekkie_pozycje).
    
polec(ciezka_pozycja_historyczna) :-
    lubi(historia),
    lubi(ciezkie_pozycje).

polec(lekka_pozycja_historyczna) :-
    lubi(historia),
    czyta(rzadko),
    lubi(podroze).
    
polec(kryminal) :-
	lubi(zagadki),
	czyta(rzadko).
	
polec(ksiazka_przygodowa) :-
	lubi(lekkie_pozycje),
	lubi(podroze),
	typ(optymista).
	
polec(horror) :-
	lubi(horrory),
	lubi(ciezkie_pozycje).
	
polec(biografia) :-
	lubi(biografia),
	lubi(ciezkie_pozycje).

polec(science_fiction) :-
	lubi(ciezkie_pozycje),
	lubi(podroze),
	lubi(naukowe).
	
    
% Fakty posrednie
czyta(rzadko) :-
    question(Q,A,2),
    pytaj(Q,A,[tramwaj,zajecia],2).

czyta(czesto) :-
    question(Q,A,2),
    pytaj(Q,A,[dom],2).

lubi(fantastyka) :-
    question(Q,A,11),
    pytaj(Q,A,[rpg],11),
    (question(Q,A,4),
    pytaj(Q,A,[tak],4);
    question(Q,A,8),
    pytaj(Q,A,[tak],8)),
    question(Q,A,13),
    pytaj(Q,A,[przygodowe,basnie],13).
    
    
lubi(zagadki) :-
	question(Q,A,12),
	pytaj(Q,A,[tak],12),
	lubi_grac_w(przygodowe),
	question(Q2,A2,17),
	pytaj(Q2,A2,[kryminalistyka],17).
	
lubi(podroze) :-
	question(Q, A, 5),
	pytaj(Q,A,[tak],5),
	question(Q2, A2, 14),
	pytaj(Q2,A2,[gory],14).
	
lubi(horrory) :-
	lubi_grac_w(horrory),
	typ(pesymista).
		
lubi(biografia) :-
	lubi(historia),
	question(Q, A, 20),
	pytaj(Q,A,[tak],20).


lubi(lekkie_pozycje) :-
    (question(Q,A,1),
    pytaj(Q,A,[okazjonalnie,rzadko],1);
    czyta(rzadko)),
    question(Q,A,3),
    pytaj(Q,A,[impulsywny],3),
    (question(Q,A,5),
    pytaj(Q,A,[tak],5);
    question(Q,A,13),
    pytaj(Q,A,[przygodowe,akcji,familijne],13)).
        
    
lubi(ciezkie_pozycje) :-
    (question(Q,A,1),
    pytaj(Q,A,[codziennie],1);
    czyta(czesto)),
    (question(Q,A,4),
    pytaj(Q,A,[tak],4);
    question(Q,A,13),
    pytaj(Q,A,[psychologiczne,thrillery,dramaty],13)),
    question(Q,A,3),
    pytaj(Q,A,[opanowany],3).

lubi(naukowe) :-
    question(Q,A,17),
    pytaj(Q,A,[informatyka,fizyka],17),
    question(Q,A,10),
    pytaj(Q,A,[tak],10),
    question(Q,A,8),
    pytaj(Q,A,[tak],8).
% // TODO: doda� strategie

        	
lubi(romans) :-
    question(Q,A,18),
    pytaj(Q,A,[kolacja,film_w_domu],18),
    question(Q,A,11),
    pytaj(Q,A,[rpg,przygodowe],11),
    question(Q,A,9),
    pytaj(Q,A,[introwertyk,melancholik],9),
    question(Q,A,6),
    pytaj(Q,A,[pelna],6).

lubi(historia) :-
    (question(Q,A,20),
    pytaj(Q,A,[tak],20),
    question(Q,A,11),
    pytaj(Q,A,[shootery,strategie],11),
    question(Q,A,14),
    pytaj(Q,A,[gory,zwiedzanie_zabytkow],14));
    question(Q,A,7),
    pytaj(Q,A,[tak],7),
    question(Q,A,17),
    pytaj(Q,A,[historia],17).        

lubi(podroze) :-
    question(Q,A,5),
    pytaj(Q,A,[tak],5).
	
typ(optymista) :-
	question(Q, A, 6),
	pytaj(Q,A,[pelna],6).
	
typ(pesymista) :-
	question(Q, A, 6),
	pytaj(Q,A,[pusta],6).
	
lubi_grac_w(X) :-
    question(Q,A,11),
    pytaj(Q,A,[X],11).
    

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