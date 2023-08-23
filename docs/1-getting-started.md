# Getting Started

## Persiapan Project

Di dokumentasi ini sudah terbuat beberapa folder dan sebenernya project sudah jadi. Tetapi tenang dokumentasi ini akan dibuat per langkah jadi kamu tidak akan bingung.

Dalam project ini sudah terdapat beberapa folder seperti:

1. Config
2. Model
3. Repository
4. Usecase
5. Delivery

## Membuat File Migrate

Kita akan membuat file migrate disini kita akan membuat case `users`. Silahkan ketikkan perintah berikut:

```
migrate create -ext sql -dir db/migrations create_table_users
```

Jika berhasil akan membuat 2 buah file migrate yaitu `up` dan `down` didalam folder `db/migrations`

```bash
/Users/jutioncandrakirana/Documents/GitHub/enigma/GOLANG/simple-golang-migrate-db/db/migrations/20230823035109_create_table_users.up.sql
/Users/jutioncandrakirana/Documents/GitHub/enigma/GOLANG/simple-golang-migrate-db/db/migrations/20230823035109_create_table_users.down.sql
```

Keterangan:

- `up`: berfungs sebagai file untuk membuat sebuah tabel baru dan perubahan tabel baru
- `down`:

## Migrate Up

Kita bahas yang migrate up, setelah kita berhasil membuat file migrate, silahkan kita buka file yang memiliki nama `up` di dalam `db/migrations`. Setelah itu silahkan edit isi nya dengan kode berikut:

```sql
CREATE TABLE IF NOT EXISTS mst_user (
  id VARCHAR(100) PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(100),
  role VARCHAR(50),
  reset_token VARCHAR(100),
  is_active VARCHAR(30)
);
```

## Migrate Down

Untuk yang ini adalah kebalikan dari yang Migrate Up, sesuai namanya down sendiri berfungsi untuk melakukan drop tabel yang sudah dibuat atau terjadi kesalahan dikemudian hari. Silahkan kita buka file yang memiliki nama `down` di dalam `db/migrations`. Setelah itu silahkan edit isi nya dengan kode berikut:

```sql
DROP TABLE IF EXISTS mst_user;
```

## Menu

<< [Pengantar](../README.md) | [Creating Database](2-migrate-run.md) >>
