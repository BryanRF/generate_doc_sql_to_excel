# sql_data_types.py
import re
from typing import Dict, Any
SQL_DATA_TYPES = {
    'INT': {'category': 'Numeric', 'needs_length': False, 'default_length': None},
    'BIGINT': {'category': 'Numeric', 'needs_length': False, 'default_length': None},
    'SMALLINT': {'category': 'Numeric', 'needs_length': False, 'default_length': None},
    'TINYINT': {'category': 'Numeric', 'needs_length': False, 'default_length': None},
    'DECIMAL': {'category': 'Numeric', 'needs_length': True, 'default_length': '(10,2)'},
    'NUMERIC': {'category': 'Numeric', 'needs_length': True, 'default_length': '(10,2)'},
    'FLOAT': {'category': 'Numeric', 'needs_length': False, 'default_length': None},
    'REAL': {'category': 'Numeric', 'needs_length': False, 'default_length': None},
    'VARCHAR': {'category': 'String', 'needs_length': True, 'default_length': '(255)'},
    'CHAR': {'category': 'String', 'needs_length': True, 'default_length': '(1)'},
    'TEXT': {'category': 'String', 'needs_length': False, 'default_length': None},
    'NVARCHAR': {'category': 'String', 'needs_length': True, 'default_length': '(255)'},
    'NCHAR': {'category': 'String', 'needs_length': True, 'default_length': '(1)'},
    'NTEXT': {'category': 'String', 'needs_length': False, 'default_length': None},
    'DATE': {'category': 'Date/Time', 'needs_length': False, 'default_length': None},
    'TIME': {'category': 'Date/Time', 'needs_length': False, 'default_length': None},
    'DATETIME': {'category': 'Date/Time', 'needs_length': False, 'default_length': None},
    'TIMESTAMP': {'category': 'Date/Time', 'needs_length': False, 'default_length': None},
    'BOOLEAN': {'category': 'Boolean', 'needs_length': False, 'default_length': None},
    'ENUM': {'category': 'Enumeration', 'needs_length': True, 'default_length': None},
    'BINARY': {'category': 'Binary', 'needs_length': True, 'default_length': None},
    'VARBINARY': {'category': 'Binary', 'needs_length': True, 'default_length': None}
}

def get_data_type_info(data_type: str) -> Dict[str, Any]:
    data_type_upper = data_type.upper()
    if data_type_upper in SQL_DATA_TYPES:
        return SQL_DATA_TYPES[data_type_upper]
    return {'category': 'Unknown', 'needs_length': False, 'default_length': None}

def parse_column_data_type(data_type: str) -> Dict[str, Any]:
    data_type_info = get_data_type_info(data_type.split('(')[0])
    needs_length = data_type_info.get('needs_length', False)
    default_length = data_type_info.get('default_length', None)
    actual_length = ''
    
    if needs_length:
        match = re.search(r'\((.*?)\)', data_type)
        if match:
            actual_length = match.group(1)
        else:
            actual_length = default_length
    
    return {
        'category': data_type_info['category'],
        'data_type': data_type_info['category'],
        'length': actual_length
    }