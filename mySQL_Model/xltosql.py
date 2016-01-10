#-*- coding: utf-8 -*-

import xlrd
import MySQLdb
import datetime
import pprint

# Open the workbook and define the worksheet
book = xlrd.open_workbook("vehicules.xls")
sheet = book.sheet_by_name("Feuil1")

# Establish a MySQL connection
database = MySQLdb.connect (host="localhost", user = "root", passwd = "root", db = "mydb")

# Get the cursor, which is used to traverse the database, line by line
cursor = database.cursor()

# Create the INSERT INTO sql query
query_start = "INSERT INTO vehicules ("
query_end = "VALUES ("
# Create a For loop to iterate through each row in the XLS file, starting at row 2 to skip the headers
#for r in range(0, sheet.nrows):
update_start = "UPDATE vehicules SET "
update_end = ""
#Get header of vehicule's table
header = []
r=0
for name in range(0, sheet.ncols-1):
    current = sheet.cell(r,name).value
    if (name==87):
        current = "km_maxi"
    if (name==89):
        current = "KM_d_pass"
    if (name==92):
        current = "km_en_cours_d_pass"
    if (name==95):
        current = "type_dur_e_courte_moyenne"

    current = current.replace(" ","_")
    current = current.replace("/","_")
    current = current.replace(">","_")
    current = current.replace("(","_")
    current = current.replace(")","_")
    current = current.replace(u'é','_')
    current = current.replace(u'è','_')
    current = current.replace("__","_")
    if (current[-1]=='_'):
        current[-1] = ""
    query_start = query_start + current + ", "
    query_end   = query_end   + "%s, "
    update_end = update_end + current + '='+"%s, "
    header.append(current)
    print " index : " + str(name) + "  ||  "+current

name = sheet.ncols-1
current = sheet.cell(r,name).value
current = current.replace(" ","_")
current = current.replace("/","_")
current = current.replace(">","_")
current = current.replace("(","_")
current = current.replace(")","_")
current = current.replace(u'é','_')
current = current.replace(u'è','_')
current = current.replace("__","_")

query_start = query_start + current + ") "
query_end   = query_end   + "%s)"
update_end = update_end + current + '='+"%s WHERE IMMAT=%s"
header.append(current)
print " index : " + str(name) + "  ||  "+current

query = query_start + query_end
#print(query)
update = update_start + update_end
#Create a hashset for correspondace between vehicule data and headers
hashset = dict()
for element in header:
    hashset[element] = []


for rows in range(1, sheet.nrows):
    values = []
    for cols in range(0,sheet.ncols):
        hashset[header[cols]].append(sheet.cell(rows,cols).value)
        if (cols in [5,8,15,17,21,22,30,31,39,41,44,49]):
            try:
                print(datetime.date(1899,12,31) + datetime.timedelta(days=sheet.cell(rows,cols).value))
                values.append(datetime.date(1899,12,31) + datetime.timedelta(days=sheet.cell(rows,cols).value))
            except :
                values.append(None)
                pass
        else:
            if isinstance(sheet.cell(rows,cols).value, float):
                values.append(int(sheet.cell(rows,cols).value))
            else:
                values.append(sheet.cell(rows,cols).value)
    for value in values:
        if value == '' or value == ' ':
            values[values.index(value)] = None

    # Execute sql Query
    sqlq = "SELECT COUNT(1) FROM vehicules WHERE IMMAT = '%s'" %values[1]
    print sqlq
    cursor.execute(sqlq)
    if cursor.fetchone()[0]:
        print values
        values = list(values)
        values.append(values[1])
        cursor.execute(update, values)
    else:
        cursor.execute(query, values)


# Close the cursor
cursor.close()

# Commit the transaction
database.commit()

# Close the database connection
database.close()

# Print results
print ""
print "All Done! Bye, for now."
print ""
columns = str(sheet.ncols)
rows = str(sheet.nrows)
print "I just imported " +columns+  " columns and " +rows+ " rows to MySQL!"
