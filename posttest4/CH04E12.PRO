/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains                                                  %Domains digunakan untuk memberikan nama pada parameter
  name,sex,occupation,object,vice,substance = symbol     %baris pertama ini menggunak tipe data symbol
  age=integer						 %umur menggunakan tipe data integer

predicates						 %predikat berguna untuk mendeklarasikan relasi yang akan kita buat
  nondeterm person(name,age,sex,occupation) 		 %relasi dari orang yaitu nama,umur, jender dan pekerjaan
  nondeterm had_affair(name,name)			 %relasi dari orang yaitu nama,umur, jender dan pekerjaan
  	killed_with(name,object)			 %relasi dari terbunuh dengan yaitu nama dengan benda apa
  	killed(name) 					 %relasi dari tebunuh yaitu nama
  nondeterm killer(name)				 %relasi dari predikat pembunuh yaitu parameter nama
  	motive(vice)					 %relasi dari predikat motif adalah parameter alasan
  	smeared_in(name,substance)			 %relasi dari predikat ternodai yaitu dengan parameter nama dan zat
  	owns(name,object)				 %relasi dari predikat milik yaitu parameter nama dan benda
  nondeterm operates_identically(object,object)		 %relasi dari predikat cara  kerjanya mirip yaitubenda danbenda
  nondeterm owns_probably(name,object)			 %relasi dari predikat kemungkinan milik yaitu parameter nama dan benda
  nondeterm suspect(name)				 %relasi dari predikat dicurigai yaitu parameternama

/* * * Facts about the murder * * */
clauses							 %clauses berisi fakta
  person(bert,55,m,carpenter).				 %bert seorang tukang kayu yang berumur 55 dengan bejender m
  person(allan,25,m,football_player).			 %allan seorang pemain sepak bola yang berumur 25 dengan bejender m
  person(allan,25,m,butcher).				 %allan seorang tukang daging yang berumur 25 dengan bejender m
  person(john,25,m,pickpocket).				 %jhon seorang pencopet yang berumur 25 dengan bejender m

  had_affair(barbara,john). 				 %barbara berselingkuh dengan jhon
  had_affair(barbara,bert). 				 %barbara berselingkuh dengan bert
  had_affair(susan,john). 				 %susan berselingkuh dengan jhon

  killed_with(susan,club).   				 %susan terbunuh dengan tongkat pemukul
  killed(susan).	     				 %susan terbunuh

  motive(money).					 %motif dari pembunuhan tersebut yaitu uang
  motive(jealousy).					 %motif dari pembunuhan tersebut yaitu cemburu
  motive(righteousness).				 %motif dari pembunuhan tersebut yaitu dendam

  smeared_in(bert,blood).				 %bert ternodai dengan darah
  smeared_in(susan,blood).				 %susan ternodai dengan darah
  smeared_in(allan,mud).				 %allan ternodai dengan lumpur
  smeared_in(john,chocolate).				 %jhon ternodai dengan coklat
  smeared_in(barbara,chocolate).			 %barbara ternodai dengan coklat

  owns(bert,wooden_leg).				 %bert milik kaki palsu
  owns(john,pistol).					 %john milik kaki pistol

/* * * Background knowledge * * */

  operates_identically(wooden_leg, club).		  %cara kerja kaki palsu mirip dengan tongkat pemukul
  operates_identically(bar, club).			  %cara kerja balok mirip dengan tongkat pemukul
  operates_identically(pair_of_scissors, knife).	  %cara kerja gunting mirip dengan pisau
  operates_identically(football_boot, club).		  %cara kerja sepatu bola mirip dengan tongat pemukul

  owns_probably(X,football_boot):-			  %kemungkinan sepatu bola milik X jika maka
	person(X,_,_,football_player).			  %X dan orang lainnya pemain sepakbola
  owns_probably(X,pair_of_scissors):-			  %kemungkinan gunting milik X jika maka
	person(X,_,_,hairdresser).			  %X dan orang lainnya adalah pekerja salon
  owns_probably(X,Object):-				  %kemungkinan benda milik X jika maka
	owns(X,Object).					  %X memiliki benda itu

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-						 %X dicurigai jika maka
	killed_with(susan,Weapon) ,			 %Siti terbunuh dengan senjata dan
	operates_identically(Object,Weapon) ,		 %Cara kerja benda tersebut mirip dengan senjata dan
	owns_probably(X,Object).			 %Kemungkinan X memiliki benda 

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-						 %X dicurigai jika maka
	motive(jealousy),				 %cemburu adalah motifnya dan
	person(X,_,m,_),				 %X adalah orang tersebut yang berjender m dan
	had_affair(susan,X).				 %susan selingkuh dengan X

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-						 %X dicurigai jika maka
	motive(jealousy),				 %cemburu adalah motifnya dan
	person(X,_,f,_),				 %X adalah orang tersebut yang berjender f dan
	had_affair(X,Man),				 %Laki - laki tersebut selingkuh dengan X dan
	had_affair(susan,Man).				 %Susan selingkuh dengan laki-laki

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-						  %X dicurigai jika maka 
	motive(money),					  %motifnya adalah uang dan
	person(X,_,_,pickpocket).			  %X adalah seorang pencopet

  killer(Killer):-					  %pembunuh tersebut dikatakan pembunuh jika maka
	person(Killer,_,_,_),				  %orang tersebut adalah pembunuh dan orang lainnya dan
	killed(Killed),					  %jika orang tersebut terbunuh dan
	Killed <> Killer, /* It is not a suicide */	  %relasi dari terbunuh adalah pembunuh dan
	suspect(Killer),				  %pembunuh tersebut dicurigai dan
	smeared_in(Killer,Goo),				  %pembunuh ternodai oleh zat dan
	smeared_in(Killed,Goo).				  %yang terbunuh ternodai oleh zat

goal   							  %Goal adalah jawaban yang berisi pernyataan dan pertanyaan
  killer(X).						  %Jawaban dari pembunuh tersebut adalah bert
 							  %karena pembunuh yang ternodai zat adalah bert. 
	   						  %Yang terdapat di rule ada dua yaitu susan dan bert yang ternodai dengan zat yaitu darah
 							  %karena di goal yang ditanyakan adalah pembunuh maka jawabannya bert
 							  %sebab susan adalah orang yang terbunuh  

