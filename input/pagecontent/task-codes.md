`Task.code` says what the Task asks the owner to do. Use the codes in [BeVSTaskCode](ValueSet-be-vs-taskcode.html), in this order of preference:

1. The FHIR [task-code](https://hl7.org/fhir/R4/codesystem-task-code.html) codes (for example `fulfill`, `abort`, `suspend`, `resume`).
2. The [COW Task codes](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/CodeSystem-cow-task-code.html) (`bid-for-fulfilment`, `mark-complete`).
3. The Belgian Task codes in [BeCSTaskCode](CodeSystem-be-cs-taskcode.html), only when neither of the above covers the workflow step.

### Codes per Task

| Task | `Task.code` |
|---|---|
| Coordination Task, fulfiller known | `fulfill` |
| Coordination Task, several potential fulfillers notified | `request-fulfillment` |
| Bid from a potential fulfiller | `bid-for-fulfilment` |
| [Cancellation Request Task](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/StructureDefinition-cancellation-request-task.html) | `abort` |
| [Order Status Change Request Task](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/StructureDefinition-order-status-change-request-task.html) | `abort`, `suspend`, `resume` or `mark-complete` ([value set](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/ValueSet-order-status-change-request-code.html)) |

The COW codes are meant for dedicated Tasks, not for the general-purpose Coordination Task.

### New codes

New Belgian codes are proposed to the FHIR Validation Team. Codes that are useful outside Belgium are also proposed to HL7 for COW or the FHIR task-code CodeSystem.
