# Migrate Run

## Membuat Database

Tahapan ini adalah tahapan membuat sebuah database. Kenapa perlu membuat database, karena Golang Migrate yang sudah kita install tidak bisa melakukan pembuatan database secara otomatis maka dari itu kita harus membuat database secara manual. Silahkan gunakan `pgAdmin` atau `terminal`.

Disini penulis menggunakan terminal ya:

```bash
psql -U postgres
psql (14.8 (Homebrew))
Type "help" for help.

postgres=# CREATE DATABASE belajar_db_migrate;
CREATE DATABASE
postgres=#
```

Database terbuat.

## Menjalankan Migrasi

Berikutnya kita akan menjalankan migrasi, pastikan database sudah terbuat ya. Untuk menjalankan migare kita bisa lakukan perintah berikut:

```bash
migrate -database "koneksidatbase" -pathfolder up
```

Untuk `koneksidatabase` sesuaikan dengan database yang digunakan, disini penulis menggunakan postgres jadi `koneksidatabase` diisi dengan berikut:

```
postgres://user:password@localhost:5432/database?sslmode=disable
```

Jadi kode lengkapnya adalah sebagai berikut:

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations up
```

Sesuaikan untuk `user` dan `password` di database pengaturan teman teman.

Jika berhasil maka akan mendapatkan informasi berikut:

```bash
20230823035109/u create_table_users (11.683242ms)
```

Jika kita cek di database maka akan terbuat 2 (dua) buah tabel seperti berikut:

```bash
postgres=# \c belajar_db_migrate
You are now connected to database "belajar_db_migrate" as user "postgres".
belajar_db_migrate=# \d
               List of relations
 Schema |       Name        | Type  |  Owner
--------+-------------------+-------+----------
 public | mst_user          | table | postgres
 public | schema_migrations | table | postgres
```

## Menu

<< [Getting Started](1-getting-started.md) | [Migrate State](3-migrate-state.md) >>
