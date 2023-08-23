package config

import (
	"database/sql"
	"fmt"
	"simple-golang-migrate-db/model"
)

type DbInfra interface {
	Conn() *model.Queries
}

type dbInfra struct {
	db  *model.Queries
	cfg *Config
}

func (d *dbInfra) initDB() error {
	dsn := fmt.Sprintf("host=%s port=%s user=%s dbname=%s password=%s sslmode=disable",
		d.cfg.Host,
		d.cfg.Port,
		d.cfg.User,
		d.cfg.Name,
		d.cfg.Password,
	)

	db, err := sql.Open(d.cfg.Driver, dsn)
	if err != nil {
		panic(fmt.Errorf("connection open failed %w", err))
	}
	d.db = model.New(db)

	return nil
}

func (d *dbInfra) Conn() *model.Queries {
	return d.db
}

func NewDbInfra(cfg *Config) DbInfra {

	dbInfra := &dbInfra{cfg: cfg}
	if err := dbInfra.initDB(); err != nil {
		panic(fmt.Errorf(err.Error()))
	}
	return dbInfra
}
