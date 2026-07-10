using DoctorService as service from '../../srv/doctor-service';

annotate service.Patients with @(
    UI.HeaderInfo : {
        TypeName       : 'Patient',
        TypeNamePlural : 'Patients',
        Title          : {
            $Type : 'UI.DataField',
            Value : firstName
        },
        Description : {
            $Type : 'UI.DataField',
            Value : lastName
        }
    },

    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : userId
            },
            {
                $Type : 'UI.DataField',
                Label : 'First Name',
                Value : firstName
            },
            {
                $Type : 'UI.DataField',
                Label : 'Last Name',
                Value : lastName
            },
            {
                $Type : 'UI.DataField',
                Label : 'Date of Birth',
                Value : dateOfBirth
            }
        ]
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'GeneralInformationFacet',
            Label  : 'Patient Information',
            Target : '@UI.FieldGroup#GeneralInformation'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'DiagnosesFacet',
            Label  : 'Diagnoses',
            Target : 'diagnoses/@UI.LineItem'
        }
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'First Name',
            Value : firstName
        },
        {
            $Type : 'UI.DataField',
            Label : 'Last Name',
            Value : lastName
        },
        {
            $Type : 'UI.DataField',
            Label : 'Date of Birth',
            Value : dateOfBirth
        }
    ]
);

annotate service.Diagnoses with {
    doctor @Common.ValueList: {
        CollectionPath : 'Doctors',
        Parameters     : [
            {
                $Type               : 'Common.ValueListParameterInOut',
                LocalDataProperty   : doctor_ID,
                ValueListProperty   : 'ID'
            },
            {
                $Type               : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty   : 'firstName'
            },
            {
                $Type               : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty   : 'lastName'
            },
            {
                $Type               : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty   : 'category'
            }
        ]
    };
};

annotate service.Diagnoses with @(
    UI.HeaderInfo : {
        TypeName       : 'Diagnosis',
        TypeNamePlural : 'Diagnoses',
        Title          : {
            $Type : 'UI.DataField',
            Value : title
        }
    },

    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description
        },
        {
            $Type : 'UI.DataField',
            Label : 'Doctor',
            Value : doctor_ID
        }
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            ![@UI.Hidden] : true
        },
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description
        },
        {
            $Type : 'UI.DataField',
            Label : 'Doctor',
            Value : doctor_ID
        }
    ],

    UI.FieldGroup #DiagnosisInfo : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description
            },
            {
                $Type : 'UI.DataField',
                Label : 'Doctor',
                Value : doctor_ID
            }
        ]
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'DiagnosisInfoFacet',
            Label  : 'Information',
            Target : '@UI.FieldGroup#DiagnosisInfo'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'PrescriptionsFacet',
            Label  : 'Prescriptions',
            Target : 'prescriptions/@UI.LineItem'
        }
    ]
);

annotate service.Prescriptions with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            ![@UI.Hidden] : true
        },
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description
        }
    ]
);