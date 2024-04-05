// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract healthrecordsystem is AccessControl {

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant PATIENT_ROLE = keccak256("PATIENT_ROLE");
    bytes32 public constant NURSE_ROLE = keccak256("NURSE_ROLE");
    bytes32 public constant ORTHO_DOCTOR_ROLE = keccak256("ORTHO_DOCTOR_ROLE");
    bytes32 public constant NEURO_DOCTOR_ROLE = keccak256("NEURO_DOCTOR_ROLE");
    bytes32 public constant CARDIO_DOCTOR_ROLE = keccak256("CARDIO_DOCTOR_ROLE");
    bytes32 public constant GASTRO_DOCTOR_ROLE = keccak256("GASTRO_DOCTOR_ROLE");
    bytes32 public constant URO_DOCTOR_ROLE = keccak256("URO_DOCTOR_ROLE");


    mapping(uint => bool) public isDeleted;
    mapping(address => Person) public persons;
    mapping(address => Hospital) public hospitals;


//Orthopedics Test
    struct OrthopedicsTestReport {
    uint medicalRecordNumber;
    string patientName;
    uint age;
    string gender;
    string address1;
    string bloodGroup;
    string allergies;
    uint testDate;

    string testName;
    string testResult;
    string xrayTestReport;
    string mriTestReport;
    string ctScanTestReport;
    string ultrasoundTestReport;
    string testDescription;

    string examinationFindings;

    string diagnosis;

    string treatmentPlan;

    string prescription;

    string followUpRecommendations;


    string doctorName;
    string department;
    string hospitalClinic;
    string contactInformation;

    uint reportDate;
    }


//Neurology Test
    struct NeurologyTestReport {
    uint medicalRecordNumber;
    string patientName;
    uint age;
    string gender;
    string address1;
    string bloodGroup;
    string allergies;
    uint testDate;

    string testName;
    string testResult;
    string neurologicalExaminationReport;
    string eegReport;
    string lumbarPunctureReport;
    string neuropsychologicalTestingReport;
    string geneticTestingReport;
    string testDescription;

    string examinationFindings;

    string diagnosis;

    string treatmentPlan;

    string prescription;

    string followUpRecommendations;

    string doctorName;
    string department;
    string hospitalClinic;
    string contactInformation;

    uint reportDate;
}


//Cardiology Test
struct CardiologyTestReport {
    uint medicalRecordNumber;
    string patientName;
    uint age;
    string gender;
    string address1;
    string bloodGroup;
    string allergies;
    uint testDate;

    string testName;
    string testResult;
    string electrocardiogramReport;
    string echocardiogramReport;
    string stressTestReport;
    string cardiacMRIReport;
    string testDescription;

    string examinationFindings;

    string diagnosis;

    string treatmentPlan;

    string prescription;

    string followUpRecommendations;

    string doctorName;
    string department;
    string hospitalClinic;
    string contactInformation;

    uint reportDate;
}




// Gastroenterology Test
struct GastroenterologyTestReport {
    uint medicalRecordNumber;
    string patientName;
    uint age;
    string gender;
    string address1;
    string bloodGroup;
    string allergies;
    uint testDate;

    string testName;
    string testResult;
    string breathTestsReport;
    string liverBiopsyReport;
    string upperEndoscopyReport;
    string capsuleEndoscopyReport;
    string testDescription;

    string examinationFindings;

    string diagnosis;

    string treatmentPlan;

    string prescription;

    string followUpRecommendations;

    string doctorName;
    string department;
    string hospitalClinic;
    string contactInformation;

    uint reportDate;
}


struct UrologyTestReport {
    uint medicalRecordNumber;
    string patientName;
    uint age;
    string gender;
    string address1;
    string bloodGroup;
    string allergies;
    uint testDate;

    string testName;
    string testResult;
    string urinalysisReport;
    string urinaryCultureReport;
    string cystoscopyReport;
    string prostateBiopsyReport;
    string testDescription;

    string examinationFindings;
    
    string diagnosis;

    string treatmentPlan;

    string prescription;

    string followUpRecommendations;

    string doctorName;
    string department;
    string hospitalClinic;
    string contactInformation;

    uint reportDate;
}


    uint public orthoRecordId;
    mapping(uint => OrthopedicsTestReport) orthoRecords;
    uint public neuroRecordId;
    mapping(uint => NeurologyTestReport) neuroRecords;
    uint public cardioRecordId;
    mapping(uint => CardiologyTestReport) cardioRecords;
    uint public uroRecordId;
    mapping(uint => UrologyTestReport) uroRecords;
    uint public gastroRecordId;
    mapping(uint => GastroenterologyTestReport) gastroRecords;

    struct Person {
        string title;
        string firstName;
        string middleName;
        string lastName;
        uint dateOfJoining;
        string residentialAddress;
        string[] phoneNumbers;
    }
    
    struct Hospital {
        string hospitalName;
        string hospitalAddress;
        string phoneNumber;
        string website;
    }


    event healthrecordsystem__AddRecord(
        uint recordId,
        uint timestamp,
        string name,
        uint age,
        string gender,
        string bloodType,
        string allergies,
        string diagnosis,
        string treatment
    );


    event healthrecordsystem__DeleteRecord(
        uint recordId,
        uint timestamp,
        string name,
        uint age,
        string gender,
        string bloodType,
        string allergies,
        string diagnosis,
        string treatment
    );



    function addOrthopedicsTestReport(
        uint _medicalRecordNumber,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _address1,
        string memory _bloodGroup,
        string memory _allergies,
        uint _testDate,
        string memory _testName,
        string memory _testResult,
        string memory _xrayTestReport,
        string memory _mriTestReport,
        string memory _ctScanTestReport,
        string memory _ultrasoundTestReport,
        string memory _testDescription,
        string memory _examinationFindings,
        string memory _diagnosis,
        string memory _treatmentPlan,
        string memory _prescription,
        string memory _followUpRecommendations,
        string memory _doctorName,
        string memory _department,
        string memory _hospitalClinic,
        string memory _contactInformation,
        uint _reportDate
    ) public {
        orthoRecordId++;
        orthoRecords[orthoRecordId] = OrthopedicsTestReport(
            _medicalRecordNumber,
            _patientName,
            _age,
            _gender,
            _address1,
            _bloodGroup,
            _allergies,
            _testDate,
            _testName,
            _testResult,
            _xrayTestReport,
            _mriTestReport,
            _ctScanTestReport,
            _ultrasoundTestReport,
            _testDescription,
            _examinationFindings,
            _diagnosis,
            _treatmentPlan,
            _prescription,
            _followUpRecommendations,
            _doctorName,
            _department,
            _hospitalClinic,
            _contactInformation,
            _reportDate
        );
    }

    


    function addNeurologyTestReport(
        uint _medicalRecordNumber,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _address1,
        string memory _bloodGroup,
        string memory _allergies,
        uint _testDate,
        string memory _testName,
        string memory _testResult,
        string memory _neurologyexaminationTestReport,
        string memory _electroencephalogramTestReport,
        string memory _lumbarpunctureTestReport,
        string memory _neuropsychologicalTestReport,
        string memory _geneticTestReport,
        string memory _testDescription,
        string memory _examinationFindings,
        string memory _diagnosis,
        string memory _treatmentPlan,
        string memory _prescription,
        string memory _followUpRecommendations,
        string memory _doctorName,
        string memory _department,
        string memory _hospitalClinic,
        string memory _contactInformation,
        uint _reportDate
    ) public {
        neuroRecordId++;
        neuroRecords[neuroRecordId] = NeurologyTestReport(
            _medicalRecordNumber,
            _patientName,
            _age,
            _gender,
            _address1,
            _bloodGroup,
            _allergies,
            _testDate,
            _testName,
            _testResult,
            _neurologyexaminationTestReport,
            _electroencephalogramTestReport,
            _lumbarpunctureTestReport,
            _neuropsychologicalTestReport,
            _geneticTestReport,
            _testDescription,
            _examinationFindings,
            _diagnosis,
            _treatmentPlan,
            _prescription,
            _followUpRecommendations,
            _doctorName,
            _department,
            _hospitalClinic,
            _contactInformation,
            _reportDate
        );

    }


function addCardiologyTestReport(
        uint _medicalRecordNumber,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _address1,
        string memory _bloodGroup,
        string memory _allergies,
        uint _testDate,
        string memory _testName,
        string memory _testResult,
        string memory _electrocardiogramTestReport,
        string memory _echocardiogramTestReport,
        string memory _stressTestReport,
        string memory _cardiacmriTestReport,
        string memory _testDescription,
        string memory _examinationFindings,
        string memory _diagnosis,
        string memory _treatmentPlan,
        string memory _prescription,
        string memory _followUpRecommendations,
        string memory _doctorName,
        string memory _department,
        string memory _hospitalClinic,
        string memory _contactInformation,
        uint _reportDate
    ) public {
        cardioRecordId++;
        cardioRecords[cardioRecordId] = CardiologyTestReport(
            _medicalRecordNumber,
            _patientName,
            _age,
            _gender,
            _address1,
            _bloodGroup,
            _allergies,
            _testDate,
            _testName,
            _testResult,
            _electrocardiogramTestReport,
            _echocardiogramTestReport,
            _stressTestReport,
            _cardiacmriTestReport,
            _testDescription,
            _examinationFindings,
            _diagnosis,
            _treatmentPlan,
            _prescription,
            _followUpRecommendations,
            _doctorName,
            _department,
            _hospitalClinic,
            _contactInformation,
            _reportDate
        );

    }


    function addGastroenterologyTestReport(
        uint _medicalRecordNumber,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _address1,
        string memory _bloodGroup,
        string memory _allergies,
        uint _testDate,
        string memory _testName,
        string memory _testResult,
        string memory _breathTestReport,
        string memory _liverbiospyTestReport,
        string memory _upperendoscopyTestReport,
        string memory _capsuleendoscopyTestReport,
        string memory _testDescription,
        string memory _examinationFindings,
        string memory _diagnosis,
        string memory _treatmentPlan,
        string memory _prescription,
        string memory _followUpRecommendations,
        string memory _doctorName,
        string memory _department,
        string memory _hospitalClinic,
        string memory _contactInformation,
        uint _reportDate
    ) public {
        gastroRecordId++;
        gastroRecords[gastroRecordId] = GastroenterologyTestReport(
            _medicalRecordNumber,
            _patientName,
            _age,
            _gender,
            _address1,
            _bloodGroup,
            _allergies,
            _testDate,
            _testName,
            _testResult,
            _breathTestReport,
            _liverbiospyTestReport,
            _upperendoscopyTestReport,
            _capsuleendoscopyTestReport,
            _testDescription,
            _examinationFindings,
            _diagnosis,
            _treatmentPlan,
            _prescription,
            _followUpRecommendations,
            _doctorName,
            _department,
            _hospitalClinic,
            _contactInformation,
            _reportDate
        );

    }


function addUrologyTestReport(
        uint _medicalRecordNumber,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _address1,
        string memory _bloodGroup,
        string memory _allergies,
        uint _testDate,
        string memory _testName,
        string memory _testResult,
        string memory _urinalysisTestReport,
        string memory _urinarycultureTestReport,
        string memory _cystoscopyTestReport,
        string memory _prostatebiopsyTestReport,
        string memory _testDescription,
        string memory _examinationFindings,
        string memory _diagnosis,
        string memory _treatmentPlan,
        string memory _prescription,
        string memory _followUpRecommendations,
        string memory _doctorName,
        string memory _department,
        string memory _hospitalClinic,
        string memory _contactInformation,
        uint _reportDate
    ) public {
        uroRecordId++;
        uroRecords[uroRecordId]= UrologyTestReport(
            _medicalRecordNumber,
            _patientName,
            _age,
            _gender,
            _address1,
            _bloodGroup,
            _allergies,
            _testDate,
            _testName,
            _testResult,
            _urinalysisTestReport,
            _urinarycultureTestReport,
            _cystoscopyTestReport,
            _prostatebiopsyTestReport,
            _testDescription,
            _examinationFindings,
            _diagnosis,
            _treatmentPlan,
            _prescription,
            _followUpRecommendations,
            _doctorName,
            _department,
            _hospitalClinic,
            _contactInformation,
            _reportDate
        );

    }





    // function addRecord(
    //     string memory _name,
    //     uint _age,
    //     string memory _gender,
    //     string memory _bloodType,
    //     string memory _allergies,
    //     string memory _diagnosis,
    //     string memory _treatment
    // ) public {
    //     recordId++;
    //     records[recordId] = Record(
    //         recordId,
    //         block.timestamp,
    //         _name,
    //         _age,
    //         _gender,
    //         _bloodType,
    //         _allergies,
    //         _diagnosis,
    //         _treatment
    //     );
    //     emit healthrecordsystem__AddRecord(
    //         recordId,
    //         block.timestamp,
    //         _name,
    //         _age,
    //         _gender,
    //         _bloodType,
    //         _allergies,
    //         _diagnosis,
    //         _treatment
    //     );
    // }


    // function deleteRecord(uint _recordId) public {
    //     require(!isDeleted[_recordId], "The record is already deleted");
    //     Record storage record = records[_recordId];
    //     emit healthrecordsystem__DeleteRecord(
    //         record.recordId,
    //         block.timestamp,
    //         record.name,
    //         record.age,
    //         record.gender,
    //         record.bloodType,
    //         record.allergies,
    //         record.diagnosis,
    //         record.treatment
    //     );
    //     isDeleted[_recordId] = true;
    // }


    // function getRecord(
    //     uint _recordId
    // )
    //     public
    //     view
    //     returns (
    //         uint,
    //         string memory,
    //         uint,
    //         string memory,
    //         string memory,
    //         string memory,
    //         string memory,
    //         string memory
    //     )
    // {
    //     Record storage record = records[_recordId];
    //     return (
    //         record.timestamp,
    //         record.name,
    //         record.age,
    //         record.gender,
    //         record.bloodType,
    //         record.allergies,
    //         record.diagnosis,
    //         record.treatment
    //     );
    // }


//     function getRecordDetails(uint _recordId) public view returns (
//     uint, 
//     uint, 
//     string memory, 
//     uint, 
//     string memory, 
//     string memory, 
//     string memory, 
//     string memory, 
//     string memory,
//     string memory
// ) {
//     require(_recordId <= recordId, "Record ID exceeds maximum");
//     require(!isDeleted[_recordId], "Record does not exist or has been deleted");
//     Record storage record = records[_recordId];
//     return (
//         record.recordId,
//         record.timestamp,
//         record.name,
//         record.age,
//         record.gender,
//         record.bloodType,
//         record.allergies,
//         record.diagnosis,
//         record.treatment,
//         "Record found"
//     );
// }


    function getOrthopedicsTestReportDetails(uint _medicalRecordNumber) public view returns (
        uint,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        uint
    ) {
        OrthopedicsTestReport storage report = orthoRecords[_medicalRecordNumber];
        require(report.medicalRecordNumber != 0, "Orthopedics test report not found");
        
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.address1,
            report.bloodGroup,
            report.allergies,
            report.testDate,
            report.testName,
            report.testResult,
            report.xrayTestReport,
            report.mriTestReport,
            report.ctScanTestReport,
            report.ultrasoundTestReport,
            report.testDescription,
            report.examinationFindings,
            report.diagnosis,
            report.treatmentPlan,
            report.prescription,
            report.followUpRecommendations,
            report.doctorName,
            report.department,
            report.hospitalClinic,
            report.contactInformation,
            report.reportDate
        );
    }



    function getUrologyTestReportDetails(uint _medicalRecordNumber) public view returns (
        uint,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        uint
    ) {
        UrologyTestReport storage report = uroRecords[_medicalRecordNumber];
        require(report.medicalRecordNumber != 0, "Urology test report not found");
        
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.address1,
            report.bloodGroup,
            report.allergies,
            report.testDate,
            report.testName,
            report.testResult,
            report.urinalysisReport,
            report.urinaryCultureReport,
            report.cystoscopyReport,
            report.prostateBiopsyReport,
            report.testDescription,
            report.examinationFindings,
            report.diagnosis,
            report.treatmentPlan,
            report.prescription,
            report.followUpRecommendations,
            report.doctorName,
            report.department,
            report.hospitalClinic,
            report.contactInformation,
            report.reportDate
        );
    }

    function getNeurologyTestReportDetails(uint _medicalRecordNumber) public view returns (
        uint,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        uint
    ) {
        NeurologyTestReport storage report = neuroRecords[_medicalRecordNumber];
        require(report.medicalRecordNumber != 0, "Neurology test report not found");
        
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.address1,
            report.bloodGroup,
            report.allergies,
            report.testDate,
            report.testName,
            report.testResult,
            report.neurologicalExaminationReport,
            report.eegReport,
            report.lumbarPunctureReport,
            report.neuropsychologicalTestingReport,
            report.geneticTestingReport,
            report.testDescription,
            report.examinationFindings,
            report.diagnosis,
            report.treatmentPlan,
            report.prescription,
            report.followUpRecommendations,
            report.doctorName,
            report.department,
            report.hospitalClinic,
            report.contactInformation,
            report.reportDate
        );
    }


    function getGastroenterologyTestReportDetails(uint _medicalRecordNumber) public view returns (
        uint,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        uint
    ) {
        GastroenterologyTestReport storage report = gastroRecords[_medicalRecordNumber];
        require(report.medicalRecordNumber != 0, "Gastroenterology test report not found");
        
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.address1,
            report.bloodGroup,
            report.allergies,
            report.testDate,
            report.testName,
            report.testResult,
            report.breathTestsReport,
            report.liverBiopsyReport,
            report.upperEndoscopyReport,
            report.capsuleEndoscopyReport,
            report.testDescription,
            report.examinationFindings,
            report.diagnosis,
            report.treatmentPlan,
            report.prescription,
            report.followUpRecommendations,
            report.doctorName,
            report.department,
            report.hospitalClinic,
            report.contactInformation,
            report.reportDate
        );
    }

    function getCardiologyTestReportDetails(uint _medicalRecordNumber) public view returns (
        uint,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        uint
    ) {
        CardiologyTestReport storage report = cardioRecords[_medicalRecordNumber];
        require(report.medicalRecordNumber != 0, "Cardiology test report not found");
        
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.address1,
            report.bloodGroup,
            report.allergies,
            report.testDate,
            report.testName,
            report.testResult,
            report.electrocardiogramReport,
            report.echocardiogramReport,
            report.stressTestReport,
            report.cardiacMRIReport,
            report.testDescription,
            report.examinationFindings,
            report.diagnosis,
            report.treatmentPlan,
            report.prescription,
            report.followUpRecommendations,
            report.doctorName,
            report.department,
            report.hospitalClinic,
            report.contactInformation,
            report.reportDate
        );
    }


    
}
