import { LightningElement, wire } from 'lwc';
import getVehicles from '@salesforce/apex/VehicleController.getVehicles';

export default class VehicleList extends LightningElement {

    vehicles;

    @wire(getVehicles)
    wiredVehicles({ data, error }) {

        if (data) {
            this.vehicles = data;
        } else if (error) {
            console.error(error);
        }
    }
}