# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [common/common.proto](#common_common-proto)
    - [ChaincodeError](#common-ChaincodeError)
    - [ChaincodeResponse](#common-ChaincodeResponse)
    - [ChaincodeSuccess](#common-ChaincodeSuccess)
  
    - [ChaincodeError.ErrorCode](#common-ChaincodeError-ErrorCode)
  
- [config/config.proto](#config_config-proto)
    - [AuditableKeyExchangeConfig](#config-AuditableKeyExchangeConfig)
    - [DifferentialPrivacyConfig](#config-DifferentialPrivacyConfig)
    - [EncryptionConfig](#config-EncryptionConfig)
    - [EncryptionConfig.Paillier](#config-EncryptionConfig-Paillier)
    - [FeatureConfig](#config-FeatureConfig)
    - [InputConfig](#config-InputConfig)
    - [ParticipantConfig](#config-ParticipantConfig)
    - [ParticipantConfig.HospitalConfig](#config-ParticipantConfig-HospitalConfig)
    - [PlatformConfig](#config-PlatformConfig)
    - [QueryConfig](#config-QueryConfig)
    - [ReadPlatformConfigResponse](#config-ReadPlatformConfigResponse)
    - [ReadPlatformConfigTransaction](#config-ReadPlatformConfigTransaction)
    - [WritePlatformConfigTransaction](#config-WritePlatformConfigTransaction)
  
- [devicedata/devicedata.proto](#devicedata_devicedata-proto)
    - [DeviceDataTransaction](#devicedata-DeviceDataTransaction)
    - [DeviceDataTransaction.DeviceData](#devicedata-DeviceDataTransaction-DeviceData)
  
    - [DeviceDataTransaction.DeviceCategory](#devicedata-DeviceDataTransaction-DeviceCategory)
  
- [query/query.proto](#query_query-proto)
    - [Filter](#query-Filter)
    - [Filter.BoolFilter](#query-Filter-BoolFilter)
    - [Filter.IntFilter](#query-Filter-IntFilter)
    - [Filter.StringFilter](#query-Filter-StringFilter)
    - [Filter.TimestampFilter](#query-Filter-TimestampFilter)
    - [QueryResult](#query-QueryResult)
    - [QueryResult.GroupedCount](#query-QueryResult-GroupedCount)
    - [QueryResult.GroupedCount.MapEntry](#query-QueryResult-GroupedCount-MapEntry)
    - [QueryTransaction](#query-QueryTransaction)
  
    - [Filter.BoolFilter.BoolOperator](#query-Filter-BoolFilter-BoolOperator)
    - [Filter.IntFilter.IntOperator](#query-Filter-IntFilter-IntOperator)
    - [Filter.StringFilter.StringOperator](#query-Filter-StringFilter-StringOperator)
    - [Filter.TimestampFilter.TimestampOperator](#query-Filter-TimestampFilter-TimestampOperator)
    - [QueryTransaction.QueryType](#query-QueryTransaction-QueryType)
  
- [Scalar Value Types](#scalar-value-types)



<a name="common_common-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## common/common.proto



<a name="common-ChaincodeError"></a>

### ChaincodeError



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| code | [ChaincodeError.ErrorCode](#common-ChaincodeError-ErrorCode) |  |  |
| message | [string](#string) |  |  |
| details | [string](#string) |  |  |






<a name="common-ChaincodeResponse"></a>

### ChaincodeResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [ChaincodeSuccess](#common-ChaincodeSuccess) |  |  |
| error | [ChaincodeError](#common-ChaincodeError) |  |  |






<a name="common-ChaincodeSuccess"></a>

### ChaincodeSuccess



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| message | [string](#string) |  |  |





 


<a name="common-ChaincodeError-ErrorCode"></a>

### ChaincodeError.ErrorCode


| Name | Number | Description |
| ---- | ------ | ----------- |
| ERROR_CODE_UNSPECIFIED | 0 | Generic errors |
| ERROR_CODE_INTERNAL_ERROR | 1 |  |
| ERROR_CODE_INVALID_REQUEST | 2 |  |
| ERROR_CODE_UNAUTHENTICATED | 100 | Authentication and authorization errors |
| ERROR_CODE_PERMISSION_DENIED | 101 |  |
| ERROR_CODE_NOT_FOUND | 200 | Resource errors |
| ERROR_CODE_ALREADY_EXISTS | 201 |  |
| ERROR_CODE_TRANSACTION_FAILURE | 300 | Transaction and state errors |
| ERROR_CODE_STATE_ERROR | 301 |  |
| ERROR_CODE_INVALID_TRANSACTION | 302 |  |
| ERROR_CODE_DUPLICATE_TRANSACTION | 303 |  |
| ERROR_CODE_INVALID_ARGUMENT | 400 | Data errors |
| ERROR_CODE_DATA_INCONSISTENCY | 401 |  |
| ERROR_CODE_DATA_VALIDATION_ERROR | 402 |  |
| ERROR_CODE_NETWORK_FAILURE | 500 | Network and communication errors |
| ERROR_CODE_PEER_UNAVAILABLE | 501 |  |
| ERROR_CODE_ORDERER_UNAVAILABLE | 502 |  |
| ERROR_CODE_TIMEOUT | 503 |  |
| ERROR_CODE_LEDGER_ERROR | 600 | Ledger errors |
| ERROR_CODE_COMMIT_FAILURE | 601 |  |
| ERROR_CODE_READ_FAILURE | 602 |  |
| ERROR_CODE_WRITE_FAILURE | 603 |  |
| ERROR_CODE_CUSTOM_ERROR | 1000 | Custom application-specific errors |


 

 

 



<a name="config_config-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## config/config.proto



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
| epsilon | [double](#double) |  |  |






<a name="config-EncryptionConfig"></a>

### EncryptionConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enabled | [bool](#bool) |  |  |
| paillier | [EncryptionConfig.Paillier](#config-EncryptionConfig-Paillier) |  |  |






<a name="config-EncryptionConfig-Paillier"></a>

### EncryptionConfig.Paillier



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key_size | [int32](#int32) |  |  |
| public_key | [string](#string) |  |  |
| trusted_third_party_endpoint | [string](#string) |  |  |






<a name="config-FeatureConfig"></a>

### FeatureConfig
FEATURES


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query_config | [QueryConfig](#config-QueryConfig) |  |  |
| auditable_key_exchange_config | [AuditableKeyExchangeConfig](#config-AuditableKeyExchangeConfig) |  |  |






<a name="config-InputConfig"></a>

### InputConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| valid_count_fields | [string](#string) | repeated |  |
| valid_grouped_count_fields | [string](#string) | repeated |  |
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
| encryption_config | [EncryptionConfig](#config-EncryptionConfig) |  |  |






<a name="config-ReadPlatformConfigResponse"></a>

### ReadPlatformConfigResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| platform_config | [PlatformConfig](#config-PlatformConfig) |  |  |
| encryption_version | [string](#string) |  |  |






<a name="config-ReadPlatformConfigTransaction"></a>

### ReadPlatformConfigTransaction







<a name="config-WritePlatformConfigTransaction"></a>

### WritePlatformConfigTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| platform_config | [PlatformConfig](#config-PlatformConfig) |  |  |





 

 

 

 



<a name="devicedata_devicedata-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## devicedata/devicedata.proto



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
| last_sync_time | [string](#string) |  |  |
| sync_frequency | [string](#string) |  |  |
| mac_address | [string](#string) |  |  |





 


<a name="devicedata-DeviceDataTransaction-DeviceCategory"></a>

### DeviceDataTransaction.DeviceCategory


| Name | Number | Description |
| ---- | ------ | ----------- |
| DEVICE_CATEGORY_UNSPECIFIED | 0 |  |
| DEVICE_CATEGORY_PORTABLE | 1 |  |
| DEVICE_CATEGORY_WEARABLE | 2 |  |


 

 

 



<a name="query_query-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## query/query.proto



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
| grouped_count_result | [QueryResult.GroupedCount](#query-QueryResult-GroupedCount) |  |  |
| average_result | [double](#double) |  |  |
| error | [common.ChaincodeError](#common-ChaincodeError) |  |  |






<a name="query-QueryResult-GroupedCount"></a>

### QueryResult.GroupedCount



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| map | [QueryResult.GroupedCount.MapEntry](#query-QueryResult-GroupedCount-MapEntry) | repeated |  |






<a name="query-QueryResult-GroupedCount-MapEntry"></a>

### QueryResult.GroupedCount.MapEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [int32](#int32) |  |  |






<a name="query-QueryTransaction"></a>

### QueryTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| submitter | [string](#string) |  |  |
| query_type | [QueryTransaction.QueryType](#query-QueryTransaction-QueryType) |  |  |
| field | [string](#string) |  |  |
| filters | [Filter](#query-Filter) | repeated |  |





 


<a name="query-Filter-BoolFilter-BoolOperator"></a>

### Filter.BoolFilter.BoolOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| BOOL_OPERATOR_UNSPECIFIED | 0 |  |
| BOOL_OPERATOR_EQUALS | 1 |  |



<a name="query-Filter-IntFilter-IntOperator"></a>

### Filter.IntFilter.IntOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| INT_OPERATOR_UNSPECIFIED | 0 |  |
| INT_OPERATOR_EQUALS | 1 |  |
| INT_OPERATOR_GREATER_THAN | 2 |  |
| INT_OPERATOR_LESS_THAN | 3 |  |
| INT_OPERATOR_GREATER_THAN_OR_EQUAL | 4 |  |
| INT_OPERATOR_LESS_THAN_OR_EQUAL | 5 |  |



<a name="query-Filter-StringFilter-StringOperator"></a>

### Filter.StringFilter.StringOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| STRING_OPERATOR_UNSPECIFIED | 0 |  |
| STRING_OPERATOR_EQUALS | 1 |  |
| STRING_OPERATOR_CONTAINS | 2 |  |
| STRING_OPERATOR_STARTS_WITH | 3 |  |
| STRING_OPERATOR_ENDS_WITH | 4 |  |



<a name="query-Filter-TimestampFilter-TimestampOperator"></a>

### Filter.TimestampFilter.TimestampOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| TIMESTAMP_OPERATOR_UNSPECIFIED | 0 |  |
| TIMESTAMP_OPERATOR_EQUALS | 1 |  |
| TIMESTAMP_OPERATOR_BEFORE | 2 |  |
| TIMESTAMP_OPERATOR_AFTER | 3 |  |



<a name="query-QueryTransaction-QueryType"></a>

### QueryTransaction.QueryType


| Name | Number | Description |
| ---- | ------ | ----------- |
| QUERY_TYPE_UNSPECIFIED | 0 |  |
| QUERY_TYPE_COUNT | 1 |  |
| QUERY_TYPE_GROUPED_COUNT | 2 |  |
| QUERY_TYPE_AVERAGE | 3 |  |


 

 

 



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

