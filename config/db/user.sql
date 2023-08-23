-- name: CreateUser :execresult
INSERT INTO mst_user (
  id, username, password, role, is_active, created_at, updated_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
);

-- name: ListUser :many
SELECT id, username, role, is_active, created_at, updated_at
FROM mst_user
ORDER BY created_at DESC;

-- name: GetUser :one
SELECT id, username, role, is_active, created_at, updated_at
FROM mst_user
WHERE id = $1;

-- name: GetUsername :one
SELECT id, username, role, is_active, created_at, updated_at
FROM mst_user
WHERE username = $1;

-- name: UpdateUser :exec
UPDATE mst_user 
SET username = $2, password = $3, role = $4, is_active = $5, updated_at = $6
WHERE id = $1;

-- name: DeleteUser :exec
DELETE FROM mst_user
WHERE id = $1;