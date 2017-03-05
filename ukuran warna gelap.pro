predicates %merupakan section dalam program yang berfungsi untuk mendeklarasikan tipe suatu data, misal string, integer, dll.
nondeterm %suatu predikat yang memiliki lebih dari satu jawaban atau solusi 
ukuran (symbol,symbol)
nondeterm %suatu predikat yang memiliki lebih dari satu jawaban atau solusi
warna (symbol,symbol)
nondeterm %suatu predikat yang memiliki lebih dari satu jawaban atau solusi
gelap (symbol)

clauses %adalah merupakan section program tempat dimana semua data yang berupa fakta yang ada kita deklarasikan
ukuran(beruang,besar). %beruang memiliki ukuran besar
ukuran(gajah,besar).
warna(beruang,coklat).%beruang mempunyai warna coklat
warna(kucing,hitam).
warna(gajah,kelabu).
gelap(Z):- %variable Z memiliki warna gelap
warna(Z,hitam).
gelap(Z):-
warna(Z,coklat).

goal %merupakan section yang digunakan untuk mencetak hasil output yang dicari.
gelap(Z),
ukuran(Z,besar).%variabel z memiliki warna gelap dan ukuran besar