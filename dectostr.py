"""Código para pasar de decimal a binario (ej: 2.5_10 = 10.1_2).
"""

import sys


def int_to_bin_str(int_value: int) -> str:
    """Tomo un entero y devuelvo un str en binario (ej: 5_10 -> 101_2).
    """
    dividend = abs(int_value)
    bin_str = ''
    quotient = dividend  # Para 1 y 0

    while dividend >= 2:
        quotient = int(dividend / 2)
        remainder = dividend % 2
        dividend = quotient

        bin_str = str(remainder) + bin_str

    bin_str = str(quotient) + bin_str

    if int_value < 0:
        bin_str = '-' + bin_str

    return bin_str


def dec_to_bin_str(dec_value: float) -> str:
    """Tomo un float y devuelvo un str en binario (ej: 2.5_10 -> 10.1_2).
    """
    int_part = int(dec_value)
    dec_part = abs(dec_value) - abs(int_part)

    if int_part != 0:
        bin_str = int_to_bin_str(int_part) + '.'
    else:
        bin_str = '0.'

    while dec_part != 0:
        dec_part *= 2
        bin_str += '%i' % int(dec_part)

        if dec_part >= 1:
            dec_part -= 1

    return bin_str


def format_dec_bin_str_as_bytes(bin_str: str) -> str:
    """Tomo el str devuelto por dec_to_bin_str y lo separo cada 4 bits
    (ej: 10001.110111 -> 1 0001.11 0111)
    """
    parts = bin_str.split('.')
    int_str = parts[0][::-1]
    dec_str = parts[1][::-1]

    int_str = ' '.join([int_str[i:i+4] for i in range(0, len(int_str), 4)])
    dec_str = ' '.join([dec_str[i:i+4] for i in range(0, len(dec_str), 4)])

    int_str = int_str[::-1]
    dec_str = dec_str[::-1]

    return int_str + '.' + dec_str


if __name__ == '__main__':

    if len(sys.argv) != 2:
        print("Uso: dectostr.py numero")
    else:
        usr_input = float(sys.argv[1])
        number_str = dec_to_bin_str(usr_input)
        bit_cnt = len(number_str) - 1  # No cuento el punto decimal
        print(format_dec_bin_str_as_bytes(number_str),
              '(%i bits + signo)' % bit_cnt, sep='\n', end='\n\n')
