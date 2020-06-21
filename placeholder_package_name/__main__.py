"""
This file makes a module runnable with `python -m`.
"""

import sys

from placeholder_package_name.console import Console

def main(args):
    console = Console()

    try:
        return 0
    except Exception as ex:
        console.error(ex)
        return 1

if __name__ == '__main__':
    exit(main(sys.argv))