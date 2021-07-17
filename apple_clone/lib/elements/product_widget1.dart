import 'package:flutter/cupertino.dart';

class ProductWidget1 extends StatelessWidget {

	late final String productName;
	late final String tagLine;
	late final String offerText;
	late final String productPath;
	late final int textColor;
	late final int backColor;

	ProductWidget1(
	{
		required this.productName, required this.tagLine,
		required this.offerText, required this.productPath,
		required this.textColor, required this.backColor,
	});

	@override
	Widget build(BuildContext context) {
		return Center( 
			child: CupertinoButton(
				onPressed: () {},
				pressedOpacity: 1,
				child: Container(
					color: Color(backColor),
					padding: EdgeInsets.only(top: 100),
					child: Column(
						children: <Widget>[

							Text(
								productName,
								style: TextStyle(
									fontSize: 50,
									color: Color(textColor),
									fontWeight: FontWeight.w900,
									letterSpacing: 1,
								),
							),

							SizedBox(height: 1),

							Text(
								tagLine,
								style: TextStyle(
									color: Color(textColor),
									fontSize: 25,
									letterSpacing: 0.3,
									fontWeight: FontWeight.w500,
								),
							),

							SizedBox(height: 12.5),

							Text(
								offerText,
								style: TextStyle(
									fontSize: 15,
									color: CupertinoColors.inactiveGray,
								),
							),

							SizedBox(height: 12.5),
							Image.asset('assets/$productPath')
						],
					),
				),
			),
		);
	}
}
