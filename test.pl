:- dynamic([memory/2,what/3,how_s_list/1,how_p_list/1,how/3]).

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
polec(lekka_pozycja_fantasy,CF) :-
	wyczysc(liste_posrednich),
    lubi(fantastyka,CF_1),
    lubi(lekkie_pozycje,CF_2),
    pamietaj(polec,lekka_pozycja_fantasy,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2],[],[],95).

polec(ciezka_pozycja_fantasy,CF) :-
	wyczysc(liste_posrednich),
    lubi(fantastyka,CF_1),
    lubi(ciezkie_pozycje,CF_2),
    pamietaj(polec,ciezka_pozycja_fantasy,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2],[],[],95).

polec(popularnonaukowa,CF) :-
	wyczysc(liste_posrednich),
    lubi(naukowe,CF_1),
    lubi(ciezkie_pozycje,CF_2),
    pamietaj(polec,popularnonaukowa,hipoteza,oblicz_wspolczynnik(CF,[CF_1,CF_2],[],[],95)).
	
polec(romans,CF) :-
	wyczysc(liste_posrednich),
    lubi(romans,CF_1),
    lubi(lekkie_pozycje,CF_2),
    pamietaj(polec,romans,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2],[],[],90).
    
polec(ciezka_pozycja_historyczna,CF) :-
	wyczysc(liste_posrednich),
    lubi(historia,CF_1),
    lubi(ciezkie_pozycje,CF_2),
    pamietaj(polec,ciezka_pozycja_historyczna,hipoteza,oblicz_wspolczynnik(CF,[CF_1,CF_2],[],[],85)).

polec(lekka_pozycja_historyczna,CF) :-
	wyczysc(liste_posrednich),
    lubi(historia,CF_1),
    czyta(rzadko,CF_2),
    lubi(podroze,CF_3),
    pamietaj(polec,lekka_pozycja_historyczna,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2,CF_3],[],[],90).
    
polec(kryminal,CF) :-
	wyczysc(liste_posrednich),
	lubi(zagadki,CF_1),
	czyta(rzadko,CF_2),
	pamietaj(polec,kryminal,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2],[],[],85).
	
polec(ksiazka_przygodowa,CF) :-
	wyczysc(liste_posrednich),
	lubi(lekkie_pozycje,CF_1),
	lubi(podroze,CF_2),
	typ(optymista,CF_3),
	pamietaj(polec,ksiazka_przygodowa,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2,CF_3],[],[],95).
	
polec(horror,CF) :-
	wyczysc(liste_posrednich),
	lubi(horrory,CF_1),
	lubi(ciezkie_pozycje,CF_2),
	pamietaj(polec,horror,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2],[],[],70).
	
polec(biografia,CF) :-
	wyczysc(liste_posrednich),
	lubi(biografia,CF_1),
	lubi(ciezkie_pozycje,CF_2),
	pamietaj(polec,biografia,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2],[],[],80).

polec(science_fiction,CF) :-
	wyczysc(liste_posrednich),
	lubi(ciezkie_pozycje,CF_1),
	lubi(podroze,CF_2),
	lubi(naukowe,CF_3),
	pamietaj(polec,science_fiction,hipoteza),oblicz_wspolczynnik(CF,[CF_1,CF_2,CF_3],[],[],90).
	
    
% Fakty posrednie
czyta(rzadko,CF) :-
	wyczysc(liste_symptomow),
    pytaj([tramwaj,zajecia],gdzie),
    pamietaj(czyta,rzadko,posredni),CF=85.

czyta(czesto,CF) :-
	wyczysc(liste_symptomow),
    pytaj([dom],gdzie),
    pamietaj(czyta,czesto,posredni),CF=75.

lubi(fantastyka,CF) :-
	wyczysc(liste_symptomow),
    pytaj([rpg],gry_komputerowe),
    (pytaj([tak],wyobraznia);
    pytaj([tak],zycie_pozaziemskie)),
    pytaj([przygodowe,basnie],filmy),
    pamietaj(lubi,fantastyka,posredni),CF=85.
    
    
lubi(zagadki,CF) :-
	wyczysc(liste_symptomow),
	pytaj([tak],zagadki),
	pytaj([przygodowe],gry_komputerowe),
	pytaj([kryminalistyka],studia),
	pytaj([czytanie_w_myslach,niewidzialnosc,podroz_w_czasie],moc),
	pamietaj(lubi,zagadki,posredni),CF=80.
	
lubi(podroze,CF) :-
	wyczysc(liste_symptomow),
	pytaj([tak],podroze),
	pytaj([gory],wakacje),
	pytaj([latanie,podroz_w_czasie],moc),
	pamietaj(lubi,podroze,posredni),CF=90.
	
lubi(horrory,CF) :-
	wyczysc(liste_symptomow),
	pytaj([horrory],gry_komputerowe),
	typ(pesymista,CF_1),
	pamietaj(lubi,horrory,posredni),oblicz_wspolczynnik(CF,[100],[[typ,pesymista]],[CF_1],65).
		
lubi(biografia,CF) :-
	wyczysc(liste_symptomow),
	lubi(historia,CF_1),
	pytaj([tak],postac_historyczna),
	pamietaj(lubi,biografia,posredni),oblicz_wspolczynnik(CF,[100],[[lubi,historia]],[CF_1],65).


lubi(lekkie_pozycje,CF) :-
	wyczysc(liste_symptomow),
    (pytaj([okazjonalnie,rzadko],jak_czesto);
    czyta(rzadko,CF_1);
    pytaj([seriale],oglada)),
    pytaj([impulsywny],jest),
    (pytaj([tak],podroze); 
    pytaj([przygodowe,akcji,familijne],filmy)),
    pamietaj(lubi,lekkie_pozycje,posredni),oblicz_wspolczynnik(CF,[100],[[czyta,rzadko]],[CF_1],70).
        
    
lubi(ciezkie_pozycje,CF) :-
	wyczysc(liste_symptomow),
    (pytaj([codziennie],jak_czesto);
    czyta(czesto,CF_1);
    pytaj([filmy],oglada)),
    (pytaj([tak],wyobraznia);
    pytaj([psychologiczne,thrillery,dramaty],filmy)),
    pytaj([opanowany],jest),
    pamietaj(lubi,ciezkie_pozycje,posredni),oblicz_wspolczynnik(CF,[100],[[czyta,czesto]],[CF_1],65). 

lubi(naukowe,CF) :-
	wyczysc(liste_symptomow),
    pytaj([informatyka,fizyka],studia),
    pytaj([tak],nauka),
    pytaj([tak],zycie_pozaziemskie),
    pytaj([czytanie_w_myslach,niewidzialnosc,podroz_w_czasie],moc),
    pamietaj(lubi,naukowe,posredni),CF=95.  

        	
lubi(romans,CF) :-
	wyczysc(liste_symptomow),
    pytaj([kolacja,film_w_domu],urodziny_partnera),
    pytaj([rpg,przygodowe],gry_komputerowe),
    pytaj([introwertyk,melancholik],charakter),
    pytaj([pelna],szklanka),
    pytaj([daje_pieniadze,kupuje_mu_jedzenie],bezdomny),
    pamietaj(lubi,romans,posredni),CF=75.

lubi(historia,CF) :-
	wyczysc(liste_symptomow),
    (pytaj([tak],postac_historyczna),
    pytaj([shootery,strategie],gry_komputerowe),
    pytaj([gory,zwiedzanie_zabytkow],wakacje));
    pytaj([tak],historia),
    pytaj([historia],studia),
    pytaj([niewidzialnosc,podroz_w_czasie],moc),
    pamietaj(lubi,historia,posredni),CF=95.        

lubi(podroze,CF) :-
	wyczysc(liste_symptomow), 
    pytaj([tak],podroze),
    pamietaj(lubi,podroze,posredni).CF=95.
	
typ(optymista,CF) :-
	wyczysc(liste_symptomow),
	pytaj([pelna],szklanka),
	pamietaj(typ,optymista,posredni),CF=70.
	
typ(pesymista,CF) :-
	wyczysc(liste_symptomow),
	pytaj([pusta],szklanka),
	pamietaj(typ,pesymista,posredni),CF=70.
	
    

% Funkcje pomocnicze    
dodaj_dodatkowe(Probabilities,[],[],Result) :- Result=Probabilities.

dodaj_dodatkowe(Probabilities,[H1|T1],[H2|T2],Result) :- 
	[Memory1,Memory2] = H1,  
	what(posredni,Memory1,Memory2),
	append(Probabilities,[H2],New_Probabilities),
	dodaj_dodatkowe(New_Probabilities,T1,T2,Result).
	
dodaj_dodatkowe(Probabilities,[_|T1],[_|T2],Result) :- 
	dodaj_dodatkowe(Probabilities,T1,T2,Result).

oblicz_wspolczynnik(Result_CF,Probabilities,Additional_Facts,Additional_Probabilities,CF) :-
	dodaj_dodatkowe(Probabilities,Additional_Facts,Additional_Probabilities,Result),
	min_list(Result,Min),
	Tmp_result is Min*CF,
	Result_CF is Tmp_result/100.

pamietaj(X, Y, symptom) :-
	what(symptom,X,Y).
	
pamietaj(X, Y, symptom) :-
    %write(X),write(' -> '),write(Y),write(' : '),write(LIST),nl,
    not(what(symptom,X,Y)),
    assertz(memory(X, Y)),
    assertz(what(symptom,X,Y)),
    how_s_list(S),
    append(S,[[X,Y]],NS),
    retractall(how_s_list(_)),
    assertz(how_s_list(NS)).   
   
pamietaj(X, Y, posredni) :-
	 what(posredni,X,Y). 
	 
pamietaj(X, Y, posredni) :-
	not(what(posredni,X,Y)),
    assertz(what(posredni,X,Y)),
    how_s_list(S),
    assertz(how(posredni,[X,Y],S)),
    how_p_list(P),
    append(P,[[X,Y]],NP),
    retractall(how_p_list(_)),
    assertz(how_p_list(NP)).
   
pamietaj(X, Y, hipoteza) :-
    what(hipoteza,X,Y). 
    
pamietaj(X, Y, hipoteza) :-
    not(what(hipoteza,X,Y)),
    assertz(what(hipoteza,X,Y)),
    how_p_list(S),
    assertz(how(hipoteza,[X,Y],S)).
   
sprawdz([],_) :- false.    
sprawdz([X|Rest],Type) :- memory(Type,X);sprawdz(Rest,Type).

pobierz([X|_],Type,Y) :-
	memory(Type,X),
	Y=X.

pobierz([_|Rest],Type,Y) :-
	pobierz(Rest,Type,Y).

pytaj(Answer,Type) :-
	sprawdz(Answer,Type),
	pobierz(Answer,Type,Y),
	how_s_list(S), 
    append(S,[[Type,Y]],NS),
    retractall(how_s_list(_)),
    assertz(how_s_list(NS)).

pytaj(Answer,Type) :-
	question(Question,Answers,Type),
	(not(sprawdz(Answers, Type)),
	uzyskaj_poprawna_odpowiedz(Question,Answers,Reply),
	pamietaj(Type,Reply,symptom),
	member(Reply, Answer)).
			
uzyskaj_poprawna_odpowiedz(Question,Answers,Reply):-
	repeat,
	write(Question),write(Answers),write('?: '),nl,
	readln([Reply]),
	what(Reply),
	why(Reply),
	how(Reply),
	(member(Reply,Answers)),!.

how(how) :-
	nl,write('How question: '),nl,
	write('Znane symptomy: '),nl,
	wypisz_dane(symptom).
	
how(how) :-
	nl,write('Fakty posrednie: '),nl,
	wypisz_dane_dla_how(posredni).
	
how(how) :-
	nl,write('Hipotezy: '),nl,
	wypisz_dane_dla_how(hipoteza).

how(_) :- true. 

wypisz_element([X|Y]) :-
	write(X),write(' '),write(Y),nl.


what(what) :-
	nl,write('What question: '),nl,
	write('Znane symptomy: '),nl,
	wypisz_dane(symptom).
	
what(what) :-
	nl,write('Znane fakty posrednie: '),nl,
	wypisz_dane(posredni). 
	
what(what) :-
	nl,write('Znane hipotezy: '),nl, 
	wypisz_dane(hipoteza). 

what(_) :- true.

wypisz_dane(Typ) :-
	what(Typ,A,B), 
	write(A),write(' '),write(B),nl.
	
wypisz_dane_dla_how(Typ) :-
	how(Typ,A,B),
	wypisz_dwuelementowa_liste(A),
	wypisz_liste_dwuel_list(B). 

wypisz_liste_dwuel_list([]) :- true.	

wypisz_liste_dwuel_list([H|T]) :-
	write(' - '),wypisz_dwuelementowa_liste(H),
	wypisz_liste_dwuel_list(T).
	
wypisz_dwuelementowa_liste([H,T]) :-
	write(H),write(' '),write(T),nl.
	
wyczysc(liste_posrednich) :-
	retractall(how_p_list(_)),
	assertz(how_p_list([])).
	
wyczysc(liste_symptomow) :-
	retractall(how_s_list(_)),
	assertz(how_s_list([])). 

why(why) :-
	get_prolog_backtrace(16,B),
	remove_n_first_elems(4,New,B), 
	remove_n_last_elems(1,Final,New), 
	print_backtrace(Final).

why(_) :- true.
	
print_backtrace([]) :- true.

print_backtrace([H|T]) :-
	print_stack_function(H),nl,
	print_backtrace(T).
	
print_stack_function(frame(_,_,Name)) :-  
	listing(Name).
	

remove_n_first_elems(N,New_list,List) :-
	length(X, N), append(X, New_list, List).
	
remove_n_last_elems(N,New_list,List) :-
	length(X, N), append(New_list, X, List). 

% Czyszczenie zapisanych danych
wyczysc_fakty :-
    write('Nacisnij enter aby zakonczyc'),
    retractall(memory(_,_)),
    retractall(what(_,_,_)),
    retractall(how(_,_,_)),
    retractall(how_s_list(_)),
    retractall(how_p_list(_)),
    readln(_).
    
init() :-
	assertz(how_s_list([])),
	assertz(how_p_list([])).
    
% G³ówna funkcja
wykonaj_ksiazki :-
	init(),
    polec(X,CF),!,write('Polecam Ci '), write(X),write(' .Wspolczynnik niepwenosci: '),write(CF),nl, wyczysc_fakty.
    
wykonaj_ksiazki :-
    write('Nie znalazlem dopasowania'),nl,
    wyczysc_fakty.