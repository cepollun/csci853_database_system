SPOOL D:\solution1
SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 100
SET PAGESIZE 200
SET SERVEROUTPUT ON
create or replace FUNCTION TRIPTOBSON (TRIPNUM IN NUMBER ) 
RETURN VARCHAR2 
AS 
  BSONINFO VARCHAR2(32766) ;

  C_LEGNUM	TRIPLEG.LEG#%type;
  C_DEPART	TRIPLEG.DEPARTURE%type;
  C_DEST	TRIPLEG.DESTINATION%type;
  CURSOR c_tripleg is 
      SELECT LEG#, DEPARTURE, DESTINATION FROM TRIPLEG WHERE T# = TRIPNUM; 
--  
  C_LNUM TRIP.L#%type;
  C_REGNUM TRIP.REG#%type;
  C_TRIPDATE TRIP.TRIP_DATE%type;
  CURSOR c_trip is 
      SELECT L#, REG#, TRIP_DATE FROM TRIP WHERE T# = TRIPNUM; 
--    
  hexval NUMBER;
  systemtime VARCHAR2(32766);
BEGIN  
-- Gen _id value
     select to_number('19f','xxx')into hexval from dual; 
     DBMS_OUTPUT.put_line(hexval);
--     select to_timestamp(to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') into systemtime from dual;
     select cast(to_date(sysdate,'yyyy-mm-dd,hh24:mi:ss') as timestamp) date_to_timestamp into systemtime from dual; 
     DBMS_OUTPUT.put_line(systemtime);
     DBMS_OUTPUT.put_line(SYSTIMESTAMP());
-- Gen the rest of items of BSON doucument
   OPEN c_trip; 
   FETCH c_trip into C_LNUM, C_REGNUM, C_TRIPDATE;
   IF c_trip%notfound THEN
        DBMS_OUTPUT.put_line('There is no data found at first.');
        BSONINFO := '{'|| chr(10)||'}';
   ELSIF c_trip%found THEN
        DBMS_OUTPUT.put_line('THERE IS data in the following at first.');
        BSONINFO := '{"TRIPANDTRIPLEG":{"tripnum":' ||' " ' ||TRIPNUM || ' " ' || ','|| chr(10);
           WHILE  c_trip%found LOOP
--           DBMS_OUTPUT.put_line('There is  data in the following.');
           FETCH c_trip into C_LNUM, C_REGNUM, C_TRIPDATE;
              BSONINFO :=  BSONINFO ||'"lnum":'||'"'||C_LNUM||'"'||','|| chr(10)
                                    ||'"regnum":'||'"'||C_REGNUM||'"'||','|| chr(10)
                                    ||'"tripdate":'||'"'||C_TRIPDATE||'"'||','|| chr(10)
                                    ||'"tripleg":[';
           END LOOP; 
           CLOSE c_trip; 
        --   
           OPEN c_tripleg; 
           LOOP 
           FETCH c_tripleg into C_LEGNUM, C_DEPART, C_DEST; 
              EXIT WHEN c_tripleg%notfound; 
              BSONINFO :=  BSONINFO ||'{'
                                    ||'"legnum":"'||C_LEGNUM||'"'||','|| chr(10)
                                    ||'"departure":"'||C_DEPART||'"'||','|| chr(10)
                                    ||'"destination":"'||C_DEST||'"'||'},' || chr(10);
         
           END LOOP; 
           -- 
            SELECT SUBSTR(BSONINFO , 1, INSTR(BSONINFO , ',', -1)-1)
            INTO BSONINFO 
            FROM dual;
           BSONINFO :=  BSONINFO ||']' || chr(10)
                                 ||'}' ;
           CLOSE c_tripleg; 
        
        -- 
           BSONINFO :=  BSONINFO ||chr(10)
                                 ||'}' ;
  END IF;
  RETURN BSONINFO;
END TRIPTOBSON;
/
 
EXECUTE DBMS_OUTPUT.put_line(TRIPTOBSON(101));
EXECUTE DBMS_OUTPUT.put_line(TRIPTOBSON(1));
EXECUTE DBMS_OUTPUT.put_line(TRIPTOBSON(109));
SPOOL OFF