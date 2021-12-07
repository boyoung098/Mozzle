package com.mozzle.web.ctrl.users;



import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import com.fasterxml.uuid.Generators;
import com.mozzle.web.dao.users.UuidUtil;


public class GuestController {

	private static long get64LeastSignificantBitsForVersion1() {
	    Random random = new Random();
	    long random63BitLong = random.nextLong() & 0x3FFFFFFFFFFFFFFFL;
	    long variant3BitFlag = 0x8000000000000000L;
	    return random63BitLong + variant3BitFlag;
	}
	
	private static long get64MostSignificantBitsForVersion1() {
	    LocalDateTime start = LocalDateTime.of(1582, 10, 15, 0, 0, 0);
	    Duration duration = Duration.between(start, LocalDateTime.now());
	    long seconds = duration.getSeconds();
	    long nanos = duration.getNano();
	    long timeForUuidIn100Nanos = seconds * 10000000 + nanos * 100;
	    long least12SignificatBitOfTime = (timeForUuidIn100Nanos & 0x000000000000FFFFL) >> 4;
	    long version = 1 << 12;
	    return 
	      (timeForUuidIn100Nanos & 0xFFFFFFFFFFFF0000L) + version + least12SignificatBitOfTime;
	}
	
	public static UUID generateType1UUID() {

	    long most64SigBits = get64MostSignificantBitsForVersion1();
	    long least64SigBits = get64LeastSignificantBitsForVersion1();

	    return new UUID(most64SigBits, least64SigBits);
	}
	
	public static void main(String[] args) {
		//String uuid = UUID.randomUUID().toString();
		
		//System.out.println(uuid);
		//789f5eea-dcdb-4956-90ce-1b5317b8d27b
		
		//시간기반
		//UUID uuid = Generators.timeBasedGenerator().generate();
		//System.out.println(uuid.toString());
		//7df9dcd5-5697-11ec-8672-85a69b93fd65
		//843048e3-5697-11ec-89eb-ed46ff8eebc2
		//33bb7c37-569a-11ec-b70d-2f2c2cf04c89
		
		//UUID uuidtime = generateType1UUID();
		//System.out.println(uuidtime.toString());
		
		//01ec56ed-c4eb-15e0-9978-7b275d1b7251
		//01ec56ee-35a3-11c5-9ff5-d3bab6144fdb
		//01ec56e6-abc0-1833-b9dc-5d74ac9e0caa
		
		
//		시간이 안맞아
//		UUID tuid = generateType1UUID();
//		System.out.println(tuid);
//		Long t = tuid.timestamp();
//		System.out.println(t);
//		Timestamp timestamp = new Timestamp (t);
//		System.out.println(timestamp.toGMTString());
//		Date dateTime = new Date (timestamp.getTime());
//		System.out.println(dateTime.toLocaleString());
//		System.out.println(dateTime.toGMTString());
		
		UUID tuid = UuidUtil.getTimeBasedUuid();
		System.out.println(tuid.toString());

		Date date = (Date) UuidUtil.getDateFromUuid(tuid);
		System.out.println(date.toLocaleString());
		
	}
}
