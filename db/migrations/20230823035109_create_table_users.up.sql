CREATE TABLE IF NOT EXISTS mst_user (
  id VARCHAR(100) PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(100),
  role VARCHAR(50),
  reset_token VARCHAR(100),
  is_active VARCHAR(30)
);