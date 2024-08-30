testing(){
  String hello = 'Welcome';
  test(){
     aa() => print('Testing ..$hello');
  }
  return test;
}

void main() {
  var a = testing();
  a;
}