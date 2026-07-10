using PatientService as service from '../../srv/patient-service';


annotate service.Diagnoses with @(

    UI.HeaderInfo : {

        TypeName : 'Diagnosis',
        TypeNamePlural : 'Diagnoses',

        Title : {
            $Type : 'UI.DataField',
            Value : title
        },

        Description : {
            $Type : 'UI.DataField',
            Value : description
        }
    },


    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Diagnosis',
            Value : title
        },

        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description
        }

    ],


    UI.FieldGroup #DiagnosisInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Diagnosis',
                Value : title
            },

            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description
            }

        ]

    },


    UI.Facets : [

        {
            $Type : 'UI.ReferenceFacet',
            ID : 'DiagnosisInformationFacet',
            Label : 'Diagnosis Information',
            Target : '@UI.FieldGroup#DiagnosisInformation'
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID : 'DoctorFacet',
            Label : 'Doctor',
            Target : 'doctor/@UI.FieldGroup#DoctorInformation'
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PrescriptionFacet',
            Label : 'Prescriptions',
            Target : 'prescriptions/@UI.LineItem'
        }

    ]

);
annotate service.Doctors with @(

    UI.FieldGroup #DoctorInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

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
                Label : 'Category',
                Value : category
            }

        ]

    }

);
annotate service.Prescriptions with @(

    UI.HeaderInfo : {

        TypeName : 'Prescription',
        TypeNamePlural : 'Prescriptions',

        Title : {
            $Type : 'UI.DataField',
            Value : title
        },

        Description : {
            $Type : 'UI.DataField',
            Value : description
        }

    },


    UI.LineItem : [

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

    ],


    UI.FieldGroup #PrescriptionInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

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

    },


    UI.Facets : [

        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PrescriptionInformation',
            Label : 'Prescription Information',
            Target : '@UI.FieldGroup#PrescriptionInformation'
        }

    ]

);