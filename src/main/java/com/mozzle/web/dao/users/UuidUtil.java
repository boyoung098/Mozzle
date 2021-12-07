package com.mozzle.web.dao.users;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.UUID;

import com.fasterxml.uuid.Generators;
import com.fasterxml.uuid.NoArgGenerator;

public class UuidUtil {

    static final NoArgGenerator timeBasedGenerator = Generators.timeBasedGenerator();


    /**
     * From UUID javadocs the resulting timestamp is measured in 100-nanosecond units since midnight, October 15, 1582 UTC
     * timestamp() from UUID is measured in 100-nanosecond units since midnight, October 15, 1582 UTC
     *
     * The Java timestamp in milliseconds since 1970-01-01 as baseline
     *
     * @return
     */
    static long getStartOfUuidRelativeToUnixEpochInMilliseconds () {
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("GMT-0"));
        c.set(Calendar.YEAR, 1582);
        c.set(Calendar.MONTH, Calendar.OCTOBER);
        c.set(Calendar.DAY_OF_MONTH, 15);
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.SECOND, 0);
        c.set(Calendar.MILLISECOND, 0);

        return c.getTimeInMillis();
    }

    //https://www.wolframalpha.com/input/?i=convert+1582-10-15+UTC+to+unix+time
    final static long START_OF_UUID_RELATIVE_TO_UNIX_EPOCH_SECONDS = -12219292800L;
    final static long START_OF_UUID_RELATIVE_TO_UNIX_EPOCH_MILLIS = -12219292800L * 1000L;

    /**
     * timestamp() from UUID is measured in 100-nanosecond units since midnight, October 15, 1582 UTC,
     * so we must convert for 100ns units to millisecond procession
     * @param tuid
     * @return
     */
     static long getMillisecondsFromUuid (UUID tuid) {

        assert tuid.version() == 1;      //ensure its a time based UUID

        // timestamp returns in 10^-7 (100 nano second chunks), 
        // java Date constructor  assumes 10^-3 (millisecond precision)
        // so we have to divide by 10^4 (10,000) to get millisecond precision  
        long milliseconds_since_UUID_baseline = tuid.timestamp() /10000L;
        return milliseconds_since_UUID_baseline;

    }

    public static Date getDateFromUuid (UUID tuid) {
        // Allocates a Date object and initializes it to represent the specified number of milliseconds since the 
        // standard java (unix) base time known as "the epoch", namely January 1, 1970, 00:00:00 GMT
        // have to add relative offset from UUID start date of unix epoch to get start date in unix time milliseconds 
       return new Date (getMillisecondsFromUuid (tuid) + START_OF_UUID_RELATIVE_TO_UNIX_EPOCH_MILLIS );
    }

    public static UUID getTimeBasedUuid () {
        UUID tuid = timeBasedGenerator.generate();
        return tuid;
    }

}