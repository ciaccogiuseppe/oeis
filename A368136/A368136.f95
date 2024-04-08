PROGRAM Main
  INTEGER*8 KMIN, KMAX, N, K, RESULT, Collatz
  PARAMETER (KMIN=3_8, KMAX=3000_8)

!      RESULT = Collatz(7_16, 3_16)
!      PRINT *, "The value of result is", RESULT
!      RESULT = Collatz(7_16, 2_16)
!      PRINT *, "The value of result is", RESULT
  DO K = KMIN, KMAX - 1
!     PRINT *, "............................................", K
     DO N = K, K * K - 1
        RESULT = Collatz(N, K)
        IF (RESULT .NE. 0_8) THEN
!           WRITE (*,*) K
           PRINT *, "Loop at", K
           EXIT
        ENDIF
     ENDDO
  ENDDO

END

INTEGER*8 FUNCTION Collatz(N_, K)
  INTEGER*8 N_, K, S, M, N
  INTEGER*8 MAX

  EXTERNAL MAX
  N = N_
  M = N
  S = 0

! Generalized Collatz Sequence
10    IF (N .EQ. 1_8 .OR. S .GT. M) GOTO 20
  IF (MOD(N, K) .EQ. 0_8) THEN
     N = N / K
  ELSE
     N = N + N / K + 1_8
  ENDIF
!      PRINT *, "The current number is", N
  S = S + 1
  M = MAX(M, N)
  GOTO 10

! Case 1: Trivial loop
20    IF (N .EQ. 1_8) THEN
     Collatz = 0_8
     RETURN
  ENDIF

! Case 2: Non-trivial loop
! If the maximum number reached after S steps is lower than S, there are two possible cases
! 1 - The sequence is in the trivial loop containing 1 (Case 1)
! 2 - The sequence is following a different loop
! This is because if the maximum is lower than S, then at least one number has been repeated in the sequence
  IF (S .GT. M) THEN
     Collatz = 1_8
     RETURN
  ENDIF

END

INTEGER*8 FUNCTION MAX(M, N)
  INTEGER*8 M, N
  IF (M .GT. N) THEN
     MAX = M
  ELSE
     MAX = N
  ENDIF
  RETURN
END
