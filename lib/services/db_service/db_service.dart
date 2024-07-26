import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  final _table_dt = "daily_task";
  final _table_pt = "priority_task";
  final _columnId = '_id';
  final _columnStartDate = 'start_date';
  final _columnEndDate = 'end_date';
  final _columnTitle = 'title';
  final _columnSubTaskList = 'subtask_list';
  final _columnTaskDescription = 'task_description';
  final _columndtStatus = 'status';
  final _columnptStatus = 'status';

  Future<Database> openMyDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await createDailyTaskTable(db);
        await createPriorityTaskTable(db);
      },
    );

    return database;
  }

  Future<void> createDailyTaskTable(Database db) async {
    db.execute('''
        CREATE TABLE $_table_dt(
        $_columnId INTEGER PRIMARY KEY,
        $_columnStartDate TEXT NOT NULL,
        $_columnEndDate TEXT NOT NULL,
        $_columnTitle TEXT NOT NULL,
        $_columnTaskDescription TEXT NOT NULL,
        $_columndtStatus TEXT NOT NULL
        )
        ''');
  }

  Future<void> createPriorityTaskTable(Database db) async {
    db.execute('''
          CREATE TABLE $_table_pt(
        $_columnId INTEGER PRIMARY KEY,
        $_columnStartDate TEXT NOT NULL,
        $_columnEndDate TEXT NOT NULL,
        $_columnTitle TEXT NOT NULL,
        $_columnTaskDescription TEXT NOT NULL,
        $_columnSubTaskList TEXT NOT NULL,
        $_columnptStatus TEXT NOT NULL
        )
        ''');
  }

// Add Data To Table
  Future<void> createDailyTask(String startDate, String endDate, String title,
      String description, String status) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');
    final db = await openDatabase(path);
    db.insert(_table_dt, {
      _columnStartDate: startDate,
      _columnEndDate: endDate,
      _columnTitle: title,
      _columnTaskDescription: description,
      _columndtStatus: status
    });
  }

  Future<void> createPriorityTask(String startDate, String endDate,
      String title, String description, String subTask, String status) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');
    final db = await openDatabase(path);
    db.insert(_table_pt, {
      _columnStartDate: startDate,
      _columnEndDate: endDate,
      _columnTitle: title,
      _columnTaskDescription: description,
      _columnSubTaskList: subTask,
      _columnptStatus: status
    });
  }

//get Data From Tables
  Future<List<Map<String, dynamic>>> fetchDtTable() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');
    final db = await openDatabase(path);
    final List<Map<String, dynamic>> resultList = await db.query(_table_dt);
    return resultList;
  }

  Future<List<Map<String, dynamic>>> fetchPtTable() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');
    final db = await openDatabase(path);
    final List<Map<String, dynamic>> resultList = await db.query(_table_pt);
    return resultList;
  }

//Update Status
  Future<void> updateDtStatus(int index, String value) async
  {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');
    final db = await openDatabase(path);
    db.update(_table_dt,
      {_columndtStatus:value},
      where: '$_columnId=?',
      whereArgs: [index],
    );
    print("Update Trigger");
  }

}
