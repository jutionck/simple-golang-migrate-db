package config

import (
	"fmt"
	"os"

	"github.com/joho/godotenv"
)

type DbConfig struct {
	Host     string
	Port     string
	User     string
	Name     string
	Password string
	Driver   string
}

type Config struct {
	DbConfig
}

func (c *Config) ReadConfig() error {
	if err := godotenv.Load(); err != nil {
		return fmt.Errorf("erorr read env %w", err)
	}

	c.DbConfig = DbConfig{
		Host:     os.Getenv("DB_HOST"),
		Port:     os.Getenv("DB_PORT"),
		User:     os.Getenv("DB_USER"),
		Name:     os.Getenv("DB_NAME"),
		Password: os.Getenv("DB_PASSWORD"),
		Driver:   os.Getenv("DB_DRIVER"),
	}

	return nil
}

func NewConfig() (*Config, error) {
	cfg := &Config{}
	if err := cfg.ReadConfig(); err != nil {
		return nil, err
	}
	return cfg, nil
}
