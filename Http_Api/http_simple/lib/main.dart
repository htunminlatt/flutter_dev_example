testing(){
  String hello = 'Welcome';
   test(int count){
   print(hello);  
   print(count * 10);
  }
  return test;
}

void main() {
  var a = testing();
  (a(10));
}