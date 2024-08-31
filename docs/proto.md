# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [common/common.proto](#common_common-proto)
    - [ChaincodeError](#common-ChaincodeError)
    - [ChaincodeResponse](#common-ChaincodeResponse)
    - [ChaincodeSuccess](#common-ChaincodeSuccess)
  
    - [ChaincodeError.ErrorCode](#common-ChaincodeError-ErrorCode)
  
- [config/config.proto](#config_config-proto)
    - [NetworkConfig](#config-NetworkConfig)
    - [NetworkConfig.HospitalConfig](#config-NetworkConfig-HospitalConfig)
    - [NetworkConfig.HospitalConfig.Entry](#config-NetworkConfig-HospitalConfig-Entry)
    - [PlatformConfig](#config-PlatformConfig)
    - [PlatformConfig.Entry](#config-PlatformConfig-Entry)
    - [UpdateNetworkConfig](#config-UpdateNetworkConfig)
    - [UpdatePlatformConfig](#config-UpdatePlatformConfig)
  
    - [NetworkConfig.HospitalConfig.Config](#config-NetworkConfig-HospitalConfig-Config)
    - [PlatformConfig.Config](#config-PlatformConfig-Config)
  
- [devicedata/devicedata.proto](#devicedata_devicedata-proto)
    - [DeviceDataAsset](#devicedata-DeviceDataAsset)
    - [DeviceDataAsset.BoolField](#devicedata-DeviceDataAsset-BoolField)
    - [DeviceDataAsset.DeviceCategoryField](#devicedata-DeviceDataAsset-DeviceCategoryField)
    - [DeviceDataAsset.DeviceData](#devicedata-DeviceDataAsset-DeviceData)
    - [DeviceDataAsset.IntegerField](#devicedata-DeviceDataAsset-IntegerField)
    - [DeviceDataAsset.MedicalSpecialityField](#devicedata-DeviceDataAsset-MedicalSpecialityField)
    - [DeviceDataAsset.StringField](#devicedata-DeviceDataAsset-StringField)
    - [DeviceDataAsset.TimestampField](#devicedata-DeviceDataAsset-TimestampField)
  
    - [DeviceCategory](#devicedata-DeviceCategory)
    - [DeviceDataFieldType](#devicedata-DeviceDataFieldType)
    - [MedicalSpeciality](#devicedata-MedicalSpeciality)
  
- [query/query.proto](#query_query-proto)
    - [Filter](#query-Filter)
    - [Filter.BoolFilter](#query-Filter-BoolFilter)
    - [Filter.EnumFilter](#query-Filter-EnumFilter)
    - [Filter.IntegerFilter](#query-Filter-IntegerFilter)
    - [Filter.StringFilter](#query-Filter-StringFilter)
    - [Filter.TimestampFilter](#query-Filter-TimestampFilter)
    - [Query](#query-Query)
    - [QueryAsset](#query-QueryAsset)
    - [QueryAssetPage](#query-QueryAssetPage)
    - [QueryResult](#query-QueryResult)
    - [QueryResult.GroupedCount](#query-QueryResult-GroupedCount)
    - [QueryResult.GroupedCount.MapEntry](#query-QueryResult-GroupedCount-MapEntry)
    - [ReadQueryAssetPage](#query-ReadQueryAssetPage)
  
    - [Filter.BoolFilter.BoolOperator](#query-Filter-BoolFilter-BoolOperator)
    - [Filter.IntegerFilter.IntOperator](#query-Filter-IntegerFilter-IntOperator)
    - [Filter.StringFilter.StringOperator](#query-Filter-StringFilter-StringOperator)
    - [Filter.TimestampFilter.TimestampOperator](#query-Filter-TimestampFilter-TimestampOperator)
    - [Query.QueryType](#query-Query-QueryType)
  
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
| details | [string](#string) | optional |  |






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
| message | [string](#string) | optional |  |





 


<a name="common-ChaincodeError-ErrorCode"></a>

### ChaincodeError.ErrorCode


| Name | Number | Description |
| ---- | ------ | ----------- |
| ERROR_CODE_UNSPECIFIED | 0 | Generic errors |
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


 

 

 



<a name="config_config-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## config/config.proto



<a name="config-NetworkConfig"></a>

### NetworkConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  |  |
| timestamp | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| list | [NetworkConfig.HospitalConfig](#config-NetworkConfig-HospitalConfig) | repeated |  |






<a name="config-NetworkConfig-HospitalConfig"></a>

### NetworkConfig.HospitalConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  |  |
| map | [NetworkConfig.HospitalConfig.Entry](#config-NetworkConfig-HospitalConfig-Entry) | repeated |  |






<a name="config-NetworkConfig-HospitalConfig-Entry"></a>

### NetworkConfig.HospitalConfig.Entry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [NetworkConfig.HospitalConfig.Config](#config-NetworkConfig-HospitalConfig-Config) |  |  |
| value | [string](#string) |  |  |






<a name="config-PlatformConfig"></a>

### PlatformConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  |  |
| timestamp | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| map | [PlatformConfig.Entry](#config-PlatformConfig-Entry) | repeated |  |






<a name="config-PlatformConfig-Entry"></a>

### PlatformConfig.Entry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [PlatformConfig.Config](#config-PlatformConfig-Config) |  |  |
| value | [string](#string) |  |  |






<a name="config-UpdateNetworkConfig"></a>

### UpdateNetworkConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  |  |
| map | [NetworkConfig.HospitalConfig.Entry](#config-NetworkConfig-HospitalConfig-Entry) | repeated |  |






<a name="config-UpdatePlatformConfig"></a>

### UpdatePlatformConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| map | [PlatformConfig.Entry](#config-PlatformConfig-Entry) | repeated |  |





 


<a name="config-NetworkConfig-HospitalConfig-Config"></a>

### NetworkConfig.HospitalConfig.Config


| Name | Number | Description |
| ---- | ------ | ----------- |
| CONFIG_UNSPECIFIED | 0 |  |
| CONFIG_HOSPITAL_APPLICATION_SERVER_ADDRESS | 1 | string -&gt; hostname:port |



<a name="config-PlatformConfig-Config"></a>

### PlatformConfig.Config


| Name | Number | Description |
| ---- | ------ | ----------- |
| CONFIG_UNSPECIFIED | 0 |  |
| CONFIG_FEATURE_QUERY_INTERFACE_COUNT_FIELDS | 1 | comma separated repeated string -&gt; s1,s2,s3 |
| CONFIG_FEATURE_QUERY_INTERFACE_GROUPED_COUNT_FIELDS | 2 | comma separated repeated string -&gt; s1,s2,s3 |
| CONFIG_FEATURE_QUERY_INTERFACE_AVERAGE_FIELDS | 3 | comma separated repeated string -&gt; s1,s2,s3 |
| CONFIG_FEATURE_QUERY_DIFFERENTIAL_PRIVACY | 4 | none | laplace |
| CONFIG_FEATURE_QUERY_DIFFERENTIAL_PRIVACY_LAPLACE_EPSILON | 5 | double |
| CONFIG_FEATURE_QUERY_ENCRYPTION_SCHEME | 6 | none | paillier |
| CONFIG_FEATURE_QUERY_ENCRYPTION_PAILLIER_BIT_LENGTH | 7 | int |
| CONFIG_FEATURE_QUERY_ENCRYPTION_PAILLIER_PUBLIC_KEY | 8 | string -&gt; big integer |
| CONFIG_FEATURE_QUERY_ENCRYPTION_PAILLIER_TTP_ADRRESS | 9 | string -&gt; hostname:port |
| CONFIG_FEATURE_AUDITING_KEY_EXCHANGE_ENABLED | 10 | boolean |


 

 

 



<a name="devicedata_devicedata-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## devicedata/devicedata.proto



<a name="devicedata-DeviceDataAsset"></a>

### DeviceDataAsset



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| timestamp | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| config_id | [string](#string) |  |  |
| device_data | [DeviceDataAsset.DeviceData](#devicedata-DeviceDataAsset-DeviceData) |  |  |






<a name="devicedata-DeviceDataAsset-BoolField"></a>

### DeviceDataAsset.BoolField



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| plain | [bool](#bool) |  |  |
| encrypted | [string](#string) |  |  |






<a name="devicedata-DeviceDataAsset-DeviceCategoryField"></a>

### DeviceDataAsset.DeviceCategoryField



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| plain | [DeviceCategory](#devicedata-DeviceCategory) |  |  |
| encrypted | [string](#string) |  |  |






<a name="devicedata-DeviceDataAsset-DeviceData"></a>

### DeviceDataAsset.DeviceData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hospital | [DeviceDataAsset.StringField](#devicedata-DeviceDataAsset-StringField) |  |  |
| manufacturer | [DeviceDataAsset.StringField](#devicedata-DeviceDataAsset-StringField) |  |  |
| model | [DeviceDataAsset.StringField](#devicedata-DeviceDataAsset-StringField) |  |  |
| firmware_version | [DeviceDataAsset.StringField](#devicedata-DeviceDataAsset-StringField) |  |  |
| device_type | [DeviceDataAsset.StringField](#devicedata-DeviceDataAsset-StringField) |  |  |
| production_date | [DeviceDataAsset.TimestampField](#devicedata-DeviceDataAsset-TimestampField) |  |  |
| last_service_date | [DeviceDataAsset.TimestampField](#devicedata-DeviceDataAsset-TimestampField) |  |  |
| warranty_expiry_date | [DeviceDataAsset.TimestampField](#devicedata-DeviceDataAsset-TimestampField) |  |  |
| last_sync_time | [DeviceDataAsset.TimestampField](#devicedata-DeviceDataAsset-TimestampField) |  |  |
| usage_hours | [DeviceDataAsset.IntegerField](#devicedata-DeviceDataAsset-IntegerField) |  |  |
| battery_level | [DeviceDataAsset.IntegerField](#devicedata-DeviceDataAsset-IntegerField) |  |  |
| sync_frequency_seconds | [DeviceDataAsset.IntegerField](#devicedata-DeviceDataAsset-IntegerField) |  |  |
| active_status | [DeviceDataAsset.BoolField](#devicedata-DeviceDataAsset-BoolField) |  |  |
| speciality | [DeviceDataAsset.MedicalSpecialityField](#devicedata-DeviceDataAsset-MedicalSpecialityField) |  |  |
| category | [DeviceDataAsset.DeviceCategoryField](#devicedata-DeviceDataAsset-DeviceCategoryField) |  |  |






<a name="devicedata-DeviceDataAsset-IntegerField"></a>

### DeviceDataAsset.IntegerField



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| plain | [int64](#int64) |  |  |
| encrypted | [string](#string) |  |  |






<a name="devicedata-DeviceDataAsset-MedicalSpecialityField"></a>

### DeviceDataAsset.MedicalSpecialityField



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| plain | [MedicalSpeciality](#devicedata-MedicalSpeciality) |  |  |
| encrypted | [string](#string) |  |  |






<a name="devicedata-DeviceDataAsset-StringField"></a>

### DeviceDataAsset.StringField



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| plain | [string](#string) |  |  |
| encrypted | [string](#string) |  |  |






<a name="devicedata-DeviceDataAsset-TimestampField"></a>

### DeviceDataAsset.TimestampField



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| plain | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| encrypted | [string](#string) |  |  |





 


<a name="devicedata-DeviceCategory"></a>

### DeviceCategory


| Name | Number | Description |
| ---- | ------ | ----------- |
| DEVICE_CATEGORY_UNSPECIFIED | 0 |  |
| PORTABLE | 1 |  |
| WEARABLE | 2 |  |



<a name="devicedata-DeviceDataFieldType"></a>

### DeviceDataFieldType


| Name | Number | Description |
| ---- | ------ | ----------- |
| DEVICE_DATA_FIELD_TYPE_UNSPECIFIED | 0 |  |
| STRING | 1 |  |
| TIMESTAMP | 2 |  |
| INTEGER | 3 |  |
| BOOL | 4 |  |
| DEVICE_CATEGORY | 5 |  |
| MEDICAL_SPECIALITY | 6 |  |



<a name="devicedata-MedicalSpeciality"></a>

### MedicalSpeciality


| Name | Number | Description |
| ---- | ------ | ----------- |
| MEDICAL_SPECIALITY_UNSPECIFIED | 0 |  |
| ALLERGY_AND_IMMUNOLOGY | 1 |  |
| ANESTHESIOLOGY | 2 |  |
| DERMATOLOGY | 3 |  |
| DIAGNOSTIC_RADIOLOGY | 4 |  |
| EMERGENCY_MEDICINE | 5 |  |
| FAMILY_MEDICINE | 6 |  |
| INTERNAL_MEDICINE | 7 |  |
| MEDICAL_GENETICS | 8 |  |
| NEUROLOGY | 9 |  |
| NUCLEAR_MEDICINE | 10 |  |
| OBSTETRICS_AND_GYNECOLOGY | 11 |  |
| OPHTHALMOLOGY | 12 |  |
| PATHOLOGY | 13 |  |
| PEDIATRICS | 14 |  |
| PHYSICAL_MEDICINE_AND_REHABILITATION | 15 |  |
| PREVENTIVE_MEDICINE | 16 |  |
| PSYCHIATRY | 17 |  |
| RADIATION_ONCOLOGY | 18 |  |
| SURGERY | 19 |  |
| UROLOGY | 20 |  |
| CARDIOLOGY | 21 |  |
| ENDOCRINOLOGY | 22 |  |
| GASTROENTEROLOGY | 23 |  |
| GERIATRICS | 24 |  |
| HEMATOLOGY | 25 |  |
| INFECTIOUS_DISEASE | 26 |  |
| NEPHROLOGY | 27 |  |
| ONCOLOGY | 28 |  |
| PULMONOLOGY | 29 |  |
| RHEUMATOLOGY | 30 |  |
| ORTHOPEDICS | 31 |  |
| OTOLARYNGOLOGY | 32 |  |
| PLASTIC_SURGERY | 33 |  |
| VASCULAR_SURGERY | 34 |  |
| THORACIC_SURGERY | 35 |  |
| NEUROSURGERY | 36 |  |
| PODIATRY | 37 |  |
| DENTISTRY | 38 |  |
| ORAL_AND_MAXILLOFACIAL_SURGERY | 39 |  |
| AUDIOLOGY | 40 |  |
| SPEECH_LANGUAGE_PATHOLOGY | 41 |  |
| OCCUPATIONAL_THERAPY | 42 |  |
| PHYSICAL_THERAPY | 43 |  |
| CHIROPRACTIC | 44 |  |
| PAIN_MEDICINE | 45 |  |
| SPORTS_MEDICINE | 46 |  |
| PALLIATIVE_CARE | 47 |  |
| PHARMACOLOGY | 48 |  |
| NUTRITION | 49 |  |
| MIDWIFERY | 50 |  |
| NEONATOLOGY | 51 |  |
| CRITICAL_CARE | 52 |  |
| HOSPICE_AND_PALLIATIVE_MEDICINE | 53 |  |
| SLEEP_MEDICINE | 54 |  |
| CLINICAL_NEUROPHYSIOLOGY | 55 |  |


 

 

 



<a name="query_query-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## query/query.proto



<a name="query-Filter"></a>

### Filter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| field | [string](#string) |  |  |
| string_filter | [Filter.StringFilter](#query-Filter-StringFilter) |  |  |
| integer_filter | [Filter.IntegerFilter](#query-Filter-IntegerFilter) |  |  |
| timestamp_filter | [Filter.TimestampFilter](#query-Filter-TimestampFilter) |  |  |
| bool_filter | [Filter.BoolFilter](#query-Filter-BoolFilter) |  |  |
| enum_filter | [Filter.EnumFilter](#query-Filter-EnumFilter) |  |  |






<a name="query-Filter-BoolFilter"></a>

### Filter.BoolFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [bool](#bool) |  |  |
| operator | [Filter.BoolFilter.BoolOperator](#query-Filter-BoolFilter-BoolOperator) |  |  |






<a name="query-Filter-EnumFilter"></a>

### Filter.EnumFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [string](#string) |  |  |






<a name="query-Filter-IntegerFilter"></a>

### Filter.IntegerFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [int64](#int64) |  |  |
| operator | [Filter.IntegerFilter.IntOperator](#query-Filter-IntegerFilter-IntOperator) |  |  |






<a name="query-Filter-StringFilter"></a>

### Filter.StringFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [string](#string) |  |  |
| operator | [Filter.StringFilter.StringOperator](#query-Filter-StringFilter-StringOperator) |  |  |






<a name="query-Filter-TimestampFilter"></a>

### Filter.TimestampFilter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| operator | [Filter.TimestampFilter.TimestampOperator](#query-Filter-TimestampFilter-TimestampOperator) |  |  |






<a name="query-Query"></a>

### Query



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| submitter | [string](#string) |  |  |
| query_type | [Query.QueryType](#query-Query-QueryType) |  |  |
| target_field | [string](#string) |  |  |
| filters | [Filter](#query-Filter) | repeated |  |
| start_time | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| end_time | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |






<a name="query-QueryAsset"></a>

### QueryAsset



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query | [Query](#query-Query) |  |  |
| result | [QueryResult](#query-QueryResult) |  |  |
| request_time | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| response_time | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |






<a name="query-QueryAssetPage"></a>

### QueryAssetPage



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| page_number | [int32](#int32) |  |  |
| page_size | [int32](#int32) |  |  |
| assets | [QueryAsset](#query-QueryAsset) | repeated |  |






<a name="query-QueryResult"></a>

### QueryResult



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| count_result | [int64](#int64) |  |  |
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
| value | [int64](#int64) |  |  |






<a name="query-ReadQueryAssetPage"></a>

### ReadQueryAssetPage



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| page_number | [int32](#int32) |  |  |
| page_size | [int32](#int32) |  |  |





 


<a name="query-Filter-BoolFilter-BoolOperator"></a>

### Filter.BoolFilter.BoolOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| BOOL_OPERATOR_UNSPECIFIED | 0 |  |
| EQUALS | 1 |  |



<a name="query-Filter-IntegerFilter-IntOperator"></a>

### Filter.IntegerFilter.IntOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| INT_OPERATOR_UNSPECIFIED | 0 |  |
| EQUALS | 1 |  |
| GREATER_THAN | 2 |  |
| LESS_THAN | 3 |  |
| GREATER_THAN_OR_EQUAL | 4 |  |
| LESS_THAN_OR_EQUAL | 5 |  |



<a name="query-Filter-StringFilter-StringOperator"></a>

### Filter.StringFilter.StringOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| STRING_OPERATOR_UNSPECIFIED | 0 |  |
| EQUALS | 1 |  |
| CONTAINS | 2 |  |
| STARTS_WITH | 3 |  |
| ENDS_WITH | 4 |  |



<a name="query-Filter-TimestampFilter-TimestampOperator"></a>

### Filter.TimestampFilter.TimestampOperator


| Name | Number | Description |
| ---- | ------ | ----------- |
| TIMESTAMP_OPERATOR_UNSPECIFIED | 0 |  |
| EQUALS | 1 |  |
| BEFORE | 2 |  |
| AFTER | 3 |  |



<a name="query-Query-QueryType"></a>

### Query.QueryType


| Name | Number | Description |
| ---- | ------ | ----------- |
| QUERY_TYPE_UNSPECIFIED | 0 |  |
| COUNT | 1 |  |
| GROUPED_COUNT | 2 |  |
| AVERAGE | 3 |  |


 

 

 



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

