CREATE TABLE IF NOT EXISTS mst_employee (
  id VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100),
  phone_number VARCHAR(15),
  user_id VARCHAR(100),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES mst_user (id)
);