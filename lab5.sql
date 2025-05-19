DECLARE
v_E_id Employee.E_id%TYPE;
v_E_name
Employee.E_name%TYPE; v_Age
Employee.Age%TYPE; v_Salary
Employee.Salary%TYPE;

-- Declare cursor for the Employee table
CURSOR emp_cursor IS
SELECT E_id, E_name, Age, Salary
FROM Employee;
BEGIN
-- Open the cursor
OPEN emp_cursor;

-- Fetch values from the cursor
LOOP
FETCH emp_cursor INTO v_E_id, v_E_name, v_Age, v_Salary;

-- Exit the loop if no more rows to fetch
EXIT WHEN
emp_cursor%NOTFOUND;

-- Process fetched values (You can perform any operation here)
DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_E_id || ', Employee Name: ' ||
v_E_name || ', Age: ' || v_Age ||', Salary: ' || v_Salary); END LOOP;

-- Close the cursor
CLOSE
emp_cursor;
END;
/
