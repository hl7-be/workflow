This page says how requests are cancelled, declined or changed. It follows COW [Cancelling and Modifying Orders](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/cancelling-and-modifying-requests.html).

Only the placer modifies the request (see [Where Requests and Tasks Live](task-placement.html#requests)). Changes are made by replacing the request (`replaces`), and alternatives are proposed with requests that have `intent` = `proposal`.

### Cancellation by the placer

* Before any Task exists, the placer MAY simply change the request's `status`.
* Before the Coordination Task is `in-progress`, the placer may set the Task's `status` to `cancelled`.
* After that, the placer MUST request cancellation by creating a [Cancellation Request Task](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/StructureDefinition-cancellation-request-task.html) with `code` = `abort`, `status` = `requested` and `focus` = the Coordination Task. The fulfiller accepts or rejects it.
* Placers SHALL create or update a Coordination Task to indicate cancellation, in addition to updating the request's `status`.

See COW [Placer initiated cancellations](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/cancelling-and-modifying-requests.html#fulfCancel).

### Requests from the fulfiller

| The fulfiller ... | How | COW |
|---|---|---|
| asks the placer to cancel the request | An [Order Status Change Request Task](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/StructureDefinition-order-status-change-request-task.html) with `code` = `abort` and `focus` = the request | [Fulfiller request to cancel](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/cancelling-and-modifying-requests.html#authCancel) |
| declines to perform | Coordination Task `status` = `rejected` | [Decline to perform](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/cancelling-and-modifying-requests.html#fulfiller-decline-to-perform) |
| proposes another service | Task `rejected`, `statusReason` = alternative proposal, `output` = a request with `intent` = `proposal`. The placer accepts by creating a request that `replaces` the original. | [Alternative service](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/cancelling-and-modifying-requests.html#fulfiller-proposal-for-particular-or-alternative-service) |
| chooses a more specific service under the original authorization | A new request that `replaces` the original | [More specific service](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/cancelling-and-modifying-requests.html#fulfiller-selection-of-a-more-specific-service-under-original-authority) |
| cannot perform | Coordination Task `status` = `failed` | [Unable to perform](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/cancelling-and-modifying-requests.html#fulfiller-unable-to-perform) |

Suspending, resuming and marking a request complete are asked for with an Order Status Change Request Task using `suspend`, `resume` or `mark-complete` (see [Task Codes](task-codes.html)).
