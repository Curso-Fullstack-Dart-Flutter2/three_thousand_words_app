import 'package:three_thousand_words/app/core/database/migration/migration.dart';
import 'package:three_thousand_words/app/core/database/migration/migration_v1.dart';

class SqliteMigationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
      ];
  List<Migration> getUpgradeMigration(int version) => [];
}
