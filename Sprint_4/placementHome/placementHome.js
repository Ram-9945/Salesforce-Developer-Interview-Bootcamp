import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {
    Student_Name='RAJEEV';
    Student_reg_no='23PA1A12E1';
    Department='Information Technology';

 message = 'Not Applied';

    todayDate = new Date().toLocaleDateString('en-IN', {
        day: 'numeric',
        month: 'long',
        year: 'numeric'
    });


    msg='Welcome Student ';
    Companies='25';
    Jobs='63';
    Applications='5'; 


    showMessage() {
        this.message = 'Applied.';
    }
    
}