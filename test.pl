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
question(Text, Answers, oglada) :- Text= 'Wolisz ogl¹daæ ', Answers = [seriale,filmy].
question(Text, Answers, bezdomny) :- Text= 'Widzisz na ulicy bezdomnego zbieraj¹cego na jedzenie. Co robisz: ', Answers = [przechodze_dalej,daje_pieniadze,kupuje_mu_jedzenie].
question(Text, Answers, studia) :- Text= 'Który kierunek studiów by³by dla Ciebie najbardziej interesuj¹cy ', Answers = [informatyka,fizyka,historia,prawo,kryminalistyka].
question(Text, Answers, urodziny_partnera) :- Text= 'Swoj¹ drug¹ po³ówkê w dniu jego/jej urodzin zabra³byœ: ', Answers = [kolacja,film_w_domu,spotkanie_z_przyjaciolmi].
question(Text, Answers, moc) :- Text= 'Któr¹ z tych mocy byæ wybra³ gdybyœ móg³ ', Answers = [latanie,czytanie_w_myslach,niewidzialnosc,supersila,podroz_w_czasie].
question(Text, Answers, postac_historyczna) :- Text= 'Czy posiadasz swoj¹ ulubion¹ postaæ historyczn¹, o której dyskutowa³eœ ze znajomym ', Answers = [tak,nie].


% Hipotezy
polec(lekka_pozycja_fantasy) :-
    lubi(fantastyka, [polec(lekka_pozycja_fantasy)],Stack1),
%    nl,nl,write('FANTASTYKA OK:  '),write(Stack1),nl,nl,
    lubi(lekkie_pozycje, [polec(lekka_pozycja_fantasy)],Stack2),
%    nl,nl,write('FANTASTYKA OK:  '),write(Stack2),nl,nl,
    pamietaj(polec,lekka_pozycja_fantasy,ResultStack).

polec(ciezka_pozycja_fantasy) :-
    lubi(fantastyka,[polec(ciezka_pozycja_fantasy)],Stack1),
    lubi(ciezkie_pozycje,[polec(ciezka_pozycja_fantasy)],Stack2),
    pamietaj(polec,ciezka_pozycja_fantasy,ResultStack).

polec(popularnonaukowa) :-
    lubi(naukowe,[polec(popularnonaukowa)],Stack1),
    lubi(ciezkie_pozycje,[polec(popularnonaukowa)],Stack2),
    pamietaj(polec,popularnonaukowa,ResultStack).
	
polec(romans) :-
    lubi(romans,[polec(romans)],Stack1),
    lubi(lekkie_pozycje,[polec(romans)],Stack2),
    pamietaj(polec,romans,ResultStack).
    
polec(ciezka_pozycja_historyczna) :-
    lubi(historia,[polec(ciezka_pozycja_historyczna)],Stack1),
    lubi(ciezkie_pozycje,[polec(ciezka_pozycja_historyczna)],Stack2),
    pamietaj(polec,ciezka_pozycja_historyczna,ResultStack).

polec(lekka_pozycja_historyczna) :-
    lubi(historia,[polec(lekka_pozycja_historyczna)],Stack1),
    czyta(rzadko,[polec(lekka_pozycja_historyczna)],Stack2),
    lubi(podroze,[polec(lekka_pozycja_historyczna)],Stack3),
    pamietaj(polec,lekka_pozycja_historyczna,ResultStack).
    
polec(kryminal) :-
	lubi(zagadki,[polec(kryminal)],Stack1),
	czyta(rzadko,[polec(kryminal)],Stack2),
	pamietaj(polec,kryminal,ResultStack).
	
polec(ksiazka_przygodowa) :-
	lubi(lekkie_pozycje,[polec(ksiazka_przygodowa)],Stack1),
	lubi(podroze,[polec(ksiazka_przygodowa)],Stack2),
	typ(optymista,[polec(ksiazka_przygodowa)],Stack3),
	pamietaj(polec,ksiazka_przygodowa,ResultStack).
	
polec(horror) :-
	lubi(horrory,[polec(horror)],Stack1),
	lubi(ciezkie_pozycje,[polec(horror)],Stack2),
	pamietaj(polec,horror,ResultStack).
	
polec(biografia) :-
	lubi(biografia,[polec(biografia)],Stack1),
	lubi(ciezkie_pozycje,[polec(biografia)],Stack2),
	pamietaj(polec,biografia,ResultStack).

polec(science_fiction) :-
	lubi(ciezkie_pozycje,[polec(science_fiction)],Stack1),
	lubi(podroze,[polec(science_fiction)],Stack2),
	lubi(naukowe,[polec(science_fiction)],Stack3),
	pamietaj(polec,science_fiction,ResultStack).
	
    
% Fakty posrednie
czyta(rzadko,InitialStack,ResultStack) :-
    append(InitialStack,[czyta(rzadko)],Stack),
    pytaj([tramwaj,zajecia],gdzie,Stack,ResultStack),
    pamietaj(czyta,rzadko,ResultStack).

czyta(czesto,InitialStack,ResultStack) :-
    append(InitialStack,[czyta(czesto)],Stack),
    pytaj([dom],gdzie,Stack,ResultStack),
    pamietaj(czyta,czesto,ResultStack).

lubi(fantastyka,InitialStack,ResultStack) :-
    append(InitialStack,[lubi(fantastyka)],Stack),
    pytaj([rpg],gry_komputerowe,Stack,Stack1),
    (pytaj([tak],wyobraznia,Stack1,Stack2);
    pytaj([tak],zycie_pozaziemskie,Stack1,Stack2)),
    pytaj([przygodowe,basnie],filmy,Stack2,ResultStack),
    pamietaj(lubi,fantastyka,ResultStack).
    
    
lubi(zagadki,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(zagadki)],Stack),
	pytaj([tak],zagadki,Stack,Stack1),
	lubi_grac_w(przygodowe,Stack1,Stack2),
	pytaj([kryminalistyka],studia,Stack2,Stack3),
	pytaj([czytanie_w_myslach,niewidzialnosc,podroz_w_czasie],moc,Stack3,ResultStack),
	pamietaj(lubi,zagadki,ResultStack).
	
lubi(podroze,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(podroze)],Stack),
	pytaj([tak],podroze,Stack,Stack1),
	pytaj([gory],wakacje,Stack1,Stack2),
	pytaj([latanie,podroz_w_czasie],moc,Stack2,ResultStack),
	pamietaj(lubi,podroze,ResultStack).
	
lubi(horrory,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(horrory)],Stack),
	lubi_grac_w(horrory,Stack,Stack1),
	typ(pesymista,Stack1,ResultStack),
	pamietaj(lubi,horrory,ResultStack).
		
lubi(biografia,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(biografia)],Stack),
	lubi(historia,Stack,Stack1),
	pytaj([tak],postac_historyczna,Stack1,ResultStack),
	pamietaj(lubi,biografia,ResultStack).


lubi(lekkie_pozycje,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(lekkie_pozycje)],Stack),
    (pytaj([okazjonalnie,rzadko],jak_czesto,Stack,Stack1);
    czyta(rzadko,Stack,Stack1);
    pytaj([seriale],oglada,Stack,Stack1)),
    pytaj([impulsywny],jest,Stack1,Stack2),
    (pytaj([tak],podroze,Stack2,ResultStack);
    pytaj([przygodowe,akcji,familijne],filmy,Stack2,ResultStack)),
    pamietaj(lubi,lekkie_pozycje,ResultStack).
        
    
lubi(ciezkie_pozycje,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(ciezkie_pozycje)],Stack),
    (pytaj([codziennie],jak_czesto,Stack,Stack1);
    czyta(czesto,Stack,Stack1);
    pytaj([filmy],oglada,Stack,Stack1)),
    (pytaj([tak],wyobraznia,Stack1,Stack2);
    pytaj([psychologiczne,thrillery,dramaty],filmy,Stack1,Stack2)),
    pytaj([opanowany],jest,Stack2,ResultStack),
    pamietaj(lubi,ciezkie_pozycje,ResultStack).

lubi(naukowe,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(naukowe)],Stack),
    pytaj([informatyka,fizyka],studia,Stack,Stack1),
    pytaj([tak],nauka,Stack1,Stack2),
    pytaj([tak],zycie_pozaziemskie,Stack2,Stack3),
    pytaj([czytanie_w_myslach,niewidzialnosc,podroz_w_czasie],moc,Stack3,ResultStack),
    pamietaj(lubi,naukowe,ResultStack).

        	
lubi(romans,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(romans)],Stack),
    pytaj([kolacja,film_w_domu],urodziny_partnera,Stack,Stack1),
    pytaj([rpg,przygodowe],gry_komputerowe,Stack1,Stack2),
    pytaj([introwertyk,melancholik],charakter,Stack2,Stack3),
    pytaj([pelna],szklanka,Stack3,Stack4),
    pytaj([daje_pieniadze,kupuje_mu_jedzenie],bezdomny,Stack4,ResultStack),
    pamietaj(lubi,romans,ResultStack).

lubi(historia,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(historia)],Stack),
    (pytaj([tak],postac_historyczna,Stack,Stack1),
    pytaj([shootery,strategie],gry_komputerowe,Stack1,Stack2),
    pytaj([gory,zwiedzanie_zabytkow],wakacje,Stack2,Stack3));
%przekminiæ rozwi¹zanie
    pytaj([tak],historia,Stack,Stack1),
    pytaj([historia],studia,Stack1,Stack2),
    pytaj([niewidzialnosc,podroz_w_czasie],moc,Stack2,ResultStack),
    pamietaj(lubi,historia,ResultStack).        

lubi(podroze,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(podroze)],Stack),
    pytaj([tak],podroze,Stack,ResultStack),
    pamietaj(lubi,podroze,ResultStack).
	
typ(optymista,InitialStack,ResultStack) :-
	append(InitialStack,[typ(optymista)],Stack),
	pytaj([pelna],szklanka,Stack,ResultStack),
	pamietaj(typ,optymista,ResultStack).
	
typ(pesymista,InitialStack,ResultStack) :-
	append(InitialStack,[typ(pesymista)],Stack),
	pytaj([pusta],szklanka,Stack,ResultStack),
	pamietaj(typ,pesymista,ResultStack).
	
lubi_grac_w(X,InitialStack,ResultStack) :-
	append(InitialStack,[lubi(biografia)],Stack),
    pytaj([X],gry_komputerowe,Stack,ResultStack).
    

% Funkcje pomocnicze    
pamietaj(X, Y, LIST) :-
    write(X),write(' -> '),write(Y),write(' : '),write(LIST),nl,
    assertz(memory(X, Y)).
        
    
sprawdz([],_) :- false.    
sprawdz([X|Rest],Type) :- memory(Type,X);sprawdz(Rest,Type).

pytaj(Answer,Type,Stack,NewStack) :-
	sprawdz(Answer,Type).

pytaj(Answer,Type, Stack, NewStack) :-
	question(Question,Answers,Type),
	(not(sprawdz(Answers, Type)),
	uzyskaj_poprawna_odpowiedz(Question,Answers,Reply,Stack),
	pamietaj(Type,Reply,Stack),
	member(Reply, Answer)),
	append(Stack,[[Question , Reply]],NewStack).
			
uzyskaj_poprawna_odpowiedz(Question,Answers,Reply,Stack):-
	repeat,
	write(Question),write(Answers),write('?: '),nl,
	readln([Reply]),
	what(Reply),
	why(Reply,Stack),
	(member(Reply,Answers)),!.

what(what) :-
	write('What question: '),nl,
	memory(A,B),
	write(A),write(' '),write(B),nl.

what(_) :- true.

why(why,Stack) :-
	nl,write('Rules: '),nl,
	write(Stack),
	nl,nl.

why(_,_) :- true.

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