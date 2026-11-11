This page says how the state of the work is carried on the request and the Task. It follows COW [Requests, Events, and Tasks](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/requests-events-tasks.html), [Workflow State Overview](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/workflow-state-overview.html) and [Tracking Workflow Progress](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/tracking-progress.html).

### Request status and Task status

FHIR distinguishes the status of the authorization from the status of the execution:

* The request's `status` is the status of the authorization. It is set by the placer.
* `Task.status` is the status of the Task itself. Its values are limited to the [Task status](https://hl7.org/fhir/R4/valueset-task-status.html) codes.
* `Task.businessStatus` tracks the actual execution in business terms.
* `Task.statusReason` explains the current status.

Information that a state needs is captured in both the Task and the request.

### Common workflow states

| State | Request | Task |
|---|---|---|
| Placed, fulfiller known | `active` | `requested`, `code` = `fulfill` |
| Placed, several potential fulfillers notified | `active` | `requested`, `code` = `request-fulfillment` |
| Fulfiller awaiting information | `active` | `received`, `businessStatus` = awaiting information |
| Fulfiller selected | `active` | `accepted`, `businessStatus` = selected; the other Tasks `cancelled` with `businessStatus` = not selected |
| In progress, partial or preliminary results | `active` | `in-progress`, with `businessStatus` |
| Done | `completed` | `completed` |

The full table is in COW [Common workflow states](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/workflow-state-overview.html#common-workflow-states). The `businessStatus` values in COW are examples and are not intended to be used as they are.

### Completion

When the Coordination Task is completed, the placer is expected to set the request's `status` to `completed`, or to keep it `active` and create a new Task. See COW [Task completion](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/requests-events-tasks.html#task-completion).

### Tracking progress

Progress is tracked with `Task.status`, `Task.businessStatus` and `Task.statusReason`. Coded progress goes in the Coordination Task's `businessStatus` ([TaskBusinessStatus](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/tracking-progress.html#taskbusinessstatus)).

Progress can also be counted:

* by counting the events in `Task.output` ([Counting Task.output](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/tracking-progress.html#counting-taskoutput));
* explicitly, as a Ratio in `Task.output`, for example 4 of 10 physiotherapy sessions done ([Example](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/tracking-progress.html#example-physiotherapy---tracking-sessions-completed)).
