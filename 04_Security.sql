USE crownfielddb;
-- Roles
CREATE ROLE 'Administrator', 'Doctor', 'Receptionist', 'Patient';

-- Administrator
GRANT ALL PRIVILEGES ON crownfielddb.* TO 'Administrator';

-- Doctor
GRANT SELECT ON crownfielddb.patient TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON crownfielddb.diagnosis TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON crownfielddb.prescription TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON crownfielddb.medicines TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON crownfielddb.follow_up TO 'Doctor';

-- Receptionist
GRANT SELECT, INSERT, UPDATE ON crownfielddb.patient TO 'Receptionist';
GRANT SELECT, INSERT, UPDATE ON crownfielddb.appointment TO 'Receptionist';
GRANT SELECT ON crownfielddb.clinician TO 'Receptionist';

-- Patient
GRANT SELECT ON crownfielddb.appointment TO 'Patient';

-- Hashing sensitive fields

-- adding a column for patient portal password
ALTER TABLE patient ADD COLUMN account_password VARCHAR(256);

-- store password securely
UPDATE Patient
SET Account_Password = SHA2('TempPass123!', 256)
WHERE Patient_ID = 'OP001';



PREPARE SecurePatientSearch FROM 'SELECT patient_firstname, patient_lastname, postcode, email, phone FROM patient WHERE Patient_ID = ?'

SET @user_input = 'OP002';

EXECUTE SecurePatientSearch USING @user_input;

DEALLOCATE PREPARE SecurePatientSearch;