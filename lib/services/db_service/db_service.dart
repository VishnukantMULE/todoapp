import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  final _table_dt = "daily_task";
  final _table_pt = "priority_task";
  final _table_user = "user";

  //Task Columns
  final _columnId = '_id';
  final _columnStartDate = 'start_date';
  final _columnEndDate = 'end_date';
  final _columnTitle = 'title';
  final _columnSubTaskList = 'subtask_list';
  final _columnTaskDescription = 'task_description';
  final _columnDtStatus = 'status';
  final _columnPtStatus = 'status';

  //User Columns
  final _columnFirstName = "firstname";
  final _columnLastName = "lastname";
  final _columnPhoneNumber = "phone";
  final _columnEmail = "email";
  final _columnDOB = "dob";
  final _columnPassword = "password";
  final _columnProfilePhoto = "profilephoto";

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
        $_columnDtStatus TEXT NOT NULL
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
        $_columnPtStatus TEXT NOT NULL
        )
        ''');
  }


  Future<void> createUserTable(Database db) async {
    db.execute('''
          CREATE TABLE $_table_pt(
        $_columnId INTEGER PRIMARY KEY,
        $_columnFirstName TEXT NOT NULL,
        $_columnLastName TEXT NOT NULL,
        $_columnDOB TEXT NOT NULL,
        $_columnPhoneNumber TEXT NOT NULL,
        $_columnEmail TEXT NOT NULL,
        $_columnPassword TEXT NOT NULL,
        $_columnProfilePhoto TEXT NOT NULL
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
      _columnDtStatus: status
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
      _columnPtStatus: status
    });
  }



  Future<void> createNewUser(String firstName, String lastName, String dob, String email, String phoneNumber,String password, String photo) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');
    final db = await openDatabase(path);
    db.insert(_table_user, {
      _columnFirstName:firstName,
      _columnLastName:lastName,
      _columnDOB:dob,
      _columnEmail:email,
      _columnPhoneNumber:phoneNumber,
      _columnPassword:password,
      _columnProfilePhoto:photo
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
  Future<void> updateDtStatus(int index, String value) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_db.db');
    final db = await openDatabase(path);
    db.update(
      _table_dt,
      {_columnDtStatus: value},
      where: '$_columnId=?',
      whereArgs: [index],
    );
    print("Update Trigger");
  }
}
