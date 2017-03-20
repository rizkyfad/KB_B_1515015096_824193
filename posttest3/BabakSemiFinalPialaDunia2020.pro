 domains
%mk = mata kuliah, m = mahasiswa, p = poin
g,m=symbol
p=integer

predicates
nondeterm n_a(m,p)
nondeterm n_b(m,p)
nondeterm grup(g,m,m,m,m)
nondeterm nm_a(m,m,m,m,p,p,p,p)
nondeterm nm_b(m,m,m,m,p,p,p,p)
nondeterm poin(m,p,p,p)
nondeterm lolos_grup_a(m)
nondeterm lolos_grup_b(m)
nondeterm gugur_a(m)
nondeterm gugur_b(m)

clauses
%nama-nama grup
grup(a,malaysia,england,indonesia,brazil).
grup(b,argentina,spanyol,afrika,chile).

poin(malaysia,0,0,1).
poin(england,3,0,3).
poin(indonesia,3,3,3).
poin(brazil,1,0,0).

poin(argentina,3,1,3).
poin(spanyol,0,3,3).
poin(afrika,1,0,3).
poin(chile,0,0,0).

nm_a(malaysia,england,indonesia,brazil,1,6,9,2).
nm_b(argentina,spanyol,afrika,chile,7,6,4,0).

n_a(A,B):-nm_a(A,_,_,_,B,_,_,_);nm_a(_,A,_,_,_,B,_,_);
nm_a(_,_,A,_,_,_,B,_);nm_a(_,_,_,A,_,_,_,B).

n_b(A,B):-nm_b(A,_,_,_,B,_,_,_);nm_b(_,A,_,_,_,B,_,_);
nm_b(_,_,A,_,_,_,B,_);nm_b(_,_,_,A,_,_,_,B).

lolos_grup_a(A):-n_a(A,B),B=6;n_a(A,B),B=7;n_a(A,B),B=9.
gugur_a(A):-n_a(A,_),not(lolos_grup_a(A)).

lolos_grup_b(A):-n_b(A,B),B=6;n_b(A,B),B=7;n_b(A,B),B=9.
gugur_b(A):-n_b(A,_),not(lolos_grup_b(A)).


goal
write("Negara Negara yang ada di Grup A:"),nl,grup(a,Pososi1,Posisi2,Posisi3,Posisi4);
nl,write("Negara Negara yang ada di Grup B:"),nl,grup(b,Posisi1,Posisi2,Posisi3,Posisi4);
nl,write("Poin Grup A"),nl,write("Malaysia : "),poin(malaysia,Pertama,Kedua,Ketiga);
nl,write("England : "),poin(england,Pertama,Kedua,Ketiga);
nl,write("Indonesia : "),poin(indonesia,Pertama,Kedua,Ketiga);
nl,write("Brazil : "),poin(brazil,Pertama,Kedua,Ketiga);
nl,write("Poin Grup B"),nl,write("Argentina : "),poin(argentina,Pertama,Kedua,Ketiga);
nl,write("Spanyol : "),poin(spanyol,Pertama,Kedua,Ketiga);
nl,write("Afrika : "),poin(afrika,Pertama,Kedua,Ketiga);
nl,write("Chile : "),poin(chile,Pertama,Kedua,Ketiga);
nl,write("Negara yang Lolos Pada Grup A:"),nl,lolos_grup_a(Negara);
nl,write("Negara yang Lolos Pada Grup B:"),nl,lolos_grup_b(Negara);
nl,write("Negara yang gugur di grup A:"),nl,gugur_a(Negara);
nl,write("Negara yang gugur di grup b:"),nl,gugur_b(Negara).