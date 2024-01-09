// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title DateTimeLib
 * @dev Library for handling date and time conversions and calculations.
 */
library DateTimeLib {
    uint256 constant SECONDS_PER_DAY = 24 * 60 * 60;
    uint256 constant SECONDS_PER_HOUR = 60 * 60;
    uint256 constant SECONDS_PER_MINUTE = 60;
    int256 constant OFFSET19700101 = 2_440_588;

    // ------------------------------------------------------------------------
    // Calculate the number of days from 1970/01/01 to year/month/day using
    // the date conversion algorithm from
    //   https://aa.usno.navy.mil/faq/JD_formula.html
    // and subtracting the offset 2440588 so that 1970/01/01 is day 0
    //
    // days = day
    //      - 32075
    //      + 1461 * (year + 4800 + (month - 14) / 12) / 4
    //      + 367 * (month - 2 - (month - 14) / 12 * 12) / 12
    //      - 3 * ((year + 4900 + (month - 14) / 12) / 100) / 4
    //      - offset
    // ------------------------------------------------------------------------
    /**
     * @dev Calculate the number of days from 1970/01/01 to a given date.
     * @param year The year of the date.
     * @param month The month of the date.
     * @param day The day of the date.
     * @return _days The number of days.
     */
    function _daysFromDate(
        uint256 year,
        uint256 month,
        uint256 day
    )
        internal
        pure
        returns (uint256 _days)
    {
        require(year >= 1970);
        int256 _year = int256(year);
        int256 _month = int256(month);
        int256 _day = int256(day);

        int256 __days = _day - 32_075
            + (1461 * (_year + 4800 + (_month - 14) / 12)) / 4
            + (367 * (_month - 2 - ((_month - 14) / 12) * 12)) / 12
            - (3 * ((_year + 4900 + (_month - 14) / 12) / 100)) / 4 - OFFSET19700101;

        _days = uint256(__days);
    }

    // ------------------------------------------------------------------------
    // Calculate year/month/day from the number of days since 1970/01/01 using
    // the date conversion algorithm from
    //   http://aa.usno.navy.mil/faq/docs/JD_Formula.php
    // and adding the offset 2440588 so that 1970/01/01 is day 0
    //
    // int L = days + 68569 + offset
    // int N = 4 * L / 146097
    // L = L - (146097 * N + 3) / 4
    // year = 4000 * (L + 1) / 1461001
    // L = L - 1461 * year / 4 + 31
    // month = 80 * L / 2447
    // dd = L - 2447 * month / 80
    // L = month / 11
    // month = month + 2 - 12 * L
    // year = 100 * (N - 49) + year + L
    // ------------------------------------------------------------------------
    /**
     * @dev Calculate year, month, and day from the number of days since
     * 1970/01/01.
     * @param _days The number of days.
     * @return year month day.
     */
    function _daysToDate(uint256 _days)
        internal
        pure
        returns (uint256 year, uint256 month, uint256 day)
    {
        int256 __days = int256(_days);

        int256 L = __days + 68_569 + OFFSET19700101;
        int256 N = (4 * L) / 146_097;
        L = L - (146_097 * N + 3) / 4;
        int256 _year = (4000 * (L + 1)) / 1_461_001;
        L = L - (1461 * _year) / 4 + 31;
        int256 _month = (80 * L) / 2447;
        int256 _day = L - (2447 * _month) / 80;
        L = _month / 11;
        _month = _month + 2 - 12 * L;
        _year = 100 * (N - 49) + _year + L;

        year = uint256(_year);
        month = uint256(_month);
        day = uint256(_day);
    }

    /**
     * @dev Convert date to timestamp.
     * @param year The year of the date.
     * @param month The month of the date.
     * @param day The day of the date.
     * @return timestamp The timestamp.
     */
    function timestampFromDate(
        uint256 year,
        uint256 month,
        uint256 day
    )
        internal
        pure
        returns (uint256 timestamp)
    {
        timestamp = _daysFromDate(year, month, day) * SECONDS_PER_DAY;
    }

    /**
     * @dev Convert date and time to timestamp.
     * @param year The year of the date.
     * @param month The month of the date.
     * @param day The day of the date.
     * @param hour The hour of the time.
     * @param minute The minute of the time.
     * @param second The second of the time.
     * @return timestamp The timestamp.
     */
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
        returns (uint256 timestamp)
    {
        timestamp = _daysFromDate(year, month, day) * SECONDS_PER_DAY
            + hour * SECONDS_PER_HOUR + minute * SECONDS_PER_MINUTE + second;
    }

    /**
     * @dev Convert timestamp to date.
     * @param timestamp The timestamp.
     * @return year month day.
     */
    function timestampToDate(uint256 timestamp)
        internal
        pure
        returns (uint256 year, uint256 month, uint256 day)
    {
        (year, month, day) = _daysToDate(timestamp / SECONDS_PER_DAY);
    }

    /**
     * @dev Convert timestamp to date and time.
     * @param timestamp The timestamp.
     * @return year month day hour minute second.
     */
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
        )
    {
        (year, month, day) = _daysToDate(timestamp / SECONDS_PER_DAY);
        uint256 secs = timestamp % SECONDS_PER_DAY;
        hour = secs / SECONDS_PER_HOUR;
        secs = secs % SECONDS_PER_HOUR;
        minute = secs / SECONDS_PER_MINUTE;
        second = secs % SECONDS_PER_MINUTE;
    }

    /**
     * @dev Add a specific number of days to a given timestamp.
     * @param timestamp The original timestamp.
     * @param _days The number of days to add.
     * @return newTimestamp The new timestamp after adding the specified days.
     */
    function addDays(
        uint256 timestamp,
        uint256 _days
    )
        internal
        pure
        returns (uint256 newTimestamp)
    {
        newTimestamp = timestamp + _days * SECONDS_PER_DAY;
        require(newTimestamp >= timestamp);
    }

    /**
     * @dev Add a specific number of hours to a given timestamp.
     * @param timestamp The original timestamp.
     * @param _hours The number of hours to add.
     * @return newTimestamp The new timestamp after adding the specified hours.
     */
    function addHours(
        uint256 timestamp,
        uint256 _hours
    )
        internal
        pure
        returns (uint256 newTimestamp)
    {
        newTimestamp = timestamp + _hours * SECONDS_PER_HOUR;
        require(newTimestamp >= timestamp);
    }

    /**
     * @dev Add a specific number of minutes to a given timestamp.
     * @param timestamp The original timestamp.
     * @param _minutes The number of minutes to add.
     * @return newTimestamp The new timestamp after adding the specified
     * minutes.
     */
    function addMinutes(
        uint256 timestamp,
        uint256 _minutes
    )
        internal
        pure
        returns (uint256 newTimestamp)
    {
        newTimestamp = timestamp + _minutes * SECONDS_PER_MINUTE;
        require(newTimestamp >= timestamp);
    }

    /**
     * @dev Add a specific number of seconds to a given timestamp.
     * @param timestamp The original timestamp.
     * @param _seconds The number of seconds to add.
     * @return newTimestamp The new timestamp after adding the specified
     * seconds.
     */
    function addSeconds(
        uint256 timestamp,
        uint256 _seconds
    )
        internal
        pure
        returns (uint256 newTimestamp)
    {
        newTimestamp = timestamp + _seconds;
        require(newTimestamp >= timestamp);
    }

    /**
     * @dev Calculate the difference in months between two timestamps.
     * @param fromTimestamp The starting timestamp.
     * @param toTimestamp The ending timestamp.
     * @return _months The difference in months.
     */
    function diffMonths(
        uint256 fromTimestamp,
        uint256 toTimestamp
    )
        internal
        pure
        returns (uint256 _months)
    {
        require(fromTimestamp <= toTimestamp);
        (uint256 fromYear, uint256 fromMonth,) =
            _daysToDate(fromTimestamp / SECONDS_PER_DAY);
        (uint256 toYear, uint256 toMonth,) =
            _daysToDate(toTimestamp / SECONDS_PER_DAY);
        _months = toYear * 12 + toMonth - fromYear * 12 - fromMonth;
    }

    /**
     * @dev Calculate the difference in days between two timestamps.
     * @param fromTimestamp The starting timestamp.
     * @param toTimestamp The ending timestamp.
     * @return _days The difference in days.
     */
    function diffDays(
        uint256 fromTimestamp,
        uint256 toTimestamp
    )
        internal
        pure
        returns (uint256 _days)
    {
        require(fromTimestamp <= toTimestamp);
        _days = (toTimestamp - fromTimestamp) / SECONDS_PER_DAY;
    }

    /**
     * @dev Calculate the difference in hours between two timestamps.
     * @param fromTimestamp The starting timestamp.
     * @param toTimestamp The ending timestamp.
     * @return _hours The difference in hours.
     */
    function diffHours(
        uint256 fromTimestamp,
        uint256 toTimestamp
    )
        internal
        pure
        returns (uint256 _hours)
    {
        require(fromTimestamp <= toTimestamp);
        _hours = (toTimestamp - fromTimestamp) / SECONDS_PER_HOUR;
    }

    /**
     * @dev Calculate the difference in minutes between two timestamps.
     * @param fromTimestamp The starting timestamp.
     * @param toTimestamp The ending timestamp.
     * @return _minutes The difference in minutes.
     */
    function diffMinutes(
        uint256 fromTimestamp,
        uint256 toTimestamp
    )
        internal
        pure
        returns (uint256 _minutes)
    {
        require(fromTimestamp <= toTimestamp);
        _minutes = (toTimestamp - fromTimestamp) / SECONDS_PER_MINUTE;
    }

    /**
     * @dev Calculate the difference in seconds between two timestamps.
     * @param fromTimestamp The starting timestamp.
     * @param toTimestamp The ending timestamp.
     * @return _seconds The difference in seconds.
     */
    function diffSeconds(
        uint256 fromTimestamp,
        uint256 toTimestamp
    )
        internal
        pure
        returns (uint256 _seconds)
    {
        require(fromTimestamp <= toTimestamp);
        _seconds = toTimestamp - fromTimestamp;
    }
}
