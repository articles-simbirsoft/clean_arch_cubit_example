import 'package:clean_arch_example_cubit/data/repository/interface/counter_repo.dart';
import 'package:clean_arch_example_cubit/domain/use_cases/interfaces/counter_case.dart';

class CounterCaseImpl extends CounterCase {
  final CounterRepository _counterRepository;

  CounterCaseImpl(this._counterRepository);

  @override
  int getLastCount() => _counterRepository.getLastCount();

  @override
  Future<int> saveCount(int count) => _counterRepository.saveCount(count);
}
