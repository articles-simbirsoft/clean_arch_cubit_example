
abstract class CounterRepository{

  int getLastCount();

  Future<int> saveCount(int count);

}