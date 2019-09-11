/// This wraps the math associated with the display of the libra coin
/// and how it is represented as a BigInt value of microLibra
/// This is used for convenience and consistency
class LibraCoin {
  static const FACTOR = 1000000;
  BigInt microLibra;

  // Most network calls are in microlibra
  LibraCoin.fromNetwork(BigInt input){
    microLibra = input;
  }

  LibraCoin.fromDouble(double input){
    microLibra = BigInt.from(input*FACTOR);
  }

  LibraCoin.fromInt(int input){
    microLibra = BigInt.from(input*FACTOR);
  }

  double asDouble(){
    return microLibra.toInt()/FACTOR;
  }

  @override
  String toString() {
    return asDouble().toString();
  }
}