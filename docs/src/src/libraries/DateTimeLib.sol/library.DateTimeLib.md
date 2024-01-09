# DateTimeLib
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/libraries/DateTimeLib.sol)

*Library for handling date and time conversions and calculations.*


## State Variables
### SECONDS_PER_DAY

```solidity
uint256 constant SECONDS_PER_DAY = 24 * 60 * 60;
```


### SECONDS_PER_HOUR

```solidity
uint256 constant SECONDS_PER_HOUR = 60 * 60;
```


### SECONDS_PER_MINUTE

```solidity
uint256 constant SECONDS_PER_MINUTE = 60;
```


### OFFSET19700101

```solidity
int256 constant OFFSET19700101 = 2_440_588;
```


## Functions
### _daysFromDate

*Calculate the number of days from 1970/01/01 to a given date.*


```solidity
function _daysFromDate(
    uint256 year,
    uint256 month,
    uint256 day
)
    internal
    pure
    returns (uint256 _days);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`year`|`uint256`|The year of the date.|
|`month`|`uint256`|The month of the date.|
|`day`|`uint256`|The day of the date.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`_days`|`uint256`|The number of days.|


### _daysToDate

*Calculate year, month, and day from the number of days since
1970/01/01.*


```solidity
function _daysToDate(uint256 _days)
    internal
    pure
    returns (uint256 year, uint256 month, uint256 day);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_days`|`uint256`|The number of days.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`year`|`uint256`|month day.|
|`month`|`uint256`||
|`day`|`uint256`||


### timestampFromDate

*Convert date to timestamp.*


```solidity
function timestampFromDate(
    uint256 year,
    uint256 month,
    uint256 day
)
    internal
    pure
    returns (uint256 timestamp);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`year`|`uint256`|The year of the date.|
|`month`|`uint256`|The month of the date.|
|`day`|`uint256`|The day of the date.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint256`|The timestamp.|


### timestampFromDateTime

*Convert date and time to timestamp.*


```solidity
function timestampFromDateTime(
    uint256 year,
    uint256 month,
    uint256 day,
    uint256 hour,
    uint256 minute,
    uint256 second
)
    internal
    pure
    returns (uint256 timestamp);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`year`|`uint256`|The year of the date.|
|`month`|`uint256`|The month of the date.|
|`day`|`uint256`|The day of the date.|
|`hour`|`uint256`|The hour of the time.|
|`minute`|`uint256`|The minute of the time.|
|`second`|`uint256`|The second of the time.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint256`|The timestamp.|


### timestampToDate

*Convert timestamp to date.*


```solidity
function timestampToDate(uint256 timestamp)
    internal
    pure
    returns (uint256 year, uint256 month, uint256 day);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint256`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`year`|`uint256`|month day.|
|`month`|`uint256`||
|`day`|`uint256`||


### timestampToDateTime

*Convert timestamp to date and time.*


```solidity
function timestampToDateTime(uint256 timestamp)
    internal
    pure
    returns (
        uint256 year,
        uint256 month,
        uint256 day,
        uint256 hour,
        uint256 minute,
        uint256 second
    );
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint256`|The timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`year`|`uint256`|month day hour minute second.|
|`month`|`uint256`||
|`day`|`uint256`||
|`hour`|`uint256`||
|`minute`|`uint256`||
|`second`|`uint256`||


### addDays

*Add a specific number of days to a given timestamp.*


```solidity
function addDays(
    uint256 timestamp,
    uint256 _days
)
    internal
    pure
    returns (uint256 newTimestamp);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint256`|The original timestamp.|
|`_days`|`uint256`|The number of days to add.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`newTimestamp`|`uint256`|The new timestamp after adding the specified days.|


### addHours

*Add a specific number of hours to a given timestamp.*


```solidity
function addHours(
    uint256 timestamp,
    uint256 _hours
)
    internal
    pure
    returns (uint256 newTimestamp);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint256`|The original timestamp.|
|`_hours`|`uint256`|The number of hours to add.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`newTimestamp`|`uint256`|The new timestamp after adding the specified hours.|


### addMinutes

*Add a specific number of minutes to a given timestamp.*


```solidity
function addMinutes(
    uint256 timestamp,
    uint256 _minutes
)
    internal
    pure
    returns (uint256 newTimestamp);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint256`|The original timestamp.|
|`_minutes`|`uint256`|The number of minutes to add.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`newTimestamp`|`uint256`|The new timestamp after adding the specified minutes.|


### addSeconds

*Add a specific number of seconds to a given timestamp.*


```solidity
function addSeconds(
    uint256 timestamp,
    uint256 _seconds
)
    internal
    pure
    returns (uint256 newTimestamp);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`timestamp`|`uint256`|The original timestamp.|
|`_seconds`|`uint256`|The number of seconds to add.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`newTimestamp`|`uint256`|The new timestamp after adding the specified seconds.|


### diffMonths

*Calculate the difference in months between two timestamps.*


```solidity
function diffMonths(
    uint256 fromTimestamp,
    uint256 toTimestamp
)
    internal
    pure
    returns (uint256 _months);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`fromTimestamp`|`uint256`|The starting timestamp.|
|`toTimestamp`|`uint256`|The ending timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`_months`|`uint256`|The difference in months.|


### diffDays

*Calculate the difference in days between two timestamps.*


```solidity
function diffDays(
    uint256 fromTimestamp,
    uint256 toTimestamp
)
    internal
    pure
    returns (uint256 _days);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`fromTimestamp`|`uint256`|The starting timestamp.|
|`toTimestamp`|`uint256`|The ending timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`_days`|`uint256`|The difference in days.|


### diffHours

*Calculate the difference in hours between two timestamps.*


```solidity
function diffHours(
    uint256 fromTimestamp,
    uint256 toTimestamp
)
    internal
    pure
    returns (uint256 _hours);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`fromTimestamp`|`uint256`|The starting timestamp.|
|`toTimestamp`|`uint256`|The ending timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`_hours`|`uint256`|The difference in hours.|


### diffMinutes

*Calculate the difference in minutes between two timestamps.*


```solidity
function diffMinutes(
    uint256 fromTimestamp,
    uint256 toTimestamp
)
    internal
    pure
    returns (uint256 _minutes);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`fromTimestamp`|`uint256`|The starting timestamp.|
|`toTimestamp`|`uint256`|The ending timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`_minutes`|`uint256`|The difference in minutes.|


### diffSeconds

*Calculate the difference in seconds between two timestamps.*


```solidity
function diffSeconds(
    uint256 fromTimestamp,
    uint256 toTimestamp
)
    internal
    pure
    returns (uint256 _seconds);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`fromTimestamp`|`uint256`|The starting timestamp.|
|`toTimestamp`|`uint256`|The ending timestamp.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`_seconds`|`uint256`|The difference in seconds.|


