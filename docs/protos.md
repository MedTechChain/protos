# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [schema/common.proto](#schema_common-proto)
    - [Error](#common-Error)
  
- [schema/encryption.proto](#schema_encryption-proto)
    - [EncryptionMetadata](#encryption-EncryptionMetadata)
    - [EncryptionSchemeList](#encryption-EncryptionSchemeList)
  
    - [EncryptionScheme](#encryption-EncryptionScheme)
  
- [schema/devicemetadata.proto](#schema_devicemetadata-proto)
    - [EncryptedDeviceMetadata](#devicemetadata-EncryptedDeviceMetadata)
    - [EncryptedFrequency](#devicemetadata-EncryptedFrequency)
    - [EncryptedPortableDeviceMetadata](#devicemetadata-EncryptedPortableDeviceMetadata)
    - [EncryptedWearableDeviceMetadata](#devicemetadata-EncryptedWearableDeviceMetadata)
  
    - [DeviceType](#devicemetadata-DeviceType)
    - [FrequencyUnit](#devicemetadata-FrequencyUnit)
  
- [schema/query.proto](#schema_query-proto)
    - [AverageResult](#query-AverageResult)
    - [CountAllResult](#query-CountAllResult)
    - [CountAllResult.ResultEntry](#query-CountAllResult-ResultEntry)
    - [CountResult](#query-CountResult)
    - [Filter](#query-Filter)
    - [FilterList](#query-FilterList)
    - [HospitalList](#query-HospitalList)
    - [Query](#query-Query)
  
    - [Hospital](#query-Hospital)
    - [QueryResultType](#query-QueryResultType)
    - [QueryType](#query-QueryType)
    - [Speciality](#query-Speciality)
  
- [Scalar Value Types](#scalar-value-types)



<a name="schema_common-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/common.proto



<a name="common-Error"></a>

### Error



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| message | [string](#string) |  |  |





 

 

 

 



<a name="schema_encryption-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/encryption.proto



<a name="encryption-EncryptionMetadata"></a>

### EncryptionMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheme | [EncryptionScheme](#encryption-EncryptionScheme) |  |  |
| key_version | [string](#string) |  |  |






<a name="encryption-EncryptionSchemeList"></a>

### EncryptionSchemeList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| encryption_schemes | [EncryptionScheme](#encryption-EncryptionScheme) | repeated |  |
| current | [EncryptionScheme](#encryption-EncryptionScheme) |  |  |





 


<a name="encryption-EncryptionScheme"></a>

### EncryptionScheme


| Name | Number | Description |
| ---- | ------ | ----------- |
| PAILLIER_2048 | 0 |  |
| PAILLIER_3072 | 1 |  |


 

 

 



<a name="schema_devicemetadata-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/devicemetadata.proto



<a name="devicemetadata-EncryptedDeviceMetadata"></a>

### EncryptedDeviceMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [DeviceType](#devicemetadata-DeviceType) |  |  |
| encryption_metadata | [encryption.EncryptionMetadata](#encryption-EncryptionMetadata) |  |  |
| raw_bytes | [bytes](#bytes) |  |  |






<a name="devicemetadata-EncryptedFrequency"></a>

### EncryptedFrequency



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [double](#double) |  |  |
| unit | [FrequencyUnit](#devicemetadata-FrequencyUnit) |  |  |






<a name="devicemetadata-EncryptedPortableDeviceMetadata"></a>

### EncryptedPortableDeviceMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| udi | [string](#string) |  |  |
| medical_speciality | [string](#string) |  |  |
| manufacturer_name | [string](#string) |  |  |
| operating_system | [string](#string) |  |  |
| operating_system_version | [string](#string) |  |  |
| aquired_price | [string](#string) |  |  |
| rental_price | [string](#string) |  |  |
| usage_frequency | [EncryptedFrequency](#devicemetadata-EncryptedFrequency) |  |  |






<a name="devicemetadata-EncryptedWearableDeviceMetadata"></a>

### EncryptedWearableDeviceMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| udi | [string](#string) |  |  |
| medical_speciality | [string](#string) |  |  |
| manufacturer_name | [string](#string) |  |  |
| operating_system | [string](#string) |  |  |
| operating_system_version | [string](#string) |  |  |
| aquired_price | [string](#string) |  |  |
| rental_price | [string](#string) |  |  |
| data_sync_frequency | [EncryptedFrequency](#devicemetadata-EncryptedFrequency) |  |  |





 


<a name="devicemetadata-DeviceType"></a>

### DeviceType


| Name | Number | Description |
| ---- | ------ | ----------- |
| PORTABLE_DEVICE | 0 |  |
| WEARABLE_DEVICE | 1 |  |



<a name="devicemetadata-FrequencyUnit"></a>

### FrequencyUnit


| Name | Number | Description |
| ---- | ------ | ----------- |
| TIMES_PER_DAY | 0 |  |
| TIMES_PER_WEEK | 1 |  |
| TIMES_PER_MONTH | 2 |  |


 

 

 



<a name="schema_query-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schema/query.proto



<a name="query-AverageResult"></a>

### AverageResult



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [double](#double) |  |  |






<a name="query-CountAllResult"></a>

### CountAllResult



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [CountAllResult.ResultEntry](#query-CountAllResult-ResultEntry) | repeated |  |






<a name="query-CountAllResult-ResultEntry"></a>

### CountAllResult.ResultEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [int32](#int32) |  |  |






<a name="query-CountResult"></a>

### CountResult



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [int32](#int32) |  |  |






<a name="query-Filter"></a>

### Filter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| field | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="query-FilterList"></a>

### FilterList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| filters | [Filter](#query-Filter) | repeated |  |






<a name="query-HospitalList"></a>

### HospitalList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hospitals | [Hospital](#query-Hospital) | repeated |  |






<a name="query-Query"></a>

### Query



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query_type | [QueryType](#query-QueryType) |  |  |
| device_type | [devicemetadata.DeviceType](#devicemetadata-DeviceType) | optional |  |
| hospital_list | [HospitalList](#query-HospitalList) | optional |  |
| start_time | [google.protobuf.Timestamp](#google-protobuf-Timestamp) | optional |  |
| stop_time | [google.protobuf.Timestamp](#google-protobuf-Timestamp) | optional |  |
| filter_list | [FilterList](#query-FilterList) | optional |  |
| field | [string](#string) |  |  |
| value | [string](#string) | optional |  |





 


<a name="query-Hospital"></a>

### Hospital


| Name | Number | Description |
| ---- | ------ | ----------- |
| MEDIVALE | 0 |  |
| HEALPOINT | 1 |  |
| LIFECARE | 2 |  |



<a name="query-QueryResultType"></a>

### QueryResultType


| Name | Number | Description |
| ---- | ------ | ----------- |
| COUNT_RESULT | 0 |  |
| COUNT_ALL_RESULT | 1 |  |
| AVERAGE_RESULT | 2 |  |
| ERROR | 3 |  |



<a name="query-QueryType"></a>

### QueryType


| Name | Number | Description |
| ---- | ------ | ----------- |
| COUNT | 0 |  |
| COUNT_ALL | 1 |  |
| AVERAGE | 2 |  |



<a name="query-Speciality"></a>

### Speciality


| Name | Number | Description |
| ---- | ------ | ----------- |
| ONCOLOGY | 0 |  |
| CARDIOLOGY | 1 |  |
| NEUROLOGY | 2 |  |
| OTHER | 3 |  |


 

 

 



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

