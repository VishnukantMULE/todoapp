import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  final _table = "my_task";
  final _columnId = '_id';
  final _columnStartDate = 'start_date';
  final _columnEndDate = 'end_date';
  final _columnTitle = 'title';
  final _columnIsPriority = 'isprioritytask';
  final _columnIsDailyTask = 'isdailytask';
  final _columnTaskDescription = 'task_description';

  Future<Database> openMyDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        db.execute('''
      CREATE TABLE $_table(
      $_columnId INTEGER PRIMARY KEY,
      $_columnStartDate TEXT NOT NULL,
      $_columnEndDate TEXT NOT NULL,
      $_columnTitle TEXT NOT NULL,
      $_columnIsPriority TEXT NOT NULL,
      $_columnIsDailyTask TEXT NOT NULL,
      $_columnTaskDescription TEXT NOT NULL
      )
      ''');
      },
    );
    return database;

  }

  Future<void> createTask(String startDate, String endDate, String title,
      String isPriorityTask, String isDailyTask, String description) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');
    final db = await openDatabase(path);

    db.insert(
      _table,
      {
        _columnStartDate: startDate,
        _columnEndDate: endDate,
        _columnTitle: title,
        _columnIsPriority: isPriorityTask,
        _columnIsDailyTask: isDailyTask,
        _columnTaskDescription: description
      },
    );
    print("Task Creeated Successfully");
  }
}
