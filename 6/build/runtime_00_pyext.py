

import csv
from collections import OrderedDict

csv_int_files = {}
def CSVRdInt(fname, rowidx, colidx):
    """
    Return value at row/column pointed by integer indexes
    Assumes data starts at first row and first column, no headers.
    """
    global csv_int_files
    data = csv_int_files.get(fname, None)
    if data is None:
        data = list()
        try:
            csvfile = open(fname, 'rt', encoding='utf-8')
        except IOError:
            return "#FILE_NOT_FOUND"
        try:
            dialect = csv.Sniffer().sniff(csvfile.read(1024))
            csvfile.seek(0)
            reader = csv.reader(csvfile, dialect)
            for row in reader:
                data.append(row)
        except csv.Error as e:
            return "#CSV_ERROR"
        finally:
            csvfile.close()
        csv_int_files[fname] = data

    try:
        row = data[rowidx]
        if not row and rowidx == len(data)-1:
            raise IndexError
    except IndexError:
        return "#ROW_NOT_FOUND"

    try:
        return row[colidx]
    except IndexError:
        return "#COL_NOT_FOUND"


csv_str_files = {}
def CSVRdStr(fname, rowname, colname):
    """
    Return value at row/column pointed by a pair of names as string
    Assumes first row is column headers and first column is row name.
    """
    global csv_str_files
    entry = csv_str_files.get(fname, None)
    if entry is None:
        data = dict()
        try:
            csvfile = open(fname, 'rt', encoding='utf-8')
        except IOError:
            return "#FILE_NOT_FOUND"
        try:
            dialect = csv.Sniffer().sniff(csvfile.read(1024))
            csvfile.seek(0)
            reader = csv.reader(csvfile, dialect)
            headers = dict([(name, index) for index, name in enumerate(reader.__next__()[1:])])
            for row in reader:
                data[row[0]] = row[1:]
        except csv.Error:
            return "#CSV_ERROR"
        finally:
            csvfile.close()
        csv_str_files[fname] = (headers, data)
    else:
        headers, data = entry

    try:
        row = data[rowname]
    except KeyError:
        return "#ROW_NOT_FOUND"

    try:
        colidx = headers[colname]
    except KeyError:
        return "#COL_NOT_FOUND"

    try:
        return row[colidx]
    except IndexError:
        return "#COL_NOT_FOUND"


def CSVWrInt(fname, rowidx, colidx, content):
    """
    Update value at row/column pointed by integer indexes
    Assumes data starts at first row and first column, no headers.
    """

    global csv_int_files
    dialect = None
    data = csv_int_files.get(fname, None)
    if data is None:
        data = list()
        try:
            csvfile = open(fname, 'rt', encoding='utf-8')
        except IOError:
            return "#FILE_NOT_FOUND"
        try:
            dialect = csv.Sniffer().sniff(csvfile.read(1024))
            csvfile.seek(0)
            reader = csv.reader(csvfile, dialect)
            for row in reader:
                data.append(row)
        except csv.Error as e:
            return "#CSV_ERROR"
        finally:
            csvfile.close()
        csv_int_files[fname] = data

    try:
        if rowidx == len(data):
            row = []
            data.append(row)
        else:
            row = data[rowidx]
    except IndexError:
        return "#ROW_NOT_FOUND"

    try:
        if rowidx > 0 and colidx >= len(data[0]):
            raise IndexError
        if colidx >= len(row):
            row.extend([""] * (colidx - len(row)) + [content])
        else:
            row[colidx] = content
    except IndexError:
        return "#COL_NOT_FOUND"

    try:
        wfile = open(fname, 'wt')
        writer = csv.writer(wfile) if not(dialect) else csv.writer(wfile, dialect)
        for row in data:
            writer.writerow(row)
    finally:
        wfile.close()

    return "OK"


def pyext_csv_reload():
    global csv_int_files, csv_str_files
    csv_int_files.clear()
    csv_str_files.clear()

