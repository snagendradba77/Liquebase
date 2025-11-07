-- changeset raw:003_create_new_table
CREATE TABLE NewTable (
    id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);

