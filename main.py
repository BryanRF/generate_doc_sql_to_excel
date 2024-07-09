import re
import openpyxl
from openpyxl.styles import Font, Alignment, PatternFill

def parse_create_table(sql):
    tables = {}
    current_table = None
    for line in sql.split('\n'):
        line = line.strip()
        if line.startswith('CREATE TABLE'):
            current_table = re.search(r'CREATE TABLE (\w+)', line).group(1)
            tables[current_table] = []
        elif line and current_table and not line.startswith(')') and not line.startswith('--'):
            column_info = re.split(r'\s+', line, 3)
            if len(column_info) >= 2:
                name, data_type = column_info[:2]
                length = re.search(r'\((\d+)\)', data_type)
                length = length.group(1) if length else ''
                is_pk = 'PRIMARY KEY' in line
                is_fk = name.lower().startswith('id') and not is_pk
                is_unique = 'UNIQUE' in line
                default_value = re.search(r'default\s+(\S+)', line.lower())
                default_value = default_value.group(1) if default_value else ''
                if default_value == 'null':
                    default_value = 'NULL'
                elif default_value == 'getdate()':
                    default_value = 'GETDATE()'
                elif not default_value and 'not null' in line.lower():
                    default_value = 'not null'
                
                tables[current_table].append({
                    'Variable': name.strip(','),
                    'Tipo': data_type.split('(')[0],
                    'Longitud': length,
                    'PK': 'X' if is_pk else '',
                    'FK': 'X' if is_fk else '',
                    'Default': default_value,
                    'Unico': 'X' if is_unique else ''
                })
    return tables

def create_excel(tables):
    wb = openpyxl.Workbook()
    wb.remove(wb.active)

    headers = ['Variable', 'Tipo', 'Longitud', 'PK', 'FK', 'Default', 'Unico']

    for table_name, columns in tables.items():
        ws = wb.create_sheet(title=table_name)
        
        # Agregar encabezados
        for col, header in enumerate(headers, start=1):
            cell = ws.cell(row=1, column=col, value=header)
            cell.font = Font(bold=True)
            cell.alignment = Alignment(horizontal='center')
            cell.fill = PatternFill(start_color="CCCCCC", end_color="CCCCCC", fill_type="solid")

        # Agregar datos
        for row, column in enumerate(columns, start=2):
            for col, header in enumerate(headers, start=1):
                cell = ws.cell(row=row, column=col, value=column[header])
                cell.alignment = Alignment(horizontal='center')

        # Ajustar ancho de columnas
        for column in ws.columns:
            max_length = 0
            column = [cell for cell in column]
            for cell in column:
                try:
                    if len(str(cell.value)) > max_length:
                        max_length = len(cell.value)
                except:
                    pass
            adjusted_width = (max_length + 2)
            ws.column_dimensions[column[0].column_letter].width = adjusted_width

    wb.save('diccionario_datos3.xlsx')

# Leer el contenido del archivo SQL
with open('data.sql', 'r') as file:
    sql_content = file.read()

# Parsear las tablas
tables = parse_create_table(sql_content)

# Crear el archivo Excel
create_excel(tables)

print("El diccionario de datos ha sido generado en 'diccionario_datos.xlsx'")