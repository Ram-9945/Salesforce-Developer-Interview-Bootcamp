public class StudentService {

    // ==========================================================
    // Method Name : getStudentDetails
    // Purpose     : Retrieve Student Details using SOQL
    // Sprint      : US-7
    // ==========================================================
    public static void getStudentDetails(Id studentId) {

        // Retrieve Student Record
        Student__c student = [
            SELECT Id,
                   Name,
                   Branch__c,
                   Mobile__c,
                   Student_Email__c,
                   Cgpa__c,
                   Status__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        // Display Student Details
        System.debug('======================================');
        System.debug('      STUDENT INFORMATION');
        System.debug('======================================');
        System.debug('Student Id      : ' + student.Id);
        System.debug('Student Name    : ' + student.Name);
        System.debug('Branch          : ' + student.Branch__c);
        System.debug('Mobile          : ' + student.Mobile__c);
        System.debug('Email           : ' + student.Student_Email__c);
        System.debug('CGPA            : ' + student.Cgpa__c);
        System.debug('Status          : ' + student.Status__c);
        System.debug('======================================');

    }

}