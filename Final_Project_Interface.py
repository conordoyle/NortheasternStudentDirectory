import pymysql
import pandas as pd

## this is for password hiding
## from getpass4 import getpass
"""
user = input("Hello, please enter your MYSQL Username: \n")
password = input("Now please enter your MYSQL Password: \n")
"""
user = "root"
password = "root"


def create_account():
    try:
        nuid = input("Ok, input your nuid: \n")
        password = input("Input your password: \n")
        first_name = input("Input your first name: \n")
        last_name = input("Input your last name: \n")
        email = input("Input your email: \n")

        cur.callproc('AddStudent', (nuid, password, first_name, last_name, email))
        cnx.commit()
    except:
        print(
            "Sorry, input was not accepted. "
            "Please make sure you type everything in the correct format, and don't use already existing data")
        return create_account()

    nuid = input("Now log in again. Please enter your nuid: \n")
    password = input("Now please enter your NU Password: \n")
    cur.callproc('CheckLogin', (nuid, password))
    result = cur.fetchone()
    login = result['login_success']
    return login


def check_table(table_name):
    try:
        c2.execute(f"SHOW TABLES LIKE '{table_name}'")
        result = c2.fetchone()

        return result
    except:
        print("Sorry, that table doesn't exist")
        return False


try:
    cnx = pymysql.connect(host='localhost', user=user,
                          password=password,
                          db='project3', charset='utf8mb4',
                          cursorclass=pymysql.cursors.DictCursor)

except pymysql.err.OperationalError as e:
    print('Error: %d: %s' % (e.args[0], e.args[1]))

try:
    cur = cnx.cursor()
    login = False

    print("Connection established")

    nuid = input(
        "Now, please enter your nuid for access to HuskyInvolvement. "
        "If you do not have a current account, please enter the word 'create': \n")
    if nuid.lower() == "create":
        login = create_account()
    else:
        password = input("Now please enter your NU Password: \n")
        cur.callproc('CheckLogin', (nuid, password))
        result = cur.fetchone()
        login = result['login_success']

    while not login:
        nuid = input("Sorry, those credentials were incorrect, please re-enter your nuid or type 'create': \n")
        if nuid.lower() == 'create':
            login = create_account()
            if login:
                break
            else:
                continue
        password = input("Now please enter your NU Password: \n")
        cur.callproc('CheckLogin', (nuid, password))
        result = cur.fetchone()
        login = result['login_success']

    cur.close()

    c2 = cnx.cursor()

    while login:
        print("Welcome to HuskyInvolvement! Your data is saved in the database."
              " Permitted actions are Create, View, Update, and Delete data. You may also type 'logout' to logout")
        action = input("Please type an action: \n").lower()
        # add something so they can see the tables?
        # also to show current info

        if action == "create":
            table_name = input("Type the name of the table to add data to. To exit, type 'exit':").lower()
            table_exists = check_table(table_name)
            if table_name == "exit" or (not table_exists):
                pass
            else:
                # need more info for student_club, student_major, student_sport.
                if table_name == "student_club":
                    club_name = input("Input the name of the club you are creating for yourself: \n")
                    club_type = input("Input the type of club in one word: \n")
                    club_description = input("Input the description of the club: \n")

                    try:
                        club_sql = "INSERT INTO club (clubName, type_of_club, description) VALUES (%s, %s, %s)"
                        club_values = (club_name, club_type, club_description)
                        c2.execute(club_sql, club_values)
                        cnx.commit()

                        student_club_sql = "INSERT INTO student_club (nuid, clubName) VALUES (%s, %s)"
                        student_club_values = (nuid, club_name)
                        c2.execute(student_club_sql, student_club_values)
                        cnx.commit()

                        print("Success!")
                    except:
                        print("Sorry, either the data you put in is not valid, or the data you entered is duplicate")

                elif table_name == "student_major":
                    department_name = input("Input the name of your major's department: \n")
                    department_dean = input("Input the name of the department dean: \n")
                    majorcode = input("Input the major code: \n")
                    major_name = input("Input the major name: \n")
                    degree_type = input("Input the degree type: \n")

                    try:

                        sql = "INSERT INTO department (name, dean) VALUES (%s, %s)"
                        values = (department_name, department_dean)
                        c2.execute(sql, values)
                        cnx.commit()

                        sql = "INSERT INTO major (majorcode, name, type_of_degree, department_name) " \
                              "VALUES (%s, %s, %s, %s)"
                        values = (majorcode, major_name, degree_type, department_name)
                        c2.execute(sql, values)
                        cnx.commit()

                        sql = "INSERT INTO student_major (nuid, major_name) VALUES (%s, %s)"
                        values = (nuid, major_name)
                        c2.execute(sql, values)
                        cnx.commit()

                        print("Success!")
                    except:
                        print("Sorry, either the data you put in is not valid, or the data you entered is duplicate")

                elif table_name == "companyinternship":
                    name = input("Input the name of your internship: \n")
                    type = input("Input the type of the internship: \n")
                    started = input("Input the starting year: \n")
                    description = input("Input the description: \n")
                    roleTitle = input("Input the role title: \n")

                    try:

                        sql = "INSERT INTO companyinternship VALUES (%s, %s)"
                        values = (name, type)
                        c2.execute(sql, values)
                        cnx.commit()

                        sql = "INSERT INTO internship VALUES (%s, %s, %s, %s, %s)"
                        values = (name, started, description, roleTitle, nuid)
                        c2.execute(sql, values)
                        cnx.commit()

                        print("Success!")
                    except:
                        print("Sorry, either the data you put in is not valid, or the data you entered is duplicate")


                elif table_name == "student_sport":
                    sport_name = input("Input the name of your sport: \n")
                    position = input("Input the position you play: \n")

                    try:

                        sql = "INSERT INTO varsitySport (nameOfSport, position) VALUES (%s, %s)"
                        values = (sport_name, position)
                        c2.execute(sql, values)
                        cnx.commit()

                        sql = "INSERT INTO student_sport (nuid, sport_sportName) VALUES (%s, %s)"
                        values = (nuid, sport_name)
                        c2.execute(sql, values)
                        cnx.commit()

                        print("Success!")
                    except:
                        print("Sorry, either the data you put in is not valid, or the data you entered is duplicate")


                elif table_name == "job":
                    job_name = input("Input the name of your job: \n")
                    job_id = input("Input the job id: \n")
                    on_off_campus = input("Input whether the job is on or off-campus (on or off): \n")
                    job_title = input("Input the job title: \n")

                    try:

                        sql = "INSERT INTO job (job_id, job_name, on_off_campus, job_title, nuid) " \
                              "VALUES (%s, %s, %s, %s, %s)"
                        values = (job_id, job_name, on_off_campus, job_title, nuid)
                        c2.execute(sql, values)
                        cnx.commit()

                        print("Success!")
                    except:
                        print("Sorry, either the data you put in is not valid, or the data you entered is duplicate")

                elif table_name == "contact":
                    email = input("Input your email: \n")
                    phonenumber = input("Input your phone #: \n")
                    linkedin = input("Input your linked in: \n")

                    try:

                        sql = "INSERT INTO contact (email, phonenumber, linkedin, nuid) VALUES (%s, %s, %s, %s)"
                        values = (email, phonenumber, linkedin, nuid)
                        c2.execute(sql, values)
                        cnx.commit()

                        print("Success!")
                    except:
                        print("Sorry, either the data you put in is not valid, or the data you entered is duplicate")

                elif table_name == "research":
                    researchName = input("Input the name of the research: \n")
                    professorAssociated = input("Input the professor associated: \n")
                    yearStarted = input("Input the year you started: \n")
                    description = input("Input the description: \n")

                    try:

                        sql = "INSERT INTO research (researchName, professorAssociated, yearStarted, description) " \
                              "VALUES (%s, %s, %s, %s)"
                        values = (researchName, professorAssociated, yearStarted, description)
                        c2.execute(sql, values)
                        cnx.commit()

                        print("Success!")
                    except:
                        print("Sorry, either the data you put in is not valid, or the data you entered is duplicate")



        elif action == "view":
            print("Here are all the tables in HuskyInvolvement")
            show_query = "SHOW TABLES"
            c2.execute(show_query)
            cnx.commit()
            tables = c2.fetchall()
            formatted_tables = pd.DataFrame(tables)
            print(formatted_tables)

            table_name = input("Type in name of the table to add data to. To exit, type 'exit:").lower()
            table_exists = check_table(table_name)
            if table_name == "exit":
                pass
            elif not table_exists:
                print("That is not a table within HuskyInvolvement!")
            else:
                read_query = ""
                if table_name == "student":
                    read_query = f"SELECT nuid, student_fn, student_ln, contact_email FROM {table_name}"

                else:
                    read_query = f"SELECT * FROM {table_name}"

                c2.execute(read_query)
                cnx.commit()
                rows = c2.fetchall()
                df = pd.DataFrame(rows)
                print(df)


        elif action == "update":
            update_table = input(
                "Enter the table you want to update. To exit, type 'exit':\n").lower()
            table_exists = check_table(update_table)
            if update_table == "exit" or (not table_exists):
                pass
            else:

                """if update_table in ["research", "contact", "coop", "student_club", "student_sport", "student_major",
                                    "internship", "job", "scholarship", "student"]:
                    update_column = input(
                        "Enter the field you want to update. If you need assistance, please revert back and write "
                        "'view' to see the names and rows of the table. \n")
                    update_value = input("Enter the new value. Make sure it is that same data type as before.\n")

                    try:
                        update_query = f"UPDATE {update_table} SET {update_column} = (%s) WHERE nuid = (%s)"
                        update_values = (update_value, nuid)
                        c2.execute(update_query, update_values)
                        cnx.commit()
                        print("It is updated!")

                    except:

                        print("Sorry, you do not have permission to update. "
                              "You can only update yourself in this database.")"""

                if update_table == "student_club":
                    update_column = input(
                        "Enter the field you want to update. \n")
                    update_value = input("Enter the new value. Make sure it is that same data type as before.\n")
                    try:
                        club_update_query = f"UPDATE club SET {update_column} = %s WHERE clubName " \
                                            f"IN (SELECT clubName FROM student_club WHERE nuid = %s)"
                        club_update_values = (update_value, nuid)

                        # Execute the club update query
                        c2.execute(club_update_query, club_update_values)

                        # Update query for the student_club table
                        student_club_update_query = f"UPDATE {update_table} SET {update_column} = %s WHERE nuid = %s"
                        student_club_update_values = (update_value, nuid)

                        # Execute the student_club update query
                        c2.execute(student_club_update_query, student_club_update_values)

                        # Commit the changes
                        cnx.commit()
                        print("It is updated!")
                    except:
                        print("sorry, this update is not allowed")



                elif update_table == "student_sport":
                    update_column = input(
                        "Enter the field you want to update. \n")
                    update_value = input("Enter the new value. Make sure it is that same data type as before.\n")
                    try:

                        club_update_query = f"UPDATE varsitySport SET {update_column} = %s WHERE sportName " \
                                            f"IN (SELECT sportName FROM student_sport WHERE nuid = %s)"
                        club_update_values = (update_value, nuid)

                        # Execute the club update query
                        c2.execute(club_update_query, club_update_values)

                        # Update query for the student_club table
                        student_club_update_query = f"UPDATE {update_table} SET {update_column} = %s WHERE nuid = %s"
                        student_club_update_values = (update_value, nuid)

                        # Execute the student_club update query
                        c2.execute(student_club_update_query, student_club_update_values)

                        # Commit the changes
                        cnx.commit()
                        print("It is updated!")
                    except:
                        print("sorry, this update is not allowed")



                elif update_table == "student_major":
                    update_column = input(
                        "Enter the field you want to update. \n")
                    update_value = input("Enter the new value. Make sure it is that same data type as before.\n")

                    try:
                        club_update_query = f"UPDATE major SET {update_column} = %s WHERE name IN " \
                                            f"(SELECT name FROM student_major WHERE nuid = %s)"
                        club_update_values = (update_value, nuid)

                        # Execute the club update query
                        c2.execute(club_update_query, club_update_values)

                        # Update query for the student_club table
                        student_club_update_query = f"UPDATE {update_table} SET {update_column} = %s WHERE nuid = %s"
                        student_club_update_values = (update_value, nuid)

                        # Execute the student_club update query
                        c2.execute(student_club_update_query, student_club_update_values)

                        # Commit the changes
                        cnx.commit()
                        print("It is updated!")
                    except:
                        print("sorry, this update is not allowed")







                elif update_table == "coop":
                    update_column = input(
                        "Enter the field you want to update. \n")
                    update_value = input("Enter the new value. Make sure it is that same data type as before.\n")

                    try:
                        club_update_query = f"UPDATE companycoop SET {update_column} = %s " \
                                            f"WHERE companyName IN (SELECT companyName FROM coop WHERE nuid = %s)"
                        club_update_values = (update_value, nuid)

                        # Execute the club update query
                        c2.execute(club_update_query, club_update_values)

                        # Update query for the student_club table
                        student_club_update_query = f"UPDATE {update_table} SET {update_column} = %s WHERE nuid = %s"
                        student_club_update_values = (update_value, nuid)

                        # Execute the student_club update query
                        c2.execute(student_club_update_query, student_club_update_values)

                        # Commit the changes
                        cnx.commit()
                        print("It is updated!")
                    except:
                        print("sorry, this update is not allowed")




                elif update_table in ["contact", "research", "job", "internship"]:
                    update_column = input(
                        "Enter the field you want to update. \n")
                    update_value = input("Enter the new value. Make sure it is that same data type as before.\n")

                    try:
                        update_query = f"UPDATE {update_table} SET {update_column} = (%s) WHERE nuid = (%s)"
                        update_values = (update_value, nuid)
                        c2.execute(update_query, update_values)
                        cnx.commit()
                        print("It is updated!")

                    except:

                        print("Sorry, this update was not allowed")

                else:
                    print("Sorry, you do not have permission to update. You can only update yourself in this database.")
                # if inputted table is one of the connecting tables, reinput
                # also take into consideration the tables that are not associated with an nuid

            pass
        elif action == "delete":
            delete_table = input(
                "Enter the table you want to delete. "
                "Remember, you can only delete things that are associated to you. To exit, type 'exit':\n").lower()
            table_exists = check_table(delete_table)
            if delete_table == "exit" or (not table_exists):
                pass
            else:

                if delete_table in ["research", "contact", "coop", "student_club", "student_sport", "student_major",
                                    "internship", "job", "scholarship", "student"]:
                    are_you_sure = input(
                        "Are you sure you want to delete? Write 'yes' or 'no'. "
                        "Remember you can only delete anything that is associated with you. \n").lower()

                    if are_you_sure == "yes":
                        # or "Yes" or "yes." or "Yes." or "yes " or "Yes " or "yes. " or "Yes. "
                        print("test?")

                        delete_query = f"DELETE FROM {delete_table} WHERE nuid = %s"
                        delete_values = (nuid,)
                        c2.execute(delete_query, delete_values)
                        cnx.commit()
                        print("It is deleted!")
                    else:
                        print("ok lol.")
                else:
                    print("Sorry, you can only delete anything that is associated with you.")

        elif action == "logout":
            login = False
        else:
            print("Sorry, that is not one of the actions")

    c2.close()



except pymysql.err.OperationalError as e:
    print("Hello")
    print('Error: %d: %s' % (e.args[0], e.args[1]))

try:
    cnx.close()

except:
    pass
