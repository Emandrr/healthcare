using { healthcare } from '../db/schema.cds';

@requires: 'patient'
service PatientService {


    @readonly
    entity Diagnoses as projection on healthcare.Diagnosis;

    @readonly
    entity Doctors as projection on healthcare.Doctor;

    @readonly
    entity Prescriptions as projection on healthcare.Prescription;

}