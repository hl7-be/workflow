### BREW - Belgian Requests & Execution Workflows

This implementation guide gives the Belgian rules for FHIR workflows built on requests (ServiceRequest, MedicationRequest, ...) and the Tasks that track how they are carried out.

Belgian workflows follow the HL7 [Clinical Order Workflows (COW)](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/) implementation guide and the [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) module. This guide states the rules that apply in Belgium:

* [Requests and Tasks](task-structure.html): the resources in a workflow and how they reference each other.
* [Where Requests and Tasks Live](task-placement.html): which server holds requests and Tasks, and who may change them.
* [Status and Progress](status.html): how the state of the work is carried on the request and the Task.
* [Grouping Requests](grouping.html): how to represent requests created together, and how Tasks track them.
* [Cancelling and Changing Requests](cancel-modify.html): how requests are cancelled, declined or changed.
* [Contained Resources](contained-resources.html): when contained resources are used.
* [Task Codes](task-codes.html): the codes to use in `Task.code`.

[BREW and COW](brew-and-cow.html) maps each COW page to the page of this guide that covers it.

### Scope

In scope:

* Request and fulfilment workflows between Belgian care providers, using Task to track the work.
* Rules that apply across Belgian IGs that use Task, such as the Digital Referral Prescription and Patient Care IGs.

Not in scope:

* Content profiles for specific requests. These stay in the domain IGs.

### Dependencies

{% include dependency-table.xhtml %}

### Intellectual property

{% include ip-statements.xhtml %}
