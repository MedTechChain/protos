# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [devicemetadata/devidemetadata.proto](#devicemetadata_devidemetadata-proto)
    - [BedsideMonitor](#devicemetadata-BedsideMonitor)
    - [BedsideMonitorEncrypted](#devicemetadata-BedsideMonitorEncrypted)
    - [WearableDevice](#devicemetadata-WearableDevice)
    - [WearableDeviceEncrypted](#devicemetadata-WearableDeviceEncrypted)
  
- [Scalar Value Types](#scalar-value-types)



<a name="devicemetadata_devidemetadata-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## devicemetadata/devidemetadata.proto



<a name="devicemetadata-BedsideMonitor"></a>

### BedsideMonitor



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| device_manufacturer | [string](#string) |  |  |
| device_serial_number | [string](#string) |  |  |
| software_version | [int32](#int32) |  |  |
| udi_device_name | [string](#string) |  |  |
| timestamp | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| has_ecg_module | [bool](#bool) |  |  |
| has_resp_module | [bool](#bool) |  |  |
| has_spo2_module | [bool](#bool) |  |  |
| has_nibp_module | [bool](#bool) |  |  |
| has_temp_module | [bool](#bool) |  |  |
| has_2_channel_invbp_module | [bool](#bool) |  |  |
| has_sidestream_co2_module | [bool](#bool) |  |  |
| has_entropy_module | [bool](#bool) |  |  |
| has_sidestream_n2o_module | [bool](#bool) |  |  |
| has_neuromuscular_transmission_module | [bool](#bool) |  |  |
| has_cardiac_output_module | [bool](#bool) |  |  |






<a name="devicemetadata-BedsideMonitorEncrypted"></a>

### BedsideMonitorEncrypted



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| device_manufacturer | [string](#string) |  |  |
| device_serial_number | [string](#string) |  |  |
| software_version | [string](#string) |  |  |
| udi_device_name | [string](#string) |  |  |
| timestamp | [string](#string) |  |  |
| has_ecg_module | [string](#string) |  |  |
| has_resp_module | [string](#string) |  |  |
| has_spo2_module | [string](#string) |  |  |
| has_nibp_module | [string](#string) |  |  |
| has_temp_module | [string](#string) |  |  |
| has_2_channel_invbp_module | [string](#string) |  |  |
| has_sidestream_co2_module | [string](#string) |  |  |
| has_entropy_module | [string](#string) |  |  |
| has_sidestream_n2o_module | [string](#string) |  |  |
| has_neuromuscular_transmission_module | [string](#string) |  |  |
| has_cardiac_output_module | [string](#string) |  |  |






<a name="devicemetadata-WearableDevice"></a>

### WearableDevice



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| device_manufacturer | [string](#string) |  |  |
| device_serial_number | [string](#string) |  |  |
| udi_device_name | [string](#string) |  |  |
| software_version | [int32](#int32) |  |  |
| timestamp | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| has_heart_rate_sensor | [bool](#bool) |  |  |
| has_accelerometer | [bool](#bool) |  |  |
| has_gyroscope | [bool](#bool) |  |  |
| has_barometric | [bool](#bool) |  |  |
| has_microphone | [bool](#bool) |  |  |
| has_magnetometer | [bool](#bool) |  |  |
| has_temperature_sensor | [bool](#bool) |  |  |
| has_gps | [bool](#bool) |  |  |






<a name="devicemetadata-WearableDeviceEncrypted"></a>

### WearableDeviceEncrypted



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| device_manufacturer | [string](#string) |  |  |
| device_serial_number | [string](#string) |  |  |
| udi_device_name | [string](#string) |  |  |
| software_version | [string](#string) |  |  |
| timestamp | [string](#string) |  |  |
| has_heart_rate_sensor | [string](#string) |  |  |
| has_accelerometer | [string](#string) |  |  |
| has_gyroscope | [string](#string) |  |  |
| has_barometric | [string](#string) |  |  |
| has_microphone | [string](#string) |  |  |
| has_magnetometer | [string](#string) |  |  |
| has_temperature_sensor | [string](#string) |  |  |
| has_gps | [string](#string) |  |  |





 

 

 

 



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

