# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [schema/common.proto](#schema_common-proto)
    - [ChaincodeError](#common-ChaincodeError)
  
    - [ChaincodeError.ErrorCode](#common-ChaincodeError-ErrorCode)
  
- [schema/config.proto](#schema_config-proto)
    - [AuditableKeyExchangeConfig](#config-AuditableKeyExchangeConfig)
    - [DifferentialPrivacyConfig](#config-DifferentialPrivacyConfig)
    - [FeatureConfig](#config-FeatureConfig)
    - [HomomorphicEncryptionConfig](#config-HomomorphicEncryptionConfig)
    - [HomomorphicEncryptionConfig.ThresholdPaillier](#config-HomomorphicEncryptionConfig-ThresholdPaillier)
    - [InputConfig](#config-InputConfig)
    - [ParticipantConfig](#config-ParticipantConfig)
    - [ParticipantConfig.HospitalConfig](#config-ParticipantConfig-HospitalConfig)
    - [PlatformConfig](#config-PlatformConfig)
    - [QueryConfig](#config-QueryConfig)
    - [ReadPlatformConfigTransaction](#config-ReadPlatformConfigTransaction)
    - [WritePlatformConfigTransaction](#config-WritePlatformConfigTransaction)
  
- [schema/devicedata.proto](#schema_devicedata-proto)
    - [DeviceDataTransaction](#devicedata-DeviceDataTransaction)
    - [DeviceDataTransaction.DeviceData](#devicedata-DeviceDataTransaction-DeviceData)
  
    - [DeviceDataTransaction.DeviceCategory](#devicedata-DeviceDataTransaction-DeviceCategory)
  
- [schema/query.proto](#schema_query-proto)
    - [Filter](#query-Filter)
    - [Filter.BoolFilter](#query-Filter-BoolFilter)
    - [Filter.IntFilter](#query-Filter-IntFilter)
    - [Filter.StringFilter](#query-Filter-StringFilter)
    - [Filter.TimestampFilter](#query-Filter-TimestampFilter)
    - [QueryResult](#query-QueryResult)
    - [QueryResult.AggregatedCount](#query-QueryResult-AggregatedCount)
    - [QueryResult.AggregatedCount.MapEntry](#query-QueryResult-AggregatedCount-MapEntry)
    - [QueryTransaction](#query-QueryTransaction)
  
    - [Filter.BoolFilter.BoolOperator](#query-Filter-BoolFilter-BoolOperator)
    - [Filter.IntFilter.IntOperator](#query-Filter-IntFilter-IntOperator)
    - [Filter.StringFilter.StringOperator](#query-Filter-StringFilter-StringOperator)
    - [Filter.TimestampFilter.TimestampOperator](#query-Filter-TimestampFilter-TimestampOperator)
    - [QueryTransaction.QueryType](#query-QueryTransaction-QueryType)
  
- [schema/transaction.proto](#schema_transaction-proto)
    - [EvaluateTransaction](#transaction-EvaluateTransaction)
    - [SubmitTransaction](#transaction-SubmitTransaction)
  
- [Scalar Value Types](#scalar-value-types)



<a name="schema_common-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/common.proto



<a name="common-ChaincodeError"></a>

### ChaincodeError



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| code | [ChaincodeError.ErrorCode](#common-ChaincodeError-ErrorCode) |  |  |
| message | [string](#string) |  |  |
| details | [string](#string) |  |  |





 


<a name="common-ChaincodeError-ErrorCode"></a>

### ChaincodeError.ErrorCode


| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 | Generic errors |
| INTERNAL_ERROR | 1 |  |
| INVALID_REQUEST | 2 |  |
| UNAUTHENTICATED | 100 | Authentication and authorization errors |
| PERMISSION_DENIED | 101 |  |
| NOT_FOUND | 200 | Resource errors |
| ALREADY_EXISTS | 201 |  |
| TRANSACTION_FAILURE | 300 | Transaction and state errors |
| STATE_ERROR | 301 |  |
| INVALID_TRANSACTION | 302 |  |
| DUPLICATE_TRANSACTION | 303 |  |
| INVALID_ARGUMENT | 400 | Data errors |
| DATA_INCONSISTENCY | 401 |  |
| DATA_VALIDATION_ERROR | 402 |  |
| NETWORK_FAILURE | 500 | Network and communication errors |
| PEER_UNAVAILABLE | 501 |  |
| ORDERER_UNAVAILABLE | 502 |  |
| TIMEOUT | 503 |  |
| LEDGER_ERROR | 600 | Ledger errors |
| COMMIT_FAILURE | 601 |  |
| READ_FAILURE | 602 |  |
| WRITE_FAILURE | 603 |  |
| CUSTOM_ERROR | 1000 | Custom application-specific errors |


 

 

 



<a name="schema_config-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/config.proto



<a name="config-AuditableKeyExchangeConfig"></a>

### AuditableKeyExchangeConfig
AUDITING


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enabled | [bool](#bool) |  |  |






<a name="config-DifferentialPrivacyConfig"></a>

### DifferentialPrivacyConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enabled | [bool](#bool) |  |  |
| epsilon | [int32](#int32) |  |  |






<a name="config-FeatureConfig"></a>

### FeatureConfig
FEATURES


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query_config | [QueryConfig](#config-QueryConfig) |  |  |
| auditable_key_exchange_config | [AuditableKeyExchangeConfig](#config-AuditableKeyExchangeConfig) |  |  |






<a name="config-HomomorphicEncryptionConfig"></a>

### HomomorphicEncryptionConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enabled | [bool](#bool) |  |  |
| threshold_paillier | [HomomorphicEncryptionConfig.ThresholdPaillier](#config-HomomorphicEncryptionConfig-ThresholdPaillier) |  |  |






<a name="config-HomomorphicEncryptionConfig-ThresholdPaillier"></a>

### HomomorphicEncryptionConfig.ThresholdPaillier



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key_size | [int32](#int32) |  |  |
| public_key | [string](#string) |  |  |






<a name="config-InputConfig"></a>

### InputConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| valid_count_fields | [string](#string) | repeated |  |
| valid_aggregated_count_fields | [string](#string) | repeated |  |
| valid_average_fields | [string](#string) | repeated |  |






<a name="config-ParticipantConfig"></a>

### ParticipantConfig
HOSPITALS NETWORK


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hospitals_config | [ParticipantConfig.HospitalConfig](#config-ParticipantConfig-HospitalConfig) | repeated |  |






<a name="config-ParticipantConfig-HospitalConfig"></a>

### ParticipantConfig.HospitalConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  |  |
| peer_endpoint | [string](#string) |  |  |






<a name="config-PlatformConfig"></a>

### PlatformConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| participant_config | [ParticipantConfig](#config-ParticipantConfig) |  |  |
| feature_config | [FeatureConfig](#config-FeatureConfig) |  |  |






<a name="config-QueryConfig"></a>

### QueryConfig
QUERY


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| input_config | [InputConfig](#config-InputConfig) |  |  |
| differential_privacy_config | [DifferentialPrivacyConfig](#config-DifferentialPrivacyConfig) |  |  |
| homomorphic_encryption_config | [HomomorphicEncryptionConfig](#config-HomomorphicEncryptionConfig) |  |  |






<a name="config-ReadPlatformConfigTransaction"></a>

### ReadPlatformConfigTransaction







<a name="config-WritePlatformConfigTransaction"></a>

### WritePlatformConfigTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| platform_config | [PlatformConfig](#config-PlatformConfig) |  |  |





 

 

 

 



<a name="schema_devicedata-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/devicedata.proto



<a name="devicedata-DeviceDataTransaction"></a>

### DeviceDataTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | hash of udi |
| timestamp | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| encryption_version | [string](#string) | optional |  |
| device_data | [DeviceDataTransaction.DeviceData](#devicedata-DeviceDataTransaction-DeviceData) |  |  |






<a name="devicedata-DeviceDataTransaction-DeviceData"></a>

### DeviceDataTransaction.DeviceData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| udi | [string](#string) |  |  |
| manufacturer | [string](#string) |  |  |
| model | [string](#string) |  |  |
| firmware_version | [string](#string) |  |  |
| device_type | [string](#string) |  |  |
| device_category | [string](#string) |  |  |
| production_date | [string](#string) |  |  |
| last_service_date | [string](#string) |  |  |
| warranty_expiry_date | [string](#string) |  |  |
| usage_hours | [string](#string) |  |  |
| battery_level | [string](#string) |  |  |
| hospital | [string](#string) |  |  |
| speciality | [string](#string) |  |  |
| active_status | [string](#string) |  |  |





 


<a name="devicedata-DeviceDataTransaction-DeviceCategory"></a>

### DeviceDataTransaction.DeviceCategory


| Name | Number | Description |
| ---- | ------ | ----------- |
| PORTABLE | 0 |  |
| WEARABLE | 1 |  |


 

 

 



<a name="schema_query-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/query.proto



<a name="query-Filter"></a>

### Filter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| string_filter | [Filter.StringFilter](#query-Filter-StringFilter) |  |  |
| int_filter | [Filter.IntFilter](#query-Filter-IntFilter) |  |  |
| timestamp_filter | [Filter.TimestampFilter](#query-Filter-TimestampFilter) |  |  |
| bool_filter | [Filter.BoolFilter](#query-Filter-BoolFilter) |  |  |






<a name="query-Filter-BoolFilter"></a>

### Filter.BoolFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| field | [string](#string) |  |  |
| value | [bool](#bool) |  |  |
| operator | [Filter.BoolFilter.BoolOperator](#query-Filter-BoolFilter-BoolOperator) |  |  |






<a name="query-Filter-IntFilter"></a>

### Filter.IntFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| field | [string](#string) |  |  |
| value | [int32](#int32) |  |  |
| operator | [Filter.IntFilter.IntOperator](#query-Filter-IntFilter-IntOperator) |  |  |






<a name="query-Filter-StringFilter"></a>

### Filter.StringFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| field | [string](#string) |  |  |
| value | [string](#string) |  |  |
| operator | [Filter.StringFilter.StringOperator](#query-Filter-StringFilter-StringOperator) |  |  |






<a name="query-Filter-TimestampFilter"></a>

### Filter.TimestampFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| field | [string](#string) |  |  |
| value | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| operator | [Filter.TimestampFilter.TimestampOperator](#query-Filter-TimestampFilter-TimestampOperator) |  |  |






<a name="query-QueryResult"></a>

### QueryResult



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| count_result | [int32](#int32) |  |  |
| aggregated_count_result | [QueryResult.AggregatedCount](#query-QueryResult-AggregatedCount) |  |  |
| average_result | [double](#double) |  |  |
| error | [common.ChaincodeError](#common-ChaincodeError) |  |  |






<a name="query-QueryResult-AggregatedCount"></a>

### QueryResult.AggregatedCount



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| map | [QueryResult.AggregatedCount.MapEntry](#query-QueryResult-AggregatedCount-MapEntry) | repeated |  |






<a name="query-QueryResult-AggregatedCount-MapEntry"></a>

### QueryResult.AggregatedCount.MapEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [int32](#int32) |  |  |






<a name="query-QueryTransaction"></a>

### QueryTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| submitter | [string](#string) |  |  |
| query_type | [string](#string) |  |  |
| field | [string](#string) |  |  |
| filters | [Filter](#query-Filter) | repeated |  |





 


<a name="query-Filter-BoolFilter-BoolOperator"></a>

### Filter.BoolFilter.BoolOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| EQUALS | 0 |  |



<a name="query-Filter-IntFilter-IntOperator"></a>

### Filter.IntFilter.IntOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| EQUALS | 0 |  |
| GREATER_THAN | 1 |  |
| LESS_THAN | 2 |  |
| GREATER_THAN_OR_EQUAL | 3 |  |
| LESS_THAN_OR_EQUAL | 4 |  |



<a name="query-Filter-StringFilter-StringOperator"></a>

### Filter.StringFilter.StringOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| EQUALS | 0 |  |
| CONTAINS | 1 |  |
| STARTS_WITH | 2 |  |
| ENDS_WITH | 3 |  |



<a name="query-Filter-TimestampFilter-TimestampOperator"></a>

### Filter.TimestampFilter.TimestampOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| EQUALS | 0 |  |
| BEFORE | 1 |  |
| AFTER | 2 |  |



<a name="query-QueryTransaction-QueryType"></a>

### QueryTransaction.QueryType


| Name | Number | Description |
| ---- | ------ | ----------- |
| COUNT | 0 |  |
| AGGREGATED_COUNT | 1 |  |
| AVERAGE | 2 |  |


 

 

 



<a name="schema_transaction-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/transaction.proto



<a name="transaction-EvaluateTransaction"></a>

### EvaluateTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| read_platform_config_transaction | [config.ReadPlatformConfigTransaction](#config-ReadPlatformConfigTransaction) |  |  |






<a name="transaction-SubmitTransaction"></a>

### SubmitTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query_transaction | [query.QueryTransaction](#query-QueryTransaction) |  |  |
| device_data_transaction | [devicedata.DeviceDataTransaction](#devicedata-DeviceDataTransaction) |  |  |
| write_platform_config_transaction | [config.WritePlatformConfigTransaction](#config-WritePlatformConfigTransaction) |  |  |





 

 

 

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

