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

    function checkUser() view external returns(uint64){
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
        return 0;//default return if no role is found
    }

 //Orthopedics Test
    struct OrthopedicsTestReport {
        uint medicalRecordNumber;
        address userAddress;
        string patientName;
        uint age;
        string gender;
        string bloodGroup;
        string testDate;
        string xrayTestReport;
        string mriTestReport;
        string ctScanTestReport;
        string ultrasoundTestReport;
        string doctorName;
        string MedicineName;
        string reportDate;
    }

//Neurology Test
    struct NeurologyTestReport {
        uint medicalRecordNumber;
        address userAddress;
        string patientName;
        uint age;
        string gender;
        string bloodGroup;
        string testDate;
        string neurologicalExaminationReport;
        string eegReport;
        string lumbarPunctureReport;
        string neuropsychologicalTestingReport;
        string geneticTestingReport;
        string doctorName;
        string MedicineName;
        string reportDate;
    }

//Cardiology Test
    struct CardiologyTestReport {
        uint medicalRecordNumber;
        address userAddress;
        string patientName;
        uint age;
        string gender;
        string bloodGroup;
        string testDate;
        string electrocardiogramReport;
        string echocardiogramReport;
        string stressTestReport;
        string cardiacMRIReport;
        string doctorName;
        string MedicineName;
        string reportDate;
    }

// Gastroenterology Test
    struct GastroenterologyTestReport {
        uint medicalRecordNumber;
        address userAddress;
        string patientName;
        uint age;
        string gender;
        string bloodGroup;
        string testDate;
        string breathTestsReport;
        string liverBiopsyReport;
        string upperEndoscopyReport;
        string capsuleEndoscopyReport;
        string doctorName;
        string MedicineName;
        string reportDate;
    }

    //Urology Test
    struct UrologyTestReport {
        uint medicalRecordNumber;
        address userAddress;
        string patientName;
        uint age;
        string gender;
        string bloodGroup;
        string testDate;
        string urinalysisReport;
        string urinaryCultureReport;
        string cystoscopyReport;
        string prostateBiopsyReport;
        string doctorName;
        string MedicineName;
        string reportDate;
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



    function addOrthopedicsTestReport(
        uint _medicalRecordNumber,
        address _userAddress,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _bloodGroup,
        string memory _testDate,
        string memory _xrayTestReport,
        string memory _mriTestReport,
        string memory _ctScanTestReport,
        string memory _ultrasoundTestReport,
        string memory _doctorName,
        string memory _MedicineName,
        string memory _reportDate
    ) public onlyOrtho(msg.sender) {      
        for(uint i = 1; i <= orthoRecordId; i++) {
            require(orthoRecords[i].medicalRecordNumber != _medicalRecordNumber, "Medical record number already exists");
        }
        orthoRecordId++;
        orthoRecords[orthoRecordId] = OrthopedicsTestReport(
            _medicalRecordNumber,
            _userAddress,
            _patientName,
            _age,
            _gender,
            _bloodGroup,
            _testDate,
            _xrayTestReport,
            _mriTestReport,
            _ctScanTestReport,
            _ultrasoundTestReport,
            _doctorName,
            _MedicineName,
            _reportDate
        );
    }


    function addNeurologyTestReport(
        uint _medicalRecordNumber,
        address _userAddress,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _bloodGroup,
        string  memory _testDate,
        string memory _neurologyexaminationTestReport,
        string memory _electroencephalogramTestReport,
        string memory _lumbarpunctureTestReport,
        string memory _neuropsychologicalTestReport,
        string memory _geneticTestReport,
        string memory _doctorName,
        string memory _MedicineName,
        string memory _reportDate
    ) public onlyNeuro(msg.sender) {
        for(uint i = 1; i <= neuroRecordId; i++) {
            require(neuroRecords[_medicalRecordNumber].medicalRecordNumber == 0, "Medical record number already exists");
        }
        neuroRecordId++;
        neuroRecords[neuroRecordId] = NeurologyTestReport(
            _medicalRecordNumber,
            _userAddress,
            _patientName,
            _age,
            _gender,
            _bloodGroup,
            _testDate,
            _neurologyexaminationTestReport,
            _electroencephalogramTestReport,
            _lumbarpunctureTestReport,
            _neuropsychologicalTestReport,
            _geneticTestReport,
            _doctorName,
            _MedicineName,
            _reportDate
        );

    }


    function addCardiologyTestReport(
        uint _medicalRecordNumber,
        address _userAddress,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _bloodGroup,
        string memory _testDate,
        string memory _electrocardiogramTestReport,
        string memory _echocardiogramTestReport,
        string memory _stressTestReport,
        string memory _cardiacmriTestReport,
        string memory _doctorName,
        string memory _MedicineName,
        string memory _reportDate
    ) public onlyCardio(msg.sender) {
        for(uint i = 1; i <= cardioRecordId; i++) {
            require(cardioRecords[_medicalRecordNumber].medicalRecordNumber == 0, "Medical record number already exists");
        }
        cardioRecordId++;
        cardioRecords[cardioRecordId] = CardiologyTestReport(
            _medicalRecordNumber,
            _userAddress,
            _patientName,
            _age,
            _gender,
            _bloodGroup,
            _testDate,
            _electrocardiogramTestReport,
            _echocardiogramTestReport,
            _stressTestReport,
            _cardiacmriTestReport,
            _doctorName,
            _MedicineName,
            _reportDate
        );
    }


    function addGastroenterologyTestReport(
        uint _medicalRecordNumber,
        address _userAddress,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _bloodGroup,
        string memory _testDate,
        string memory _breathTestReport,
        string memory _liverbiospyTestReport,
        string memory _upperendoscopyTestReport,
        string memory _capsuleendoscopyTestReport,
        string memory _doctorName,
        string memory _MedicineName,
        string memory _reportDate
    ) public onlyGastro(msg.sender) {
        for(uint i = 1; i <= gastroRecordId; i++) {
            require(gastroRecords[_medicalRecordNumber].medicalRecordNumber == 0, "Medical record number already exists");
        }
        gastroRecordId++;
        gastroRecords[gastroRecordId] = GastroenterologyTestReport(
            _medicalRecordNumber,
            _userAddress,
            _patientName,
            _age,
            _gender,
            _bloodGroup,
            _testDate,
            _breathTestReport,
            _liverbiospyTestReport,
            _upperendoscopyTestReport,
            _capsuleendoscopyTestReport,
            _doctorName,
            _MedicineName,
            _reportDate
        );

    }


    function addUrologyTestReport(
        uint _medicalRecordNumber,
        address _userAddress,
        string memory _patientName,
        uint _age,
        string memory _gender,
        string memory _bloodGroup,
        string memory _testDate,
        string memory _urinalysisTestReport,
        string memory _urinarycultureTestReport,
        string memory _cystoscopyTestReport,
        string memory _prostatebiopsyTestReport,
        string memory _doctorName,
        string memory _MedicineName,
        string memory _reportDate
    ) public onlyUro(msg.sender) {
        for(uint i = 1; i <= uroRecordId; i++) {
            require(uroRecords[_medicalRecordNumber].medicalRecordNumber == 0, "Medical record number already exists");
        }
        uroRecordId++;
        uroRecords[uroRecordId]= UrologyTestReport(
            _medicalRecordNumber,
            _userAddress,
            _patientName,
            _age,
            _gender,
            _bloodGroup,
            _testDate,
            _urinalysisTestReport,
            _urinarycultureTestReport,
            _cystoscopyTestReport,
            _prostatebiopsyTestReport,
            _doctorName,
            _MedicineName,
            _reportDate
        );

    }



//Medicine List Details
    function getOrthoMedicineList(uint _medicalRecordNumber) public view returns(
        uint,
        string memory,
        uint,
        string memory,
        string memory,
        string memory
    ) {
        OrthopedicsTestReport memory report;
        uint medicalRecordNumberFound;
        for(uint i = 1; i <= orthoRecordId; i++) {
            if(orthoRecords[i].medicalRecordNumber == _medicalRecordNumber) {
                report = orthoRecords[i];
                medicalRecordNumberFound = _medicalRecordNumber;
                break;
            }
        }
        require(medicalRecordNumberFound != 0, "Orthopedics test report not found");
        return (
            medicalRecordNumberFound,
            report.patientName,
            report.age,
            report.gender,
            report.doctorName,
            report.MedicineName
        );
    }


    function getCardioMedicineList(uint _medicalRecordNumber)public view returns(
        string memory,
        uint ,
        string memory,
        string memory,
        string memory
    ) {
        CardiologyTestReport storage report = cardioRecords[_medicalRecordNumber];
        uint medicalRecordNumberFound;
        for(uint i=1;i<=cardioRecordId;i++){
            if(cardioRecords[i].medicalRecordNumber == _medicalRecordNumber){
                report = cardioRecords[i];
                medicalRecordNumberFound = _medicalRecordNumber;
                break;
            }
        }


        require(report.medicalRecordNumber != 0, "Cardiology test report not found");
        return (
            report.patientName,
            report.age,
            report.gender,
            report.doctorName,
            report.MedicineName
        );
    }

    function getNeuroMedicineList(uint _medicalRecordNumber)public view returns(
        string memory,
        uint ,
        string memory,
        string memory,
        string memory
    ) {
        NeurologyTestReport storage report = neuroRecords[_medicalRecordNumber];
        uint medicalRecordNumberFound;
        for(uint i=1;i<=neuroRecordId;i++){
            if(neuroRecords[i].medicalRecordNumber == _medicalRecordNumber){
                report = neuroRecords[i];
                medicalRecordNumberFound = _medicalRecordNumber;
                break;
            }
        }
        require(report.medicalRecordNumber != 0, "Neurology test report not found");
        return (
            report.patientName,
            report.age,
            report.gender,
            report.doctorName,
            report.MedicineName
        );
    }

    function getGastroMedicineList(uint _medicalRecordNumber)public view returns(
        string memory,
        uint ,
        string memory,
        string memory,
        string memory
    ) {
        GastroenterologyTestReport storage report = gastroRecords[_medicalRecordNumber];
        uint medicalRecordNumberFound;
        for(uint i=1;i<=gastroRecordId;i++){
            if(gastroRecords[i].medicalRecordNumber == _medicalRecordNumber){
                report = gastroRecords[i];
                medicalRecordNumberFound = _medicalRecordNumber;
                break;
            }
        }
        require(report.medicalRecordNumber != 0, "Gastroenterology test report not found");
        return (
            report.patientName,
            report.age,
            report.gender,
            report.doctorName,
            report.MedicineName
        );
    }

    function getUroMedicineList(uint _medicalRecordNumber)public view returns(
        string memory,
        uint ,
        string memory,
        string memory,
        string memory
    ) {
        UrologyTestReport storage report = uroRecords[_medicalRecordNumber];
        uint medicalRecordNumberFound;
        for(uint i=1;i<=uroRecordId;i++){
            if(uroRecords[i].medicalRecordNumber == _medicalRecordNumber){
                report = uroRecords[i];
                medicalRecordNumberFound = _medicalRecordNumber;
                break;
            }
        }
        require(report.medicalRecordNumber != 0, "Urology test report not found");
        
        return (
            report.patientName,
            report.age,
            report.gender,
            report.doctorName,
            report.MedicineName
        );
    }




//Test Report Details
    function getOrthopedicsTestReportDetails(uint _medicalRecordNumber) public view returns (
        uint,
        string memory,
        uint,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        OrthopedicsTestReport storage report = orthoRecords[0];
        for(uint i=1; i<=orthoRecordId; i++){
            if(_medicalRecordNumber == orthoRecords[i].medicalRecordNumber){
                report = orthoRecords[i];
                break;
            }
        }
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.bloodGroup,
            report.testDate,
            report.xrayTestReport,
            report.mriTestReport,
            report.ctScanTestReport,
            report.ultrasoundTestReport,
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
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        UrologyTestReport storage report = uroRecords[0];
        for(uint i=1; i<=uroRecordId; i++){
            if(_medicalRecordNumber == uroRecords[i].medicalRecordNumber){
                report = uroRecords[i];
                break;
            }
        }
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.bloodGroup,
            report.testDate,
            report.urinalysisReport,
            report.urinaryCultureReport,
            report.cystoscopyReport,
            report.prostateBiopsyReport,
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
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        NeurologyTestReport storage report = neuroRecords[0];
        for(uint i=1; i<=neuroRecordId; i++){
            if(_medicalRecordNumber == neuroRecords[i].medicalRecordNumber){
                report = neuroRecords[i];
                break;
            }
        }
        
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.bloodGroup,
            report.testDate,
            report.neurologicalExaminationReport,
            report.eegReport,
            report.lumbarPunctureReport,
            report.neuropsychologicalTestingReport,
            report.geneticTestingReport,
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
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        GastroenterologyTestReport storage report = gastroRecords[0];
        for(uint i=1; i<=gastroRecordId; i++){
            if(_medicalRecordNumber == gastroRecords[i].medicalRecordNumber){
                report = gastroRecords[i];
                break;
            }
        }
        
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.bloodGroup,
            report.testDate,
            report.breathTestsReport,
            report.liverBiopsyReport,
            report.upperEndoscopyReport,
            report.capsuleEndoscopyReport,
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
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        CardiologyTestReport storage report = cardioRecords[0];
        for(uint i=1; i<=cardioRecordId; i++){
            if(_medicalRecordNumber == cardioRecords[i].medicalRecordNumber){
                report = cardioRecords[i];
                break;
            }
        }
        return (
            report.medicalRecordNumber,
            report.patientName,
            report.age,
            report.gender,
            report.bloodGroup,
            report.testDate,
            report.electrocardiogramReport,
            report.echocardiogramReport,
            report.stressTestReport,
            report.cardiacMRIReport,
            report.reportDate
        );
    }


    function getAllOrthopedicsRecords() public view returns (uint, OrthopedicsTestReport[] memory) {
        OrthopedicsTestReport[] memory records = new OrthopedicsTestReport[](orthoRecordId);
        for (uint i = 1; i <= orthoRecordId; i++) {
            records[i - 1] = orthoRecords[i];
        }
        return (orthoRecordId, records);
    }

    function getAllNeurologyRecords() public view returns (uint, NeurologyTestReport[] memory) {
        NeurologyTestReport[] memory records = new NeurologyTestReport[](neuroRecordId);
        for (uint i = 1; i <= neuroRecordId; i++) {
            records[i - 1] = neuroRecords[i];
        }
        return (neuroRecordId, records);
    }

    function getAllCardiologyRecords() public view returns (uint, CardiologyTestReport[] memory) {
        CardiologyTestReport[] memory records = new CardiologyTestReport[](cardioRecordId);
        for (uint i = 1; i <= cardioRecordId; i++) {
            records[i - 1] = cardioRecords[i];
        }
        return (cardioRecordId, records);
    }

    function getAllGastroenterologyRecords() public view returns (uint, GastroenterologyTestReport[] memory) {
        GastroenterologyTestReport[] memory records = new GastroenterologyTestReport[](gastroRecordId);
        for (uint i = 1; i <= gastroRecordId; i++) {
            records[i - 1] = gastroRecords[i];
        }
        return (gastroRecordId, records);
    }

    function getAllUrologyRecords() public view returns (uint, UrologyTestReport[] memory) {
        UrologyTestReport[] memory records = new UrologyTestReport[](uroRecordId);
        for (uint i = 1; i <= uroRecordId; i++) {
            records[i - 1] = uroRecords[i];
        }
        return (uroRecordId, records);
    }

    function findRecords(address _user) external view returns(OrthopedicsTestReport[] memory, CardiologyTestReport[] memory, NeurologyTestReport[] memory, GastroenterologyTestReport[] memory, UrologyTestReport[] memory) {        
        OrthopedicsTestReport[] memory _ortho = new OrthopedicsTestReport[](orthoRecordId);
        uint _orthoCount = 0;
        for(uint i=0; i<=orthoRecordId; i++){
            if(_user == orthoRecords[i].userAddress){
                _ortho[_orthoCount] = (orthoRecords[i]);
                _orthoCount++;
            }
        }

        NeurologyTestReport[] memory _neuro = new NeurologyTestReport[](neuroRecordId);
        uint _neuroCount =0;
        for(uint i=0; i<=neuroRecordId; i++){
            if(_user == neuroRecords[i].userAddress){
                _neuro[_neuroCount]=(neuroRecords[i]);
                _neuroCount++;
            }
        }

        CardiologyTestReport[] memory _cardio = new CardiologyTestReport[](cardioRecordId);
        uint _cardioCount=0;
        for(uint i=0; i<=cardioRecordId; i++){
            if(_user == cardioRecords[i].userAddress){
                _cardio[_cardioCount]=(cardioRecords[i]);
                _cardioCount++;
            }
        }


        GastroenterologyTestReport[] memory _gastro = new GastroenterologyTestReport[](gastroRecordId);
        uint _gastroCount =0;
        for(uint i=0; i<=gastroRecordId; i++){
            if(_user == orthoRecords[i].userAddress){
                _gastro[_gastroCount]=(gastroRecords[i]);
                _gastroCount++;
            }
        }


        UrologyTestReport[] memory _uro = new UrologyTestReport[](uroRecordId);
        uint _uroCount=0;
        for(uint i=0; i<=uroRecordId; i++){
            if(_user == uroRecords[i].userAddress){
                _uro[_uroCount]=(uroRecords[i]);
                _uroCount++;
            }
        }
        return (_ortho, _cardio, _neuro, _gastro, _uro);

    }
}