CREATE TABLE STOCKpg (
    STOCK_ID int PRIMARY KEY NOT NULL,
    STOCK_TYPE varchar(255) NOT NULL,
    STOCK_MODEL varchar(255) NOT NULL,
    MANUFACTURER varchar(255) NOT NULL
);

CREATE TABLE CUSTOMERpg (
    CUST_ID varchar(255) PRIMARY KEY NOT NULL,
    CUST_FNAME varchar(255) NOT NULL,
    CUST_SNAME varchar(255) NOT NULL,
    CUST_ADDRESS varchar(255) NOT NULL,
    CUST_CONTACT int NOT NULL
);

CREATE TABLE REPAIRSpg (
    REPAIR_ID int PRIMARY KEY NOT NULL,
    REPAIR_WORK varchar(255) NOT NULL,
    REPAIR_DATE DATE NOT NULL,
    REPAIR_HOURS varchar(255)NOT NULL
);

CREATE TABLE SALESpg (
    SALES_NUM int PRIMARY KEY NOT NULL,
    SALES_DATE DATE NOT NULL,
    SALES_AMT varchar(255) NOT NULL,
    STOCK_ID int NOT NULL,
    CUST_ID varchar(225) NOT NULL,
    REPAIR_ID int NOT NULL,
    FOREIGN KEY (STOCK_ID) REFERENCES STOCKpg(STOCK_ID),
    FOREIGN KEY (CUST_ID) REFERENCES CUSTOMERpg(CUST_ID),
    FOREIGN KEY (REPAIR_ID) REFERENCES REPAIRSpg(REPAIR_ID)
);

INSERT INTO STOCKpg(STOCK_ID, STOCK_TYPE, STOCK_MODEL, MANUFACTURER)
VALUES (12345, 'Desktop','Prolin K100','Acer');
INSERT INTO STOCKpg(STOCK_ID, STOCK_TYPE, STOCK_MODEL, MANUFACTURER)
VALUES (54321,'Laptop','J55', 'Mecer');
INSERT INTO STOCKpg(STOCK_ID, STOCK_TYPE, STOCK_MODEL, MANUFACTURER)
VALUES (78945, 'Server', 'HP9000', 'Samsung');
INSERT INTO STOCKpg(STOCK_ID, STOCK_TYPE, STOCK_MODEL, MANUFACTURER)
VALUES (98754, 'Laptop', 'Aspire 450', 'HP');
INSERT INTO STOCKpg(STOCK_ID, STOCK_TYPE, STOCK_MODEL, MANUFACTURER)
VALUES (55311, 'Notebook', 'L920', 'Lenovo');

INSERT INTO CUSTOMERpg( CUST_ID, CUST_FNAME, CUST_SNAME, CUST_ADDRESS, CUST_CONTACT)
VALUES('C115', 'Jeff', 'Willis', '3 Main Road',0821253659 );
INSERT INTO CUSTOMERpg( CUST_ID, CUST_FNAME, CUST_SNAME, CUST_ADDRESS, CUST_CONTACT)
VALUES('C116', 'Andre', 'Watson', '13 Cape Road', 0769658547);
INSERT INTO CUSTOMERpg( CUST_ID, CUST_FNAME, CUST_SNAME, CUST_ADDRESS, CUST_CONTACT)
VALUES('C117', 'Wallis', 'Smith', '3 Mountain Road', 0863256574);
INSERT INTO CUSTOMERpg( CUST_ID, CUST_FNAME, CUST_SNAME, CUST_ADDRESS, CUST_CONTACT)
VALUES('C118', 'Alex ', 'Hanson', '8 Circle Road', 0762356587);
INSERT INTO CUSTOMERpg( CUST_ID, CUST_FNAME, CUST_SNAME, CUST_ADDRESS, CUST_CONTACT)
VALUES('C119', 'Bob', 'Bitterhout', '15 Main Road', 0821235258);
INSERT INTO CUSTOMERpg( CUST_ID, CUST_FNAME, CUST_SNAME, CUST_ADDRESS, CUST_CONTACT)
VALUES('C120', 'Thando', 'Zolani', '88 Summer Road', 0847541254);
INSERT INTO CUSTOMERpg( CUST_ID, CUST_FNAME, CUST_SNAME, CUST_ADDRESS, CUST_CONTACT)
VALUES('C121', 'Phillip', 'Jackson', '3 Long Road', 0745556658);
INSERT INTO CUSTOMERpg( CUST_ID, CUST_FNAME, CUST_SNAME, CUST_ADDRESS, CUST_CONTACT)
VALUES('C122', 'Sarah', 'Jones', '7 Sea Road', 0814745745);

INSERT INTO REPAIRSpg(REPAIR_ID, REPAIR_WORK, REPAIR_DATE, REPAIR_HOURS)
VALUES(1, 'HD defragmentation', TO_DATE('15/JUL/23', 'dd/MM/yyyy'), 2);
INSERT INTO REPAIRSpg(REPAIR_ID, REPAIR_WORK, REPAIR_DATE, REPAIR_HOURS)
VALUES(2, 'RAM module replaced. Time taken to diagnose problem', TO_DATE('18/JUL/23', 'dd/MM/yyyy'), 3);
INSERT INTO REPAIRSpg(REPAIR_ID, REPAIR_WORK, REPAIR_DATE, REPAIR_HOURS)
VALUES(3, 'Battery Replaced', TO_DATE('19/JUL/23', 'dd/MM/yyyy'), 2);
INSERT INTO REPAIRSpg(REPAIR_ID, REPAIR_WORK, REPAIR_DATE, REPAIR_HOURS)
VALUES(4, 'OS Upgraded', TO_DATE('20/JUL/23', 'dd/MM/yyyy'), 2);
INSERT INTO REPAIRSpg(REPAIR_ID, REPAIR_WORK, REPAIR_DATE, REPAIR_HOURS)
VALUES(5, 'Faulty hard disk replaced', TO_DATE('25/JUL/23', 'dd/MM/yyyy'), 3);

INSERT INTO SALESpg(SALES_NUM, SALES_DATE, SALES_AMT, STOCK_ID, CUST_ID, REPAIR_ID)
VALUES(101, TO_DATE('27/JUL/23', 'dd/MM/yyyy'), 1700, 98754, 'C121', 3);
INSERT INTO SALESpg(SALES_NUM, SALES_DATE, SALES_AMT, STOCK_ID, CUST_ID, REPAIR_ID)
VALUES(102, TO_DATE('20/JUL/23', 'dd/MM/yyyy'), 1500, 12345, 'C120', 4);
INSERT INTO SALESpg(SALES_NUM, SALES_DATE, SALES_AMT, STOCK_ID, CUST_ID, REPAIR_ID)
VALUES(103, TO_DATE('23/JUL/23', 'dd/MM/yyyy'), 1650, 55311, 'C119', 5);
INSERT INTO SALESpg(SALES_NUM, SALES_DATE, SALES_AMT, STOCK_ID, CUST_ID, REPAIR_ID)
VALUES(104, TO_DATE('17/JUL/23', 'dd/MM/yyyy'), 1300, 54321, 'C117', 2);
INSERT INTO SALESpg(SALES_NUM, SALES_DATE, SALES_AMT, STOCK_ID, CUST_ID, REPAIR_ID)
VALUES(105, TO_DATE('19/JUL/23', 'dd/MM/yyyy'), 1900, 12345, 'C122', 1);

//Q2
SELECT 
    CUSTOMERpg.CUST_FNAME || ' ' || CUSTOMERpg.CUST_SNAME AS CUST_NAME,
    REPAIRSpg.REPAIR_WORK,
    REPAIRSpg.REPAIR_DATE,
    REPAIRSpg.REPAIR_HOURS
FROM 
    SALESpg
JOIN 
    CUSTOMERpg ON SALESpg.CUST_ID = CUSTOMERpg.CUST_ID
JOIN    
    REPAIRSpg ON SALESpg.REPAIR_ID = REPAIRSpg.REPAIR_ID
WHERE 
    REPAIRSpg.REPAIR_HOURS < 3;
    
//Q3
SET SERVEROUTPUT ON;
DECLARE 
    V_CUST_ID varchar(255);
    V_STOCK_TYPE varchar(255);
    V_SALES_AMOUNT varchar(255);
BEGIN
    SELECT sl.CUST_ID, st.STOCK_TYPE, sl.SALES_AMT
    INTO V_CUST_ID, V_STOCK_TYPE, V_SALES_AMOUNT
    FROM SALESpg sl
    INNER JOIN STOCKpg st ON sl.STOCK_ID = st.STOCK_ID
    WHERE sl.SALES_AMT < 1500;
    
    DBMS_OUTPUT.PUT_LINE('CUSTOMER ID: ' || V_CUST_ID);
    DBMS_OUTPUT.PUT_LINE('STOCK TYPE: ' || V_STOCK_TYPE);
    DBMS_OUTPUT.PUT_LINE('V_SALES_AMOUNT: R' || V_SALES_AMOUNT);
END;
//Q4
SET SERVEROUTPUT ON;
DECLARE 
    V_CUST_ID varchar(255);
    V_STOCK_ID varchar(255);
    V_SALES_NUM INT;
    V_REPAIR_ID INT;
    V_SALES_AMOUNT varchar(255);
    V_COMMISSION_PAYABLE INT;
BEGIN
    FOR dis IN (SELECT sl.CUST_ID, sl.STOCK_ID, sl.SALES_NUM, sl.REPAIR_ID, sl.SALES_AMT
                INTO V_CUST_ID, V_STOCK_ID, V_SALES_NUM, V_REPAIR_ID, V_SALES_AMOUNT
                FROM SALESpg sl)
    LOOP
        V_CUST_ID := dis.CUST_ID;
        V_STOCK_ID := dis.STOCK_ID;
        V_SALES_NUM := dis.SALES_NUM;
        V_REPAIR_ID := dis.REPAIR_ID;
        V_SALES_AMOUNT := dis.SALES_AMT;
        
        
        DBMS_OUTPUT.PUT_LINE('CUSTOMER ID : ' || V_CUST_ID);
        DBMS_OUTPUT.PUT_LINE('STOCK ID : ' || V_STOCK_ID);
        DBMS_OUTPUT.PUT_LINE('SALES NUMBER : ' || V_SALES_NUM);
        DBMS_OUTPUT.PUT_LINE('REPAIR ID : ' || V_REPAIR_ID);
        DBMS_OUTPUT.PUT_LINE('SALES AMOUNT : R' || V_SALES_AMOUNT);
        
        IF V_SALES_AMOUNT < 1000 THEN
            V_COMMISSION_PAYABLE := V_SALES_AMOUNT * 0.05;
            DBMS_OUTPUT.PUT_LINE('COMMISSION PAYABLE : R' || V_COMMISSION_PAYABLE);
        ELSIF V_SALES_AMOUNT BETWEEN 1000 AND 1500 THEN
            V_COMMISSION_PAYABLE := V_SALES_AMOUNT * 0.10;
            DBMS_OUTPUT.PUT_LINE('COMMISSION PAYABLE : R' || V_COMMISSION_PAYABLE);
        ELSIF V_SALES_AMOUNT >= 1500 THEN
            V_COMMISSION_PAYABLE := V_SALES_AMOUNT * 0.15;    
            DBMS_OUTPUT.PUT_LINE('COMMISSION PAYABLE : R' || V_COMMISSION_PAYABLE);
        ELSE 
            V_COMMISSION_PAYABLE := 0;  
        END IF;
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------');
    END LOOP;
END;
//Q5
CREATE VIEW Repair_View AS
SELECT c.CUST_FNAME || ' ' || c.CUST_SNAME AS Customer_Name,
       st.STOCK_ID,
       r.REPAIR_DATE,
       r.REPAIR_WORK
FROM SALESpg sl
JOIN CUSTOMERpg c ON sl.CUST_ID = c.CUST_ID
JOIN STOCKpg st ON sl.STOCK_ID = st.STOCK_ID
JOIN REPAIRSpg r ON sl.REPAIR_ID = r.REPAIR_ID;

SELECT * FROM Repair_View;
//Q6
CREATE OR REPLACE TRIGGER Sales_Entry
BEFORE INSERT OR UPDATE ON SALESpg
FOR EACH ROW
BEGIN
 IF :NEW.SALES_AMT < 0 THEN
 RAISE_APPLICATION_ERROR(-20001, 'Sales Amount must be not be negative');
 END IF;
END;

INSERT INTO SALESpg(SALES_NUM, SALES_DATE, SALES_AMT, STOCK_ID, CUST_ID, REPAIR_ID)
VALUES(1669, TO_DATE('27/JUL/23', 'dd/MM/yyyy'), 69, 69, 'C169', 69);
//Q7
CREATE OR REPLACE PROCEDURE sp_customer_details 
(P_SALES_NUM IN SALESpg.SALES_NUM%TYPE)
IS
    V_CUST_ID CUSTOMERpg.CUST_ID%TYPE;
    V_CUST_FNAME CUSTOMERpg.CUST_FNAME%TYPE;
    V_CUST_SNAME CUSTOMERpg.CUST_SNAME%TYPE;
    V_CUST_CONTACT CUSTOMERpg.CUST_CONTACT%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Input sales number: ' || P_SALES_NUM);
    
    SELECT c.CUST_ID,
           c.CUST_FNAME,
           c.CUST_SNAME,
           c.CUST_CONTACT
    INTO V_CUST_ID, V_CUST_FNAME, V_CUST_SNAME, V_CUST_CONTACT
    FROM SALESpg sl
    JOIN CUSTOMERpg c ON sl.CUST_ID = c.CUST_ID
    WHERE sl.SALES_NUM = P_SALES_NUM;
    
    DBMS_OUTPUT.PUT_LINE('CUSTOMER ID: ' || V_CUST_ID);
    DBMS_OUTPUT.PUT_LINE('FIRST NAME: ' || V_CUST_FNAME);
    DBMS_OUTPUT.PUT_LINE('SURNAME: ' || V_CUST_SNAME);
    DBMS_OUTPUT.PUT_LINE('CONTACT NUMBER: 0' || V_CUST_CONTACT);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------');
    EXCEPTION WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No customer found for the given sales number: ' || P_SALES_NUM);
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occured!' || SQLERRM);
END sp_customer_details;
DROP PROCEDURE sp_customer_details;

SET SERVEROUTPUT ON;

BEGIN
    sp_customer_details(101);
END;

BEGIN
    sp_customer_details(169);
END;
//Q8
CREATE OR REPLACE FUNCTION fn_ITGear 
(P_CUST_ID IN CUSTOMERpg.CUST_ID%TYPE)
RETURN VARCHAR2
IS
    V_STOCK_TYPE STOCKpg.STOCK_TYPE%TYPE;
    V_STOCK_MODEL STOCKpg.STOCK_MODEL%TYPE;
    V_MANUFACTURER STOCKpg.MANUFACTURER%TYPE;
    V_REPAIR_WORK REPAIRSpg.REPAIR_WORK%TYPE;
    V_RESULT VARCHAR(1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Input customer ID: ' || P_CUST_ID);
BEGIN    
    SELECT st.STOCK_TYPE,
           st.STOCK_MODEL,
           st.MANUFACTURER,
           r.REPAIR_WORK
    INTO V_STOCK_TYPE, V_STOCK_MODEL, V_MANUFACTURER, V_REPAIR_WORK
    FROM SALESpg sl
    JOIN STOCKpg st ON sl.STOCK_ID = st.STOCK_ID
    JOIN REPAIRSpg r ON sl.REPAIR_ID = r.REPAIR_ID
    JOIN CUSTOMERpg c ON sl.CUST_ID = c.CUST_ID
    WHERE c.CUST_ID = P_CUST_ID;
    
    
    V_RESULT := 'Customer ID: ' || P_CUST_ID || CHR(10) || 
                'Stock Type: ' || V_STOCK_TYPE || CHR(10) ||
                'Stock Model: ' || V_STOCK_MODEL || CHR(10) ||
                'Manufacturer : ' || V_MANUFACTURER || CHR(10) ||
                'Repair Work: ' || V_REPAIR_WORK || CHR(10);
    RETURN V_RESULT;
    
    EXCEPTION WHEN NO_DATA_FOUND THEN
    RETURN 'No items found for the given customer ID: ' || P_CUST_ID;
    WHEN OTHERS THEN
    RETURN 'An error occured!' || SQLERRM;
    END;
END fn_ITGear;

DROP FUNCTION fn_ITGear;

SET SERVEROUTPUT ON;

DECLARE
    V_RESULT VARCHAR2(1000);
BEGIN
    V_RESULT := fn_ITGear('C121');
    DBMS_OUTPUT.PUT_LINE(V_RESULT);
END;

DECLARE
    V_RESULT VARCHAR2(1000);
BEGIN
    V_RESULT := fn_ITGear('C69');
    DBMS_OUTPUT.PUT_LINE(V_RESULT);
END;
//Q9









