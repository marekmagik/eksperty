:- dynamic([memory/2]).

% Pytania
question(Text, Answers, jak_czesto) :- Text= 'Jak cz�sto czytasz ksi��ki ', Answers = [codziennie,okazjonalnie,rzadko].
question(Text, Answers, gdzie) :- Text= 'Gdzie zazwyczaj czytasz ksi��ki ', Answers = [dom,tramwaj,zajecia].
question(Text, Answers, jest) :- Text= 'Kt�ry przymiotnik lepiej Ci� opisuje ', Answers = [opanowany,impulsywny].
question(Text, Answers, wyobraznia) :- Text= 'Uwa�asz, �e rozwini�ta wyobra�nia jest istotna w �yciu codziennym ', Answers = [tak,nie].
question(Text, Answers, podroze) :- Text= 'Czy lubisz podr�e i odkrywanie nowych miejsc ', Answers = [tak,nie].
question(Text, Answers, szklanka) :- Text= 'Szklanka jest do po�owy �. ', Answers = [pelna,pusta].
question(Text, Answers, historia) :- Text= 'Czy interesujesz si� faktami i zdarzeniami historycznymi ', Answers = [tak,nie].
question(Text, Answers, zycie_pozaziemskie) :- Text= 'Czy wierzysz, �e poza Ziemi� istnieje �ycie ', Answers = [tak,nie].
question(Text, Answers, charakter) :- Text= 'Kt�re okre�lenie najlepiej do Ciebie pasuje ', Answers = [introwertyk,ekstrawertyk,melancholik].
question(Text, Answers, nauka) :- Text= 'Czy interesujesz si� odkryciami naukowymi i zdobywaniem wiedzy ', Answers = [tak,nie].
question(Text, Answers, gry_komputerowe) :- Text= 'W jakie gry komputerowe najczesciej grasz ', Answers = [shootery,rpg,strategie,przygodowe,horrory].
question(Text, Answers, zagadki) :- Text= 'Czy interesujesz si� intrygami i �amig��wkami ', Answers = [tak,nie].
question(Text, Answers, filmy) :- Text= 'Jakie filmy cz�ciej ogl�dasz w kinie ', Answers = [akcji,familijne,psychologiczne,przygodowe,basnie,thrillery,dramaty].
question(Text, Answers, wakacje) :- Text= 'Na wakacje najch�tniej pojecha�by�: ', Answers = [gory,morze,zwiedzanie_zabytkow,kamping].
question(Text, Answers, oglada) :- Text= 'Wolisz ogl�da� ', Answers = [seriale,filmy].
question(Text, Answers, bezdomny) :- Text= 'Widzisz na ulicy bezdomnego zbieraj�cego na jedzenie. Co robisz: ', Answers = [przechodze_dalej,daje_pieniadze,kupuje_mu_jedzenie].
question(Text, Answers, studia) :- Text= 'Kt�ry kierunek studi�w by�by dla Ciebie najbardziej interesuj�cy ', Answers = [informatyka,fizyka,historia,prawo,kryminalistyka].
question(Text, Answers, urodziny_partnera) :- Text= 'Swoj� drug� po��wk� w dniu jego/jej urodzin zabra�by�: ', Answers = [kolacja,film_w_domu,spotkanie_z_przyjaciolmi].
question(Text, Answers, moc) :- Text= 'Kt�r� z tych mocy by� wybra� gdyby� m�g� ', Answers = [latanie,czytanie_w_myslach,niewidzialnosc,supersila,podroz_w_czasie].
question(Text, Answers, postac_historyczna) :- Text= 'Czy posiadasz swoj� ulubion� posta� historyczn�, o kt�rej dyskutowa�e� ze znajomym ', Answers = [tak,nie].


% Hipotezy
polec(lekka_pozycja_fantasy) :-
    lubi(fantastyka),
    lubi(lekkie_pozycje),
    pamietaj(polec,lekka_pozycja_fantasy).

polec(ciezka_pozycja_fantasy) :-
    lubi(fantastyka),
    lubi(ciezkie_pozycje),
    pamietaj(polec,ciezka_pozycja_fantasy).

polec(popularnonaukowa) :-
    lubi(naukowe),
    lubi(ciezkie_pozycje),
    pamietaj(polec,popularnonaukowa).
	
polec(romans) :-
    lubi(romans),
    lubi(lekkie_pozycje),
    pamietaj(polec,romans).
    
polec(ciezka_pozycja_historyczna) :-
    lubi(historia),
    lubi(ciezkie_pozycje),
    pamietaj(polec,ciezka_pozycja_historyczna).

polec(lekka_pozycja_historyczna) :-
    lubi(historia),
    czyta(rzadko),
    lubi(podroze),
    pamietaj(polec,lekka_pozycja_historyczna).
    
polec(kryminal) :-
	lubi(zagadki),
	czyta(rzadko),
	pamietaj(polec,kryminal).
	
polec(ksiazka_przygodowa) :-
	lubi(lekkie_pozycje),
	lubi(podroze),
	typ(optymista),
	pamietaj(polec,ksiazka_przygodowa).
	
polec(horror) :-
	lubi(horrory),
	lubi(ciezkie_pozycje),
	pamietaj(polec,horror).
	
polec(biografia) :-
	lubi(biografia),
	lubi(ciezkie_pozycje),
	pamietaj(polec,biografia).

polec(science_fiction) :-
	lubi(ciezkie_pozycje),
	lubi(podroze),
	lubi(naukowe),
	pamietaj(polec,science_fiction).
	
    
% Fakty posrednie
czyta(rzadko) :-
    pytaj([tramwaj,zajecia],gdzie),
    pamietaj(czyta,rzadko).

czyta(czesto) :-
    pytaj([dom],gdzie),
    pamietaj(czyta,czesto).

lubi(fantastyka) :-
    pytaj([rpg],gry_komputerowe),
    (pytaj([tak],wyobraznia);
    pytaj([tak],zycie_pozaziemskie)),
    pytaj([przygodowe,basnie],filmy),
    pamietaj(lubi,fantastyka).
    
    
lubi(zagadki) :-
	pytaj([tak],zagadki),
	lubi_grac_w(przygodowe),
	pytaj([kryminalistyka],studia),
	pytaj([czytanie_w_myslach,niewidzialnosc,podroz_w_czasie],moc),
	pamietaj(lubi,zagadki).
	
lubi(podroze) :-
	pytaj([tak],podroze),
	pytaj([gory],wakacje),
	pytaj([latanie,podroz_w_czasie],moc),
	pamietaj(lubi,podroze).
	
lubi(horrory) :-
	lubi_grac_w(horrory),
	typ(pesymista),
	pamietaj(lubi,horrory).
		
lubi(biografia) :-
	lubi(historia),
	pytaj([tak],postac_historyczna),
	pamietaj(lubi,biografia).


lubi(lekkie_pozycje) :-
    (pytaj([okazjonalnie,rzadko],jak_czesto);
    czyta(rzadko);
    pytaj([seriale],oglada)),
    pytaj([impulsywny],jest),
    (pytaj([tak],podroze);
    pytaj([przygodowe,akcji,familijne],filmy)),
    pamietaj(lubi,lekkie_pozycje).
        
    
lubi(ciezkie_pozycje) :-
    (pytaj([codziennie],jak_czesto);
    czyta(czesto);
    pytaj([filmy],oglada)),
    (pytaj([tak],wyobraznia);
    pytaj([psychologiczne,thrillery,dramaty],filmy)),
    pytaj([opanowany],jest),
    pamietaj(lubi,ciezkie_pozycje).

lubi(naukowe) :-
    pytaj([informatyka,fizyka],studia),
    pytaj([tak],nauka),
    pytaj([tak],zycie_pozaziemskie),
    pytaj([czytanie_w_myslach,niewidzialnosc,podroz_w_czasie],moc),
    pamietaj(lubi,naukowe).

        	
lubi(romans) :-
    pytaj([kolacja,film_w_domu],urodziny_partnera),
    pytaj([rpg,przygodowe],gry_komputerowe),
    pytaj([introwertyk,melancholik],charakter),
    pytaj([pelna],szklanka),
    pytaj([daje_pieniadze,kupuje_mu_jedzenie],bezdomny),
    pamietaj(lubi,romans).

lubi(historia) :-
    (pytaj([tak],postac_historyczna),
    pytaj([shootery,strategie],gry_komputerowe),
    pytaj([gory,zwiedzanie_zabytkow],wakacje));
    pytaj([tak],historia),
    pytaj([historia],studia),
    pytaj([niewidzialnosc,podroz_w_czasie],moc),
    pamietaj(lubi,historia).        

lubi(podroze) :-
    pytaj([tak],podroze),
    pamietaj(lubi,podroze).
	
typ(optymista) :-
	pytaj([pelna],szklanka),
	pamietaj(typ,optymista).
	
typ(pesymista) :-
	pytaj([pusta],szklanka),
	pamietaj(typ,pesymista).
	
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
	what(Reply),
	(member(Reply,Answers)),!.

what(what) :-
	write('What question: '),nl,
	memory(A,B),
	write(A),write(' '),write(B),nl.

what(_) :- true.

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