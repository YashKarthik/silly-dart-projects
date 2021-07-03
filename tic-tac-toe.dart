import 'dart:io';

/*
1. Print out a 3x3 matrix of dots
2. Ask the user for a (x,y) coordinate of their mark (O)
3. Reprint the 3x3 matrix with an update for the user's mark
4. Reprint the matrix with the robot's mark (x)
5. Repeat...
6. When a line of same the same marks is formed, end the game
*/

void matrix(){
	Map <String, String> matrix = {
		'0,0': '.', '0,1': '.','0,2': '.',
		'1,0': '.','1,1': '.', '1,2': '.',
		'2,0': '.', '2,1': '.', '2,2': '.'};

	int run = 0;
	int points = 0;

	for (run = 1; run <=10; run++){
		print('Enter coordinates x,y: ');
		points = stdin.readLineSync();
		matrix[points] = "X";
		print('''
			${matrix['2,0']}	${matrix['2,1']}	${matrix['2,2']}

			${matrix['1,0']}	${matrix['1,1']}	${matrix['1,2']}

			${matrix['0,0']}	${matrix['0,1']}	${matrix['0,2']}''');
	}

}

void main(){
	matrix();
}
