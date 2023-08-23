# Dirty State

## Pengantar

Dirty State ini terjadi ketika query yang kita buat ada kesalahan atau ada typo, misalnya ketika kita mebuat query yang harusnya `int` yang dibuat `imt`.

Maka ketika dilakukan `migrate up` akan ada informasi gagal eksekusi.

## Praktik

Silahkan kita lakukan `down` dahulu:

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations down
Are you sure you want to apply all down migrations? [y/N]
y
Applying all down migrations
20230823043113/d alter_table_user (11.650722ms)
20230823035109/d create_table_users (29.224905ms)
```

Setelah itu coba lakukan edit pada tabel user:

```sql
CREATE TABLE IF NOT EXISTS mst_user (
  id VARCHAR(100) PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(100),
  role VARCHAR(50),
  reset_token VARCHAR(100)
  is_active VARCHAR(30)
);
```

`Note`:

- Kesalahan yang dibuat adalah kurang tanda comma (`,`)

Kita jalankan command menggunakan versioning `1`:

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations up 1
error: migration failed: syntax error at or near "is_active" (column 3) in line 7: CREATE TABLE IF NOT EXISTS mst_user (
  id VARCHAR(100) PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(100),
  role VARCHAR(50),
  reset_token VARCHAR(100)
  is_active VARCHAR(30)
); (details: pq: syntax error at or near "is_active")
```

Dapat dilihat terjadi kesalahan. Kita juga bisa lihat di tabel `schema_migrations` akan seperti berikut:

```bash
belajar_db_migrate=# select * from schema_migrations;
    version     | dirty
----------------+-------
 20230823035109 | t
```

Kita bisa juga mengecek status migration dengan perintah berikut:

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations version
20230823035109 (dirty)
```

Dapat dilihat `20230823035109` statusnya adalah `dirty`.

Bagaimana untuk memperbaiki yang memiliki status `dirty` ? Caranya adalah kita bisa menggunakan `force`. Perintah lengkapnya adalah sebagai berikut:

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations force 20230823035109
```

`Note`:

- `force 20230823035109` adalah nomor version yang mau di bersihkan status `dirty` nya.

Jika berhasil silahkan cek lagi dengan version. Sekarang status yang tadinya `dirty` akan hilang.

Berikutnya kita hapus isi dari tabel `schema_migrations`:

```bash
belajar_db_migrate=# delete from schema_migrations;
DELETE 1
```

`Note`:

- Kita memang harus menghapus secara manual ya.

Terakhir, jalankan kembali file migrate up nya. Pastikan berhasil ya.

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations up 1
```

Sampai sini sudah selesai.

## Menu

<< [Migrate Versioning](5-migrate-versioning.md)
