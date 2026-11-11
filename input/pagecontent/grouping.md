This page says how to represent requests that are created together, and how Tasks track them. It follows COW [Order Grouping](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/order-grouping.html).

### One request per item

Each item is a request for one thing. How items created together relate determines the representation:

| Relationship | Representation | Order identifier | Status |
|---|---|---|---|
| [Unrelated, independent](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/order-grouping.html#unrelated-independent-requests) | Separate requests | Each request's `identifier` | Per request |
| [Grouped, independent](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/order-grouping.html#grouped-independent-requests): created together, carried out separately | Separate requests with the same `groupIdentifier` (`requisition` on ServiceRequest) | `groupIdentifier` / `requisition` | Per request |
| [Grouped, interdependent](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/order-grouping.html#grouped-interdependent-requests): carried out as one whole | A [RequestGroup](https://hl7.org/fhir/R4/requestgroup.html) whose requests have `intent` = `option` and are contained in the RequestGroup | `RequestGroup.identifier` | One status, on the RequestGroup |

For grouped, independent requests, the group is not a resource of its own. The author, date, patient and other shared data are recorded in each request.

For grouped, interdependent requests, the RequestGroup is treated as a single integrated request whose status is the status of the RequestGroup. The items cannot have their statuses changed individually; the change happens at the group level.

The requests of a RequestGroup are contained in it:

* They are created together with the RequestGroup, and referenced from `RequestGroup.action.resource` as `#<id>`.
* Their ids identify them within the RequestGroup only.
* They are not changed on their own. To change an item, create a new RequestGroup that `replaces` the previous one.
* They are not searched on their own. Search on the RequestGroup (see [Finding grouped requests](#finding-grouped-requests)).
* Elements that a request profile requires, such as `subject` and `requester`, have the same values as on the RequestGroup.
* Their `status` is not maintained separately.

Other relationships between requests:

* `replaces`: a request that replaces an earlier one;
* `basedOn`: a request that fulfils another request.

### Composing an order

An order is made of requests and the resources they refer to: the patient, the requester, the performer, medications, observations, and so on.

* Each request is for one item.
* The resources a request refers to are normally separate resources, hosted where they are maintained and referenced from the request. A patient, practitioner or organization that exists on a shared server is referenced, not contained.
* Contained resources are not the norm. A resource is contained only when it exists only as part of this order. For example:
  * the requests of a RequestGroup;
  * an anonymised, session-specific Patient resource that is only used in this prescription;
  * a resource that only a contained request uses, such as a Medication.
* Contained resources cannot themselves contain resources. A resource that a contained request uses is contained in the RequestGroup, and referenced from the request as `#<id>`.
* Content that the fulfiller needs at the time of ordering, and that exists on its own, is sent as Bundle entries, not as contained resources (see [Contained Resources](contained-resources.html#content-sent-with-a-request)).

### Tracking a group

* `Task.focus` points to the request, or to the RequestGroup.
* For grouped, independent requests without a RequestGroup, the Task points to all the requests. In R4 this uses the cross-version extension `http://hl7.org/fhir/4.0/StructureDefinition/extension-Task.focus` ([Coordinating several requests](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/requests-events-tasks.html#coordinating-several-requests)). A logical reference to the group identifier is not recommended.
* Requests for a change point to the request's `identifier`, its `groupIdentifier`, or the `RequestGroup.identifier`.
* The work for a group can be split into sub-tasks with `Task.partOf` (see [Requests and Tasks](task-structure.html#parent-tasks-and-sub-tasks)).

COW [Grouped dispense](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/ex4-meds-grouped-dispense.html) shows one Task tracking a group of medication requests.

### Finding grouped requests

Servers that hold both single and grouped requests support the COW [group-or-identifier](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/SearchParameter-group-or-identifier.html) search parameter. It matches the request's `identifier` or its `groupIdentifier` / `requisition`. See COW [Finding and managing grouped requests](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/order-grouping.html#finding-and-managing-grouped-requests).
