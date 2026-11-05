DELIMITER //
CREATE PROCEDURE GetPatientHistory(IN PatientID VARCHAR(10))
BEGIN
        SELECT
        concat_ws(' ',p.patient_firstname,
        p.patient_lastname) AS PATIENT,
        CONCAT_WS(' ',c.designation,c.clinician_firstname,
        c.clinician_lastname) AS DOCTOR,
		a.app_date,
        a.app_time,
        d.diagnosis
    FROM Appointment a
    INNER JOIN patient p on a.patient_id = p.patient_id
    INNER JOIN clinician c ON a.clinician_id = c.clinician_id
    LEFT JOIN diagnosis d ON a.appointment_id = d.appointment_id
    WHERE a.patient_id = PatientID
    ORDER BY a.app_date DESC;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER valid_followup_date
BEFORE INSERT ON follow_Up
FOR EACH ROW
BEGIN
    DECLARE v_app_date DATE;

    SELECT app_date INTO v_app_date
    FROM Appointment
    WHERE appointment_id = NEW.appointment_id;

    IF NEW.due_date < v_app_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Integrity Error: Follow-up date
cannot be earlier than the original appointment date.';
    END IF;
END //
DELIMITER ;


