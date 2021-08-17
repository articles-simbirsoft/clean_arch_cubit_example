import 'package:clean_arch_example_cubit/data/repository/impl/counter_repo_impl.dart';
import 'package:clean_arch_example_cubit/data/repository/interface/counter_repo.dart';
import 'package:clean_arch_example_cubit/domain/use_cases/impl/counter_case_impl.dart';
import 'package:clean_arch_example_cubit/domain/use_cases/interfaces/counter_case.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DI {
  static DI? instance;

  late CounterRepository counterRepository;
  late CounterCase counterCase;

  DI._();

  static DI getInstance() {
    return instance ?? (instance = DI._());
  }

  Future<void> init() async {
    final directory = await getApplicationSupportDirectory();
    Hive.init(directory.path);
    counterRepository = CounterRepositoryImpl(await Hive.openBox('counter'));
    counterCase = CounterCaseImpl(counterRepository);
  }
}
