SET SERVEROUTPUT ON

DECLARE
max_p_take PROTEIN.P_take%type;
age1 NEED.age%type;
qua NEED.W_need%type;

BEGIN
SELECT MAX(P_take) INTO max_p_take 
 FROM PROTEIN;
 DBMS_OUTPUT.PUT_LINE('The maximum needed PROTEIN is : ' || max_p_take);

if age1 < 18 AND qua < 2.1 then
dbms_output.put_line('Enough Quantity');

elseif age1 > 18 AND qua = 2.1 then
dbms_output.put_line('Enough Quantity');

else 
dbms_output.put_line(' NOT Enough Quantity');
end if;
end;
/

DECLARE

 CURSOR new IS SELECT name, age FROM USERS ;
 new_record new%ROWTYPE;
BEGIN

OPEN new;
 LOOP

 FETCH new INTO new_record;
 EXIT WHEN new%ROWCOUNT > 3;
 DBMS_OUTPUT.PUT_LINE ('Name : ' || new_record.name || ' ' || 
new_record.age);
 END LOOP;

 CLOSE new;
END ;
/

--generating function

CREATE OR REPLACE FUNCTION avg_age_func RETURN NUMBER IS
 avg_age USERS.age%type;
BEGIN
 SELECT AVG(age) INTO avg_age
 FROM EMPLOYEES;
 RETURN avg_age;
END;
/

--function calling

BEGIN
dbms_output.put_line('Average AGE of USERS : ' || avg_age_func );
END;
/

--creating TRIGGER

CREATE TRIGGER LIMIT BEFORE UPDATE OR INSERT ON NEED FOR EACH ROW 
BEGIN
IF :NEW.age<=2 THEN
:NEW.W_need:=1.0;
ELSIF :NEW.age>2 AND :NEW.age <= 10 THEN
:NEW.W_need:=1.5;
ELSIF :NEW.age>10 AND :NEW.age<=20 THEN
:NEW.W_need:=2.2;
ELSIF :NEW.age>20 THEN
:NEW.W_need:=2.6;
END IF;
END LIMIT ;
/

--transection management

BEGIN

DROP TABLE DEMO;
CREATE TABLE DEMO(
Id int,
Name Varchar (10)
);
INSERT INTO DEMO VALUES (1, 'A');
INSERT INTO  DEMO VALUES (2, 'B');
INSERT INTO DEMO VALUES (3, 'C');
INSERT INTO DEMO VALUES (4, 'D');
COMMIT;
INSERT INTO test VALUES (5, 'E');
SAVEPOINT cont_5;
INSERT INTO test VALUES (6, 'F');
INSERT INTO test VALUES (7, 'G');
SAVEPOINT cont_7;
ROLLBACK TO cont_6;
select * from DEMO;
END;
/

