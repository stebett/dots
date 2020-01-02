months_dict = {
    "01": "Gennaio",
    "02": "Febbraio",
    "03": "Marzo",
    "04": "Aprile",
    "05": "Maggio",
    "06": "Giugno",
    "07": "Luglio",
    "08": "Agosto",
    "09": "Settembre",
    "10": "Ottobre",
    "11": "Novembre",
    "12": "Dicembre"}


def get_tex_name():
    import os
    import re
    dirs = os.listdir()
    name = None
    for filename in dirs:
        if '.tex' in filename:
            raw_name = filename
            obj = re.match(r'(\w+)_(\d+)', raw_name)
            if obj:
                name = obj.group(1) + ' ' + obj.group(2)

    return name


def get_lesson_dir():
    import os
    dir_path = os.getcwd()
    target = dir_path.split('/')[-2]
    return target


def get_date():
    import datetime
    now = datetime.datetime.now()

    day = str(now.day) + ' ' if str(now.day)[0] != 0 else str(now.day)[1]
    month = months_dict[str(now.month)] + ' '
    year = str(now.year)

    return day + month + year
