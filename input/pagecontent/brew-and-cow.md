BREW is the Belgian adaptation of the HL7 [Clinical Order Workflows (COW)](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/) implementation guide. Belgian request and fulfilment workflows follow COW. BREW states the COW rules that apply in Belgium and adds Belgian specifics where needed.

| COW page | BREW page |
|---|---|
| [Core Concepts](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/core-concepts.html) | [Requests and Tasks](task-structure.html), [Where Requests and Tasks Live](task-placement.html) |
| [Requests, Events, and Tasks](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/requests-events-tasks.html) | [Requests and Tasks](task-structure.html), [Status and Progress](status.html) |
| [Workflow Patterns](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/workflow-patterns.html) | [Where Requests and Tasks Live](task-placement.html) |
| [Workflow State Overview](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/workflow-state-overview.html) | [Status and Progress](status.html) |
| [Tracking Workflow Progress](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/tracking-progress.html) | [Status and Progress](status.html) |
| [Order Grouping](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/order-grouping.html) | [Grouping Requests](grouping.html) |
| [Fulfiller Determination](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/fulfiller-determination.html) | [Requests and Tasks](task-structure.html#choosing-the-fulfiller) |
| [Fulfiller Need for Additional Information](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/fulfiller-need-for-additional-info.html) | [Requests and Tasks](task-structure.html#additional-information) |
| [Cancelling and Modifying Orders](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/cancelling-and-modifying-requests.html) | [Cancelling and Changing Requests](cancel-modify.html) |
| [Sharing Content](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/sharing-content.html) | [Contained Resources](contained-resources.html), [Where Requests and Tasks Live](task-placement.html#outcomes) |
| [COW Task codes](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/CodeSystem-cow-task-code.html) | [Task Codes](task-codes.html) |

The COW profiles referenced in this guide are the [Coordination Task](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/StructureDefinition-coordination-task.html), the [Cancellation Request Task](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/StructureDefinition-cancellation-request-task.html) and the [Order Status Change Request Task](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/StructureDefinition-order-status-change-request-task.html).
