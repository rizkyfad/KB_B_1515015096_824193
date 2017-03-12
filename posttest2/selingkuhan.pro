PREDICATES
nondeterm orang(symbol,symbol,symbol,symbol)
istri(symbol,symbol)
hubungan(symbol,symbol)
selingkuh(symbol)
nondeterm peselingkuh(symbol)
motif(symbol)
milik(symbol,symbol)
nondeterm cara_kerja_dengan(symbol,symbol)
nondeterm kemungkinan_milik(symbol,symbol)
nondeterm dicurigai(symbol)

CLAUSES
orang(jono,o,pria,coklat_langsat).
orang(tarjo,a,pria,putih).
orang(pakiem,a,wanita,coklat).
orang(tumini,ab,wanita,hitam).
orang(soleh,o,pria,coklat).
orang(budi,ab,pria,putih).
orang(inem,a,wanita,hitam).


istri(tumini,jono).
istri(inem,budi).

hubungan(tumini,tarjo).
hubungan(inem,budi).

selingkuh(tumini).
motif(selingkuh).

milik(jono,bunga).
milik(tarjo,coklat).

cara_kerja_dengan(coklat,diberi).

kemungkinan_milik(X,Benda):-
	milik(X,Benda).
	
dicurigai(X):-
	hubungan(tumini,Benda),
	cara_kerja_dengan(coklat,Benda),
	kemungkinan_milik(X,Benda).

dicurigai(X):-
	motif(selingkuh),
	orang(X,a,_,putih).
	
peselingkuh(Peselingkuh):-
	orang(Peselingkuh,_,_,_),
	dicurigai(Peselingkuh).
	
GOAL
peselingkuh(X).