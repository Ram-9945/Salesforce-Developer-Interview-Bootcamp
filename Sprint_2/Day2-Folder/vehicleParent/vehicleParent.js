import { LightningElement } from 'lwc';

export default class VehicleParent extends LightningElement {

    recordId = '';

    message = 'Waiting for Child Event...';

    handleChange(event){

        this.recordId = event.target.value;

    }

    handleButtonClick(){

        this.message = 'Button Clicked Successfully';

    }

}