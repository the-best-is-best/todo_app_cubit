import 'package:get_it/get_it.dart';
import 'package:todo_app/app/services/init_sqlite.dart';

final di = GetIt.instance;

Future initDB() async {
  di.registerFactory(() => SqfliteInit());
  await di<SqfliteInit>().initDatabase();

  await di.unregister<SqfliteInit>();
}
