-- name: CreateEmployee :exec
INSERT INTO mst_employee (
  id, name, phone_number, user_id, created_at, updated_at
) VALUES (
  $1, $2, $3, $4, $5, $6
);

-- name: ListEmployee :many
SELECT id, name, phone_number, created_at, updated_at
FROM mst_employee
ORDER BY created_at DESC;

-- name: GetEmployee :one
SELECT id, name, phone_number, created_at, updated_at
FROM mst_employee
WHERE id = $1;

-- name: GetEmployeePhoneNumber :one
SELECT id, name, phone_number, created_at, updated_at
FROM mst_employee
WHERE phone_number = $1;

-- name: UpdateEmployee :exec
UPDATE mst_employee 
SET name = $2, phone_number = $3, user_id = $4, updated_at = $5
WHERE id = $1;

-- name: DeleteEmployee :exec
DELETE FROM mst_employee
WHERE id = $1;