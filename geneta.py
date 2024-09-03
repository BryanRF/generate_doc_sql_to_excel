import json

sql_syntax = {
    "create_table": "CREATE TABLE [schema_name].[table_name] (\n    [column_definitions]\n);",
    "column_definition": "[column_name] [data_type] [constraints]",
    "primary_key": "CONSTRAINT [constraint_name] PRIMARY KEY ([column_name])",
    "foreign_key": "CONSTRAINT [constraint_name] FOREIGN KEY ([column_name]) REFERENCES [referenced_table]([referenced_column])",
    "unique_constraint": "CONSTRAINT [constraint_name] UNIQUE ([column_name])",
    "check_constraint": "CONSTRAINT [constraint_name] CHECK ([condition])",
    "default_constraint": "CONSTRAINT [constraint_name] DEFAULT [default_value] FOR [column_name]",
    "alter_table_add_column": "ALTER TABLE [schema_name].[table_name] ADD [column_name] [data_type] [constraints];",
    "alter_table_add_constraint": "ALTER TABLE [schema_name].[table_name] ADD CONSTRAINT [constraint_name] [constraint_definition];",
    "alter_table_drop_column": "ALTER TABLE [schema_name].[table_name] DROP COLUMN [column_name];",
    "alter_table_drop_constraint": "ALTER TABLE [schema_name].[table_name] DROP CONSTRAINT [constraint_name];",
    "alter_table_alter_column": "ALTER TABLE [schema_name].[table_name] ALTER COLUMN [column_name] [new_data_type] [new_constraints];"
}

# Write the dictionary to a JSON file
with open('sql_server_syntax.json', 'w') as f:
    json.dump(sql_syntax, f, indent=2)

print("SQL Server syntax JSON file has been created: sql_server_syntax.json")