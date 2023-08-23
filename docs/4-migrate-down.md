# Migrate Down

## Pengantar

Topik ini akan membahas bagaimana kita melakukan rollback pada tabel yang sudah di migrate.

Perintah yang digunakan adalah sebagai berikut:

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations down
```

Pastikan di file `down` sudah ada kode yang terbuat.

```sql
DROP TABLE IF EXISTS mst_user;
```

Perintah `down` akan menghapus semua tabel yang sudah terbuat.

## Menu

<< [Migrate State](3-migrate-state.md) | [Migrate Versioning](5-migrate-versioning.md) >>
