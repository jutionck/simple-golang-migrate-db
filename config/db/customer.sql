-- name: CreateCustomer :exec
INSERT INTO mst_customer (
  id, name, phone_number, user_id, created_at, updated_at
) VALUES (
  $1, $2, $3, $4, $5, $6
);

-- name: ListCustomer :many
SELECT id, name, phone_number, created_at, updated_at
FROM mst_customer
ORDER BY created_at DESC;

-- name: GetCustomer :one
SELECT id, name, phone_number, created_at, updated_at
FROM mst_customer
WHERE id = $1;

-- name: GetCustomerPhoneNumber :one
SELECT id, name, phone_number, created_at, updated_at
FROM mst_customer
WHERE phone_number = $1;

-- name: UpdateCustomer :exec
UPDATE mst_customer 
SET name = $2, phone_number = $3, user_id = $4, updated_at = $5
WHERE id = $1;

-- name: DeleteCustomer :exec
DELETE FROM mst_employee
WHERE id = $1;