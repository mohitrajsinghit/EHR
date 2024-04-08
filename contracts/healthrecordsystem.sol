// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract healthrecordsystem is AccessControl {

    error CallerNotMinter(address caller);

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant PATIENT_ROLE = keccak256("PATIENT_ROLE");
    bytes32 public constant NURSE_ROLE = keccak256("NURSE_ROLE");
    bytes32 public constant ORTHO_DOCTOR_ROLE = keccak256("ORTHO_DOCTOR_ROLE");
    bytes32 public constant NEURO_DOCTOR_ROLE = keccak256("NEURO_DOCTOR_ROLE");
    bytes32 public constant CARDIO_DOCTOR_ROLE = keccak256("CARDIO_DOCTOR_ROLE");
    bytes32 public constant GASTRO_DOCTOR_ROLE = keccak256("GASTRO_DOCTOR_ROLE");
    bytes32 public constant URO_DOCTOR_ROLE = keccak256("URO_DOCTOR_ROLE");

    modifier onlyOrtho(address _sender){
        require(hasRole(ORTHO_DOCTOR_ROLE, _sender), "Invalid access !!!!");
        _;
    }

    modifier onlyCardio(address _sender){
        require(hasRole(CARDIO_DOCTOR_ROLE, _sender), "Invalid access !!!!");
        _;
    }
    modifier onlyNeuro(address _sender){
        require(hasRole(NEURO_DOCTOR_ROLE, _sender), "Invalid access !!!!");
        _;
    }
    modifier onlyGastro(address _sender){
        require(hasRole(GASTRO_DOCTOR_ROLE, _sender), "Invalid access !!!!");
        _;
    }
    modifier onlyUro(address _sender){
        require(hasRole(URO_DOCTOR_ROLE, _sender), "Invalid access !!!!");
        _;
    }


    constructor(address[] memory _patients, address[] memory _nurses, address[] memory _ortho, address[] memory _neuro, address[] memory _cardio, address[] memory _gastro, address[] memory _uro){
        _grantRole(ADMIN_ROLE, msg.sender);
        for(uint256 i=0; i<_patients.length; i++){
            _grantRole(PATIENT_ROLE, _patients[i]);
        }
        for(uint256 i=0; i<_nurses.length; i++){
            _grantRole(NURSE_ROLE, _nurses[i]);
        }
        for(uint256 i=0; i<_ortho.length; i++){
            _grantRole(ORTHO_DOCTOR_ROLE, _ortho[i]);
        }
        for(uint256 i=0; i<_neuro.length; i++){
            _grantRole(NEURO_DOCTOR_ROLE, _neuro[i]);
        }
        for(uint256 i=0; i<_cardio.length; i++){
            _grantRole(CARDIO_DOCTOR_ROLE, _cardio[i]);
        }
        for(uint256 i=0; i<_gastro.length; i++){
            _grantRole(GASTRO_DOCTOR_ROLE, _gastro[i]);
        }
        for(uint256 i=0; i<_uro.length; i++){
            _grantRole(URO_DOCTOR_ROLE, _uro[i]);
        }
    }


    function addUser(address _sender, uint64 _type) external{
        require(hasRole(ADMIN_ROLE, msg.sender), "Invalid access");
        if(_type==1){
            _grantRole(PATIENT_ROLE, _sender);
        }else if(_type==2){
            _grantRole(NURSE_ROLE, _sender);
        }else if(_type==3){
            _grantRole(ORTHO_DOCTOR_ROLE, _sender);
        }else if(_type==4){
            _grantRole(NEURO_DOCTOR_ROLE, _sender);
        }else if(_type==5){
            _grantRole(CARDIO_DOCTOR_ROLE, _sender);
        }else if(_type==6){
            _grantRole(GASTRO_DOCTOR_ROLE, _sender);
        }else if(_type==7){
            _grantRole(URO_DOCTOR_ROLE, _sender);
        }
    }

    function checkUser() external returns(uint64){
        if(hasRole(ADMIN_ROLE, msg.sender)){
            return 1;
        }else if(hasRole(PATIENT_ROLE, msg.sender)){
            return 2;
        }else if(hasRole(NURSE_ROLE, msg.sender)){
            return 3;
        }else if(hasRole(ORTHO_DOCTOR_ROLE, msg.sender)){
            return 4;
        }else if(hasRole(NEURO_DOCTOR_ROLE, msg.sender)){
            return 5;
        }else if(hasRole(CARDIO_DOCTOR_ROLE, msg.sender)){
            return 6;
        }else if(hasRole(GASTRO_DOCTOR_ROLE, msg.sender)){
            return 7;
        }else if(hasRole(URO_DOCTOR_ROLE, msg.sender)){
            return 8;
        }
    }

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
    ) public onlyOrtho(msg.sender) {
        
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
    ) public onlyNeuro(msg.sender) {
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
    ) public onlyCardio(msg.sender) {
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
    ) public onlyGastro(msg.sender) {
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
    ) public onlyUro(msg.sender) {
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
