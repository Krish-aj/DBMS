create or replace trigger salary_difference_trigger_1
  before insert or update or delete on customer
  for each row
  declare
  v_old_salary Number;
  v_new_salary number;
  BEGIN
  IF inserting or updating then
  v_old_salary:=NVL(:OLD.SALARY, 0);
  v_new_salary:=NVL(:NEW.SALARY, 0);
  DBMS_OUTPUT.PUT_LINE('Salary difference for'||:NEW.NAME||':'||(v_new_salary - v_old_salary));
   END IF;
  IF deleting then
  v_old_salary:=NVL(:OLD.SALARY,0);
  DBMS_OUTPUT.PUT_LINE('Salary difference for '||:OLD.NAME||':'||(-v_old_salary));
   END IF;
  END;
   /
