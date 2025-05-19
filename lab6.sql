CREATE OR REPLACE PROCEDURE merge_RollCall_Data AS
    CURSOR N_RollCall_Cursor IS
        SELECT * FROM N_RollCall;

    v_N_RollCall_Record N_RollCall%ROWTYPE;
    v_count NUMBER;

BEGIN
    FOR v_N_RollCall_Record IN N_RollCall_Cursor LOOP
        SELECT COUNT(*)
        INTO v_count
        FROM O_RollCall
        WHERE EmpNo = v_N_RollCall_Record.EmpNo
          AND Roll_Date = v_N_RollCall_Record.Roll_Date;

        IF v_count = 0 THEN
            INSERT INTO O_RollCall (EmpNo, Roll_Date, Status)
            VALUES (
                v_N_RollCall_Record.EmpNo,
                v_N_RollCall_Record.Roll_Date,
                v_N_RollCall_Record.Status
            );
        END IF;
    END LOOP;

    COMMIT;
END merge_RollCall_Data;
/
