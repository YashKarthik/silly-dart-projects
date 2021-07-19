import 'package:expressions/expressions.dart';

void main(){
	var exp = Expression.parse('1 + 1');
	var context = {'x' : 3};
	final evaluator = const ExpressionEvaluator();
	print(evaluator.eval(exp, context));
}
