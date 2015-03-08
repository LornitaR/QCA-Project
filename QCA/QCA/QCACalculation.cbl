IDENTIFICATION DIVISION.
PROGRAM-ID. QCACalculation.
AUTHOR. Lorna Ryan.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
SELECT StudentFile ASSIGN TO "qca.dat"
    ORGANIZATION IS LINE SEQUENTIAL.
SELECT WorkFile ASSIGN TO "WorkFile.tmp".

SELECT ReportFile ASSIGN TO "10100814.htm".

DATA DIVISION.
FILE SECTION.
FD StudentFile.
01 StudentRec.
    88 EndOfFile        VALUE HIGH-VALUES.
    02 Semester         PIC 9.
    02 ModuleCode       PIC X(6).
    02 ModuleName       PIC X(28).
    02 Grade            PIC XX.
    02 Credits          PIC 9.
    02 AccHours         PIC 99.
    02 NonQHours        PIC 99.
    02 Factor           PIC 9.
    
SD WorkFile.
01 WorkFileRec.
    02 WkSemester         PIC 9.
    02 WkModuleCode       PIC X(6).
    02 WkModuleName       PIC X(28).
    02 WkGrade            PIC XX.
    02 WkCredits          PIC 9.
    02 WkAccHours         PIC 99.
    02 WkNonQHours        PIC 99.
    02 WkFactor           PIC 9.

FD ReportFile.
01 ReportBody             PIC X(500).
    
WORKING-STORAGE SECTION.

PROCEDURE DIVISION.
Begin.
    OPEN INPUT StudentFile
    READ StudentFile
        AT END SET EndOfFile TO TRUE
    END-READ
	PERFORM UNTIL EndOfFile
        UNSTRING StudentRec  DELIMITED BY "," 
            INTO WkSemester, WkModuleCode, WkModuleName, WkGrade, WkCredits, WkAccHours, WkNonQHours, WkFactor
            RELEASE WorkFileRec
            READ StudentFIle
                AT END SET EndOfFile TO TRUE
            END-READ
    END-PERFORM.
        
    
    OPEN OUTPUT ReportFile
    
    CLOSE StudentFile, ReportFile
    
    

    
