# Golang Migrate DB

## Pengatar

Kenapa perlu migrate ? dan seberapa penting kita harus melakukan migrate db. Untuk menjawab itu kita bisa membanyangkan apabila database yang sudah kita desain dikemudian hari ada perubahan struktur baik itu menambah tabel atau perubahan di tabel yang sudah ada. Hal itu jika tidak menggunakan migrate kita harus membuat secara manual setiap ada perubahan.

Menggunakan migrate database kita dapat melakukan mekanisme yang manual di atas kita bisa lakukan dengan otomatis setiap ada perubahan di struktur database. Migrate juga dapat melakukan manage dan review struktur database sehingga bisa meminimalisir terjadi kesalahan.

## Golang Migrate ?

Ada sebuah package atau library untuk membantu kita dalam melakukan migrate database. Library tersebut adalah `golang-migrate`. Bisa cek disini ya https://github.com/golang-migrate/migrate

## Instalasi

Untuk melakukan instalasi bisa ketikkan perintah berikut:

```bash
go install -tags "postgres" github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```

`Note`:

- Untuk database tidak hanya untuk `postgres` ya bisa juga yang lain seperti `mysql`, `sqlite` dll.

Hasilnya jika berhasil:

```bash
go: downloading github.com/golang-migrate/migrate/v4 v4.16.2
go: downloading github.com/golang-migrate/migrate v3.5.4+incompatible
go: downloading github.com/hashicorp/go-multierror v1.1.1
go: downloading go.uber.org/atomic v1.7.0
go: downloading github.com/hashicorp/errwrap v1.1.0
```

Validasi juga menggunakan command berikut:

```
migrate
```

Sampai sini kamu sudah melakukan instalasi `migrate`. Selanjutnya silahkan pilih topik lanjutan di bawah ini:

1. [Getting Started](docs/1-getting-started.md)
2. [Migrate Run](docs/2-migrate-run.md)
3. [Migrate State](docs/3-migrate-state.md)
4. [Migrate Down](docs/4-migrate-down.md)
5. [Migrate Versioning](docs/5-migrate-versioning.md)
6. [Dirty State](docs/6-dirty-state.md)
