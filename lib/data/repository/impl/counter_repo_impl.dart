import 'package:clean_arch_example_cubit/data/repository/interface/counter_repo.dart';
import 'package:hive/hive.dart';

class CounterRepositoryImpl extends CounterRepository {
  static const boxKey = 'counter';

  final Box box;

  CounterRepositoryImpl(this.box);

  @override
  int getLastCount() => box.get(boxKey, defaultValue: 0);

  @override
  Future<int> saveCount(int count) async {
    await box.put(boxKey, count);
    return count;
  }
}
