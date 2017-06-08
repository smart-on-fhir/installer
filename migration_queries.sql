mysqldump -u fhir -p hspc_4_smartdstu2 --hex-blob | bzip2 > hspc_4_smartdstu2.sql.bz2
mysqldump -u fhir -p hspc_4_smartdstu2$default --hex-blob | bzip2 > hspc_4_smartdstu2_snap.sql.bz2

mysqldump -u fhir -p hspc_4_smartstu3 --hex-blob | bzip2 > hspc_4_smartstu3.sql.bz2
mysqldump -u fhir -p hspc_4_smartstu3$default --hex-blob | bzip2 > hspc_4_smartstu3_snap.sql.bz2

mysqldump -u fhir -p hspc_4_smartstu3$May17promsAndSmart --hex-blob | bzip2 > hspc_4_smartstu3$May17promsAndSmart.sql.bz2
mysqldump -u fhir -p hspc_4_smartstu3$May2017 --hex-blob | bzip2 > hspc_4_smartstu3_May2017.sql.bz2

mysqldump -u fhir -p oic --hex-blob | bzip2 > oic.sql.bz2
mysqldump -u fhir -p pwm --hex-blob | bzip2 > pwm.sql.bz2
mysqldump -u fhir -p sandman --hex-blob | bzip2 > sandman.sql.bz2

bunzip2 < hspc_4_smartdstu2.sql.bz2 | mysql hspc_4_smartdstu2 -u fhir -p
bunzip2 < hspc_4_smartdstu2_snap.sql.bz2 | mysql hspc_4_smartdstu2$default -u fhir -p

bunzip2 < hspc_4_smartstu3.sql.bz2 | mysql hspc_4_smartstu3 -u fhir -p
bunzip2 < hspc_4_smartstu3_snap.sql.bz2 | mysql hspc_4_smartstu3$default -u fhir -p3martPlat4m


bunzip2 < hspc_4_smartstu3$May17promsAndSmart.sql.bz2 | mysql hspc_4_smartstu3$May17promsAndSmart -u fhir -p3martPlat4m
bunzip2 < hspc_4_smartstu3_May2017.sql.bz2 | mysql hspc_4_smartstu3$May2017 -u fhir -p3martPlat4m

bunzip2 < oic.sql.bz2 | mysql oic -u fhir -p3martPlat4m
bunzip2 < pwm.sql.bz2 | mysql pwm -u fhir -p3martPlat4m
bunzip2 < sandman.sql.bz2 | mysql sandman -u fhir -p3martPlat4m