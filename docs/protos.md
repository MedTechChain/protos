# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [devicemetadata/devidemetadata.proto](#devicemetadata_devidemetadata-proto)
    - [EncryptedDeviceMetadata](#devicemetadata-EncryptedDeviceMetadata)
    - [EncryptedFrequency](#devicemetadata-EncryptedFrequency)
    - [EncryptedPortableDeviceMetadata](#devicemetadata-EncryptedPortableDeviceMetadata)
    - [EncryptedWearableDeviceMetadata](#devicemetadata-EncryptedWearableDeviceMetadata)
    - [EncryptionMetadata](#devicemetadata-EncryptionMetadata)
    - [EncryptionSchemeList](#devicemetadata-EncryptionSchemeList)
    - [Filter](#devicemetadata-Filter)
    - [FilterList](#devicemetadata-FilterList)
    - [HospitalList](#devicemetadata-HospitalList)
    - [Query](#devicemetadata-Query)
    - [QueryResult](#devicemetadata-QueryResult)
  
    - [DeviceType](#devicemetadata-DeviceType)
    - [EncryptionScheme](#devicemetadata-EncryptionScheme)
    - [FrequencyUnit](#devicemetadata-FrequencyUnit)
    - [Hospital](#devicemetadata-Hospital)
    - [QueryType](#devicemetadata-QueryType)
    - [Speciality](#devicemetadata-Speciality)
  
- [Scalar Value Types](#scalar-value-types)



<a name="devicemetadata_devidemetadata-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## devicemetadata/devidemetadata.proto



<a name="devicemetadata-EncryptedDeviceMetadata"></a>

### EncryptedDeviceMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [DeviceType](#devicemetadata-DeviceType) |  |  |
| udi | [string](#string) |  |  |
| timestamp | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| encryption_metadata | [EncryptionMetadata](#devicemetadata-EncryptionMetadata) |  |  |
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
| speciality | [string](#string) |  |  |
| manufacturer_name | [string](#string) |  |  |
| operating_system | [string](#string) |  |  |
| operating_system_version | [string](#string) |  |  |
| price_aquired | [string](#string) | optional |  |
| price_rental | [string](#string) | optional |  |
| usage_frequency | [EncryptedFrequency](#devicemetadata-EncryptedFrequency) |  |  |






<a name="devicemetadata-EncryptedWearableDeviceMetadata"></a>

### EncryptedWearableDeviceMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| speciality | [string](#string) |  |  |
| manufacturer_name | [string](#string) |  |  |
| operating_system | [string](#string) |  |  |
| operating_system_version | [string](#string) |  |  |
| price_aquired | [string](#string) | optional |  |
| price_rental | [string](#string) | optional |  |
| data_sync_frequency | [EncryptedFrequency](#devicemetadata-EncryptedFrequency) |  |  |






<a name="devicemetadata-EncryptionMetadata"></a>

### EncryptionMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheme | [EncryptionScheme](#devicemetadata-EncryptionScheme) |  |  |
| key_version | [string](#string) |  |  |






<a name="devicemetadata-EncryptionSchemeList"></a>

### EncryptionSchemeList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| encryption_schemes | [EncryptionScheme](#devicemetadata-EncryptionScheme) | repeated |  |
| current | [EncryptionScheme](#devicemetadata-EncryptionScheme) |  |  |






<a name="devicemetadata-Filter"></a>

### Filter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| field | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="devicemetadata-FilterList"></a>

### FilterList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| filters | [Filter](#devicemetadata-Filter) | repeated |  |






<a name="devicemetadata-HospitalList"></a>

### HospitalList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hospitals | [Hospital](#devicemetadata-Hospital) | repeated |  |






<a name="devicemetadata-Query"></a>

### Query



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query_type | [QueryType](#devicemetadata-QueryType) |  |  |
| device_type | [DeviceType](#devicemetadata-DeviceType) | optional |  |
| hospitals_list | [HospitalList](#devicemetadata-HospitalList) | optional |  |
| start_time | [google.protobuf.Timestamp](#google-protobuf-Timestamp) | optional |  |
| stop_time | [google.protobuf.Timestamp](#google-protobuf-Timestamp) | optional |  |
| filters_list | [FilterList](#devicemetadata-FilterList) | optional |  |
| field | [string](#string) |  |  |
| value | [string](#string) | optional |  |






<a name="devicemetadata-QueryResult"></a>

### QueryResult



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query_type | [QueryType](#devicemetadata-QueryType) |  |  |
| raw | [string](#string) |  |  |





 


<a name="devicemetadata-DeviceType"></a>

### DeviceType
CHAINCODE &lt;=&gt; HOSPITALS
**************************************************************

| Name | Number | Description |
| ---- | ------ | ----------- |
| PORTABLE_DEVICE | 0 |  |
| WEARABLE_DEVICE | 1 |  |



<a name="devicemetadata-EncryptionScheme"></a>

### EncryptionScheme
ENCRYPTION
**************************************************************

| Name | Number | Description |
| ---- | ------ | ----------- |
| PAILLIER_2048 | 0 |  |
| PAILLIER_3072 | 1 |  |



<a name="devicemetadata-FrequencyUnit"></a>

### FrequencyUnit


| Name | Number | Description |
| ---- | ------ | ----------- |
| TIMES_PER_DAY | 0 |  |
| TIMES_PER_WEEK | 1 |  |
| TIMES_PER_MONTH | 2 |  |



<a name="devicemetadata-Hospital"></a>

### Hospital
CHAINCODE &lt;=&gt; ADMIN/RESEARCHER
**************************************************************

| Name | Number | Description |
| ---- | ------ | ----------- |
| MEDIVALE | 0 |  |
| HEALPOINT | 1 |  |
| LIFECARE | 2 |  |



<a name="devicemetadata-QueryType"></a>

### QueryType


| Name | Number | Description |
| ---- | ------ | ----------- |
| COUNT | 0 |  |
| AVERAGE | 1 |  |
| HISTOGRAM | 2 |  |



<a name="devicemetadata-Speciality"></a>

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

