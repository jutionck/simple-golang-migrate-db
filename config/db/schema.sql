CREATE TABLE IF NOT EXISTS mst_user (
  id VARCHAR(100) PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(100),
  role VARCHAR(50),
  reset_token VARCHAR(100),
  is_active VARCHAR(30),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mst_customer (
  id VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100),
  phone_number VARCHAR(15),
  user_id VARCHAR(100),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY (user_id )REFERENCES mst_user (id)
);

CREATE TABLE IF NOT EXISTS mst_employee (
  id VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100),
  phone_number VARCHAR(15),
  user_id VARCHAR(100),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES mst_user (id)
);