# Migrate Versioning

## Pengantar

Topik ini akan membahas bagaimana untuk melakukan `up` dan `down` pada versi migration tertentu.

## Praktik

Untuk melakukan spesifik version kita bisa tambahkan nomor urutan setelah `up` pada command migrate. Command urutan biasanya sesuai dengan waktu yang terbuat saat create file migrate.

Jadi command nya adalah sebagai berikut:

```bash
migrate -database "postgres://postgres:pass%40word@localhost:5432/belajar_db_migrate?sslmode=disable" -path db/migrations up 1
```

`Note`:

- Angka `1` silahkan ganti dengan urutan yang ada sesuaikan dengan jumlah file migrate yang sudah dibuat.

## Tugas

1. Silahkan buat 3 buah file migrate baru
2. Buatlah tabel `customer`, `employee` dan `product`
3. Lakukan create migrate
4. Lakukan migrate up dengan urutan `1` s.d `3`

## Menu

<< [Migrate Down](4-migrate-down.md) | [Dirty State](6-dirty-state.md) >>
