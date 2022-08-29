import { LightningElement, wire, api } from 'lwc';
import getDublicate from '@salesforce/apex/CaseDublicateController.getDublicate';

import CASE_NUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import CONTACT_EMAIL_FIELD from '@salesforce/schema/Case.ContactEmail';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import REASON_FIELD from '@salesforce/schema/Case.Reason';
import OWNER_FIELD from '@salesforce/schema/Case.OwnerId';

const COLS = [
    {
        label: 'Case number',
        fieldName: CASE_NUMBER_FIELD.fieldApiName,
        editable: true
    },
    {
        label: 'Origin',
        fieldName: ORIGIN_FIELD.fieldApiName,
        editable: true
    },
    { 
        label: 'Contact email', 
        fieldName: CONTACT_EMAIL_FIELD.fieldApiName, 
        editable: true 
    },
    {
        label: 'Status',
        fieldName: STATUS_FIELD.fieldApiName,
        editable: true
    },
    {
        label: 'Reason',
        fieldName: REASON_FIELD.fieldApiName,
        editable: true
    },
    {
        label: 'Owner',
        fieldName: OWNER_FIELD.fieldApiName,
        editable: true
    }
];
export default class DatatableInlineEditWithUiApi extends LightningElement {
    @api recordId;
    columns = COLS;
    draftValues = [];

    @wire(getDublicate, { caseId: '$recordId' })
    cases;
}