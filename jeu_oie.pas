PROGRAM oie;

//BUT: Jeu de l'oie
//PRINCIPE : Parcour de l'oie de cases en cases
//ENTREE : l'accord du joueur pour lancer le dé
//SORTIE : l'emplacement de l'oie

uses crt;

const
dead = 58;
win_case = 66;
twice_every_x_case = 9;

var
dice,pos		:INTEGER;

BEGIN
	clrscr;
	pos := 0;
	while (pos <> win_case) do
	begin
		repeat
			writeln('Entrez le resultat du jet de des (entre 2 et 12)');
			readln(dice);
		until ((dice >= 2) AND (dice <= 12));
		pos := pos + dice;
		if (((pos MOD twice_every_x_case) = 0) AND (pos < 63)) then
		begin
			writeln('Vous etes a la case ', pos, ' qui est une case double');		
			pos := pos + dice;
		end
		else if (pos = dead) then
		begin
			writeln('Vous etes sur la case ',pos,' qui est mortelle, vous retournez a la case depart');
			pos := 0;
		end
		else if (pos > win_case) then
		begin
			writeln('Vous etes sur la derniere case mais il vous reste du deplacement, vous reculez de ', pos - win_case, 'case(s)');
			pos := win_case - (pos - win_case);
		end;
		writeln('Vous etes maintenant a la case ',pos);
		if (pos = win_case) then
			writeln('Vous avez gagne ! Bien joue ! pressez n''importe quelle touche pour quitter :p');
	end;
	readkey;
END.
