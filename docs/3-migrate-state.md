# Migrate State

## Pengantar

Bagaiman jika kita menambah file migration baru, apakah file migration yang sudah ada harus di hapus dulu ?

Atau bagaimana jika ada perubahan struktur tabel yang sudah di migrate ?

Jawabanya adalah kamu tidak perlu menghapus file migration yang sudah terbuat dan kamu tidak perlu merubah file migration yang sudah terbuat sebelumnya.

Migrate sendiri mempunyai sebuah state yang akan menyimpan seluruh perubahan yang ada di tabel `schema_migrations` fungsinya adalah akan mendeteksi file yang terakhir sehingga kamu tidak perlu menghapus file yang sudah ada.

Isi dari tabel tersebut sebagai berikut:

```bash
belajar_db_migrate=# select * from schema_migrations;
    version     | dirty
----------------+-------
 20230823035109 | f
```

## Merubah Struktur Tabel

Kita akan mencoba merubah dengan menambah kolom baru yaitu `created_at` dan `updated_at` pada tabel `mst_user` yang sudah dibuat dari hasil migrate pertama.

Kita tidak bisa melakukan update dari file migration yang sudah terbuat. Kita harus membuat file migrations baru, maka dari itu silahkan ketikkan perintah berikut:

```bash
migrate create -ext sql -dir db/migrations alter_table_user
```

Maka akan terbuat 2 (dua) buah file migration baru lagi. Selanjutnya kita isi perubahan apa yang ingin dilakukan pada file migration yang baru terbuat, buka yang `up` kemudian ketikkan seperti berikut:

```sql
ALTER TABLE mst_user ADD COLUMN created_at TIMESTAMP;
ALTER TABLE mst_user ADD COLUMN updated_at TIMESTAMP;
```

Setelah itu jalankan migrate lagi dengan cara berikut:

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations up
20230823043113/u alter_table_user (6.560774ms)
```

Sekarang kita lihat pada tabel `schema_migrations`:

```bash
belajar_db_migrate=# select * from schema_migrations;
    version     | dirty
----------------+-------
 20230823043113 | f
```

Isinya sekarang sudah berubah sesuai file migrations yang baru.

## Menu

<< [Migrate Run](2-migrate-run.md) | [Migrate Rollback](4-migrate-down.md) >>
