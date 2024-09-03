import re
import openpyxl
from openpyxl.styles import Font, Alignment, PatternFill

class Column:
    def __init__(self, name, data_type, length, col_type, default_value='', description=''):
        self.name = name
        self.data_type = data_type
        self.length = length
        self.col_type = col_type
        self.default_value = default_value
        self.description = description
        self.constraint_name = ''
        self.constraint_type = ''
        self.constraint_column = ''
        self.reference_table = ''
        self.reference_column = ''

class Constraint:
    def __init__(self, name, constraint_type, column, reference_table, reference_column):
        self.name = name
        self.constraint_type = constraint_type
        self.column = column
        self.reference_table = reference_table
        self.reference_column = reference_column

class Table:
    def __init__(self, name):
        self.name = name
        self.columns = []

    def add_column(self, column):
        self.columns.append(column)

    def add_constraint(self, constraint):
        for column in self.columns:
            if column.name == constraint.column:
                column.constraint_name = constraint.name
                column.constraint_type = constraint.constraint_type
                column.constraint_column = constraint.column
                column.reference_table = constraint.reference_table
                column.reference_column = constraint.reference_column

def clean_value(value):
    # Eliminar comas y paréntesis innecesarios pero mantener comillas y formato original
    return value.strip().replace(",", "").replace("(", "").replace(")", "").replace("'", "")

def parse_create_table(sql):
    tables = {}
    current_table = None
    for line in sql.split('\n'):
        line = line.strip()
        if line.lower().startswith('create table'):
            current_table = re.search(r'CREATE TABLE (\w+)', line, re.IGNORECASE).group(1)
            tables[current_table] = Table(current_table)
        elif line and current_table and not line.startswith(')') and not line.startswith('--'):
            if line.lower().startswith('constraint'):
                constraint_info = re.search(r'constraint (\w+) foreign key \((\w+)\) references (\w+)\((\w+)\)', line, re.IGNORECASE)
                if constraint_info:
                    constraint_name, column, ref_table, ref_column = constraint_info.groups()
                    constraint = Constraint(
                        name=constraint_name,
                        constraint_type='FOREIGN KEY',
                        column=column,
                        reference_table=ref_table,
                        reference_column=ref_column
                    )
                    tables[current_table].add_constraint(constraint)
            else:
                column_info = re.split(r'\s+', line, 3)
                if len(column_info) >= 2:
                    name = column_info[0]
                    data_type = column_info[1].upper()
                    length = re.search(r'\((\d+)\)', data_type)
                    length = length.group(1) if length else ''
                    
                    col_type = []
                    if 'PRIMARY KEY' in line.upper():
                        col_type.append('PK')
                    if name.lower().startswith('id') and 'PRIMARY KEY' not in line.upper():
                        col_type.append('FK')
                    if 'UNIQUE' in line.upper():
                        col_type.append('UNIQUE')
                    if 'DEFAULT' in line.upper():
                        default_value = re.search(r'DEFAULT\s+(.+)', line, re.IGNORECASE)
                        default_value = default_value.group(1).strip() if default_value else ''
                    else:
                        default_value = ''
                    
                    # Mantener el valor original sin limpieza innecesaria
                    column = Column(
                        name=clean_value(name.strip(',')),
                        data_type=clean_value(data_type.split('(')[0]),
                        length=clean_value(length),
                        col_type=clean_value(', '.join(col_type)),
                        default_value=clean_value(default_value),  # Se mantiene el valor original de DEFAULT
                        description=''  # Puedes agregar una lógica aquí para generar descripciones automáticas si es necesario
                    )
                    tables[current_table].add_column(column)
    return tables

def create_excel(tables):
    wb = openpyxl.Workbook()
    wb.remove(wb.active)

    headers = ['Variable', 'Tipo', 'Longitud', 'Tipo de Columna', 'Default', 'Descripción', 
               'Constraint Name', 'Tipo', 'Columna', 'Referencia Tabla', 'Referencia Columna']

    for table_name, table in tables.items():
        ws = wb.create_sheet(title=table_name if len(table_name) <= 31 else table_name[:28] + '...')
        
        # Agregar encabezados
        for col, header in enumerate(headers, start=1):
            cell = ws.cell(row=1, column=col, value=header)
            cell.font = Font(bold=True)
            cell.alignment = Alignment(horizontal='center')
            cell.fill = PatternFill(start_color="CCCCCC", end_color="CCCCCC", fill_type="solid")

        # Agregar datos
        for row, column in enumerate(table.columns, start=2):
            ws.cell(row=row, column=1, value=column.name).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=2, value=column.data_type).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=3, value=column.length).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=4, value=column.col_type).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=5, value=column.default_value).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=6, value=column.description).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=7, value=column.constraint_name).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=8, value=column.constraint_type).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=9, value=column.constraint_column).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=10, value=column.reference_table).alignment = Alignment(horizontal='center')
            ws.cell(row=row, column=11, value=column.reference_column).alignment = Alignment(horizontal='center')

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

    wb.save('diccionario_datos_mejorado.xlsx')

# Leer el contenido del archivo SQL
with open('data.sql', 'r') as file:
    sql_content = file.read()

# Parsear las tablas
tables = parse_create_table(sql_content)

# Crear el archivo Excel
create_excel(tables)

print("El diccionario de datos ha sido generado en 'diccionario_datos_mejorado.xlsx'")
