
abstract class CounterStates{}

class CounterInitialState extends CounterStates{}

class CounterPlusState extends CounterStates{
  //بدي ابعت قيمة الكونتر ل ستيت
   final int counter ;
   CounterPlusState(this.counter);
}
class CounterMinusState extends CounterStates{

   final int counter ;
   CounterMinusState(this.counter);
}