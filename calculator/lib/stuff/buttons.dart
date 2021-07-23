import 'dart:ui';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:calculator/stuff/globals.dart' as globals;

class DefaultButtons extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return GridView.count(

			shrinkWrap: true,
			scrollDirection: Axis.vertical,
			physics: NeverScrollableScrollPhysics(),
			crossAxisCount: 4,
			crossAxisSpacing: 10,
			mainAxisSpacing: 10,
			padding: EdgeInsets.fromLTRB(10, 20, 10, 30),

			children: <Widget>[

				_ButtonBuilder(
					opName: 'AC',
					backColor: 0xffccc7c1,
					textColor: 0xff000000,
				),

				_ButtonBuilder(
					opName: '+/-',
					backColor: 0xffccc7c1,
					textColor: 0xff000000,
				),

				_ButtonBuilder(
					opName: '%',
					backColor: 0xffccc7c1,
					textColor: 0xff000000,
					op: '*(1/100)*'
				),

				_ButtonBuilder(
					opName: '÷',
					backColor: 0xfffc9825,
					textColor: 0xffffffff,
					op: '/',
				),
				
				_ButtonBuilder(
					opName: '7',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '8',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '9',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '*',
					backColor: 0xfffc9825,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '4',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '5',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '6',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '-',
					backColor: 0xfffc9825,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '1',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '2',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '3',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '+',
					backColor: 0xfffc9825,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '0',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '00',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '.',
					backColor: 0xff1f2120,
					textColor: 0xffffffff,
				),

				_ButtonBuilder(
					opName: '=',
					backColor: 0xfffc9825,
					textColor: 0xffffffff,
				),
			],
		);
	}
}

class _ButtonBuilder extends StatelessWidget {
	
	late final String opName;
	late final String? op;
	late final int backColor;
	late final int textColor;

	_ButtonBuilder({
			required this.opName,
			required this.backColor,
			required this.textColor,
			this.op,
	});

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(

				onPressed: () {

					if(opName == '=' || op == '='){

						print(globals.operation);
						var context = {'x':1};
						var expression = Expression.parse("${globals.operation}");
						final evaluator = const ExpressionEvaluator();
						globals.solution = evaluator.eval(expression, context);
						print(globals.solution);

					}
					else{
						globals.operation += op ?? opName;
						print(globals.operation);
					}
				},

				style: ElevatedButton.styleFrom(
				  shape: CircleBorder(),
					primary: Color(backColor),
					minimumSize: Size(0.5, 0.5)
  			),

				child: Text(
					opName,
					style: TextStyle(
						color: Color(textColor),
						fontSize: 27,
						fontWeight: FontWeight.w400,
					),
				),

		);
	}
}
