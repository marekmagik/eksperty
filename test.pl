:- dynamic([memory/2]).

% Pytania
question(Text, Answers, jak_czesto) :- Text= 'Jak czêsto czytasz ksi¹¿ki ', Answers = [codziennie,okazjonalnie,rzadko].
question(Text, Answers, gdzie) :- Text= 'Gdzie zazwyczaj czytasz ksi¹¿ki ', Answers = [dom,tramwaj,zajecia].
question(Text, Answers, jest) :- Text= 'Który przymiotnik lepiej Ciê opisuje ', Answers = [opanowany,impulsywny].
question(Text, Answers, wyobraznia) :- Text= 'Uwa¿asz, ¿e rozwiniêta wyobraŸnia jest istotna w ¿yciu codziennym ', Answers = [tak,nie].
question(Text, Answers, podroze) :- Text= 'Czy lubisz podró¿e i odkrywanie nowych miejsc ', Answers = [tak,nie].
question(Text, Answers, szklanka) :- Text= 'Szklanka jest do po³owy …. ', Answers = [pelna,pusta].
question(Text, Answers, historia) :- Text= 'Czy interesujesz siê faktami i zdarzeniami historycznymi ', Answers = [tak,nie].
question(Text, Answers, zycie_pozaziemskie) :- Text= 'Czy wierzysz, ¿e poza Ziemi¹ istnieje ¿ycie ', Answers = [tak,nie].
question(Text, Answers, charakter) :- Text= 'Które okreœlenie najlepiej do Ciebie pasuje ', Answers = [introwertyk,ekstrawertyk,melancholik].
question(Text, Answers, nauka) :- Text= 'Czy interesujesz siê odkryciami naukowymi i zdobywaniem wiedzy ', Answers = [tak,nie].
question(Text, Answers, gry_komputerowe) :- Text= 'W jakie gry komputerowe najczesciej grasz ', Answers = [shootery,rpg,strategie,przygodowe,horrory].
question(Text, Answers, zagadki) :- Text= 'Czy interesujesz siê intrygami i ³amig³ówkami ', Answers = [tak,nie].
question(Text, Answers, filmy) :- Text= 'Jakie filmy czêœciej ogl¹dasz w kinie ', Answers = [akcji,familijne,psychologiczne,przygodowe,basnie,thrillery,dramaty].
question(Text, Answers, wakacje) :- Text= 'Na wakacje najchêtniej pojecha³byœ: ', Answers = [gory,morze,zwiedzanie_zabytkow,kamping].
question(Text, Answers, oglada) :- Text= 'Wolisz ogl¹daæ ', Answers = [].
question(Text, Answers, bezdomny) :- Text= 'Widzisz na ulicy bezdomnego zbieraj¹cego na jedzenie. Co robisz: ', Answers = [].
question(Text, Answers, studia) :- Text= 'Który kierunek studiów by³by dla Ciebie najbardziej interesuj¹cy ', Answers = [informatyka,fizyka,historia,prawo,kryminalistyka].
question(Text, Answers, urodziny_partnera) :- Text= 'Swoj¹ drug¹ po³ówkê w dniu jego/jej urodzin zabra³byœ: ', Answers = [kolacja,film_w_domu,spotkanie_z_przyjaciolmi].
question(Text, Answers, moc) :- Text= 'Któr¹ z tych mocy byæ wybra³ gdybyœ móg³ ', Answers = [].
question(Text, Answers, postac_historyczna) :- Text= 'Czy posiadasz swoj¹ ulubion¹ postaæ historyczn¹, o której dyskutowa³eœ ze znajomym ', Answers = [tak,nie].


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
    pytaj([tramwaj,zajecia],gdzie).

czyta(czesto) :-
    pytaj([dom],gdzie).

lubi(fantastyka) :-
    pytaj([rpg],gry_komputerowe),
    (pytaj([tak],wyobraznia);
    pytaj([tak],zycie_pozaziemskie)),
    pytaj([przygodowe,basnie],filmy).
    
    
lubi(zagadki) :-
	pytaj([tak],zagadki),
	lubi_grac_w(przygodowe),
	pytaj([kryminalistyka],studia).
	
lubi(podroze) :-
	pytaj([tak],podroze),
	pytaj([gory],wakacje).
	
lubi(horrory) :-
	lubi_grac_w(horrory),
	typ(pesymista).
		
lubi(biografia) :-
	lubi(historia),
	pytaj([tak],postac_historyczna).


lubi(lekkie_pozycje) :-
    (pytaj([okazjonalnie,rzadko],jak_czesto);
    czyta(rzadko)),
    pytaj([impulsywny],jest),
    (pytaj([tak],podroze);
    pytaj([przygodowe,akcji,familijne],filmy)).
        
    
lubi(ciezkie_pozycje) :-
    (pytaj([codziennie],jak_czesto);
    czyta(czesto)),
    (pytaj([tak],wyobraznia);
    pytaj([psychologiczne,thrillery,dramaty],filmy)),
    pytaj([opanowany],jest).

lubi(naukowe) :-
    pytaj([informatyka,fizyka],studia),
    pytaj([tak],nauka),
    pytaj([tak],zycie_pozaziemskie).
% // TODO: dodaæ strategie

        	
lubi(romans) :-
    pytaj([kolacja,film_w_domu],urodziny_partnera),
    pytaj([rpg,przygodowe],gry_komputerowe),
    pytaj([introwertyk,melancholik],charakter),
    pytaj([pelna],szklanka).

lubi(historia) :-
    (pytaj([tak],postac_historyczna),
    pytaj([shootery,strategie],gry_komputerowe),
    pytaj([gory,zwiedzanie_zabytkow],wakacje));
    pytaj([tak],historia),
    pytaj([historia],studia).        

lubi(podroze) :-
    pytaj([tak],podroze).
	
typ(optymista) :-
	pytaj([pelna],szklanka).
	
typ(pesymista) :-
	pytaj([pusta],szklanka).
	
lubi_grac_w(X) :-
    pytaj([X],gry_komputerowe).
    

% Funkcje pomocnicze
pamietaj(X, Y) :-
    assertz(memory(X, Y)).
    
sprawdz([],_) :- false.    
sprawdz([X|Rest],Type) :- memory(Type,X);sprawdz(Rest,Type).

pytaj(Answer,Type) :-
	sprawdz(Answer,Type).
	
pytaj(Answer,Type) :-
	question(Question,Answers,Type),
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