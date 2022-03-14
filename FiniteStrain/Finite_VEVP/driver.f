      PROGRAM MAIN
      IMPLICIT NONE

      INTEGER, PARAMETER :: double=kind(1.d0)
      INTEGER, PARAMETER :: prec=double
      
      INTEGER    :: KINC, KSTEP
      REAL(prec) :: STRESS(6),STATEV(38)
      REAL(prec) :: DDSDDE(6,6),DDSDDT(6),DRPLDE(6)
      REAL(prec) :: STRAN(6),DSTRAN(6),TIME(2),PREDEF(1),DPRED(1)
      REAL(prec) :: PROPS(23),DFGRD0(3,3),DFGRD1(3,3),DTIME(1),NTENS(1)
      REAL(prec) :: NSTATV(1), NPROPS(1), NOEL(1)

      STRESS(:) = 0.D0
      STATEV(:) = 0.D0
      DDSDDE(:, :) = 0.D0
      DDSDDT(:) = 0.D0
      DRPLDE(:) = 0.D0
      STRAN(:) = 0.D0
      DSTRAN(:) = 0.D0
      TIME(:) = 0.D0
      PREDEF(:) = 0.D0
      DPRED(:) = 0.D0
      NTENS = 0.D0
      NSTATV = 0.D0
      NPROPS = 0.D0
      KINC = 1
      KSTEP = 1
      NOEL = 0.D0


      DTIME = 0.02D0


      data PROPS/8000.D0, 0.D0, 2.5D0, 8000.D0,
     1  0.D0, 2.5D0, 11.D0, 0.0D0, 1.D0,
     2  0.5D0, 0.D0, 0.D0, 100.D0, 300.D0, 0.D0, 0.D0,
     3  0.D0, 3000.D0, 0.D0, 78.D0, 300.D0, 0.D0, 0.D0/

      data DFGRD0(:,1) /1.0759999999999998D0,0.D0,
     1       6.9388939039072284D-18/
      data DFGRD0(:,2) /2.1510571102112408D-16,0.96685831802321198D0,
     1 -2.8622937353617317D-17/
      data DFGRD0(:,3) /1.0035375308525829D-15,
     1 -7.2858385991025898D-17,0.96685831802321154D0/

      data DFGRD1(:,1) /1.075D0,0.D0,1.7347234759768071D-18/
      data DFGRD1(:,2) /1.9428902930940239D-16,0.96724122584119687D0,
     1  -1.1535911115245767D-16/
      data DFGRD1(:,3) /1.2238474123016374D-15,3.5388358909926865D-16,
     1       0.96724122584119754D0/

      KINC = 2
      KSTEP = 2

      STATEV(1) = 1.0676486171328399D0
      STATEV(2) = 0.96780047084391174D0
      STATEV(3) = 0.96780047084391174D0
      STATEV(4) = -5.8751214614444263D-18
      STATEV(5) = 1.3629331520213273D-16
      STATEV(6) = 3.1636637833403109D-17
      STATEV(7) = -1.0657771041167809D-17
      STATEV(8) =  1.2953313804960189D-16
      STATEV(9) =  3.1636637833403171D-17

      STATEV(10) = -0.00012555113484529089D0

      STATEV(11) = -0.00012515028817406573D0
      STATEV(12) = 6.257514439378734D-05
      STATEV(13) = 6.257514378027492D-05
      STATEV(14) = 2.1467886182123368D-14
      STATEV(15) = 1.8622355418302496D-13
      STATEV(16) = 5.359335866149297D-14
      STATEV(17) = 2.1467886182123362D-14
      STATEV(18) = 1.8622355418302499D-13
      STATEV(19) = 5.359335866149298D-14

      STATEV(20) =  0.007791785512555328D0
      STATEV(21) = -0.0009739731890715065D0
      STATEV(22) = -0.000973973189071729D0
      STATEV(23) = -8.343592639789287D-18
      STATEV(24) = -5.04064534811319D-18
      STATEV(25) = -5.691072362630262D-17
      STATEV(26) = -8.343592639789288D-18
      STATEV(27) = -5.040645348113191D-18
      STATEV(28) = -5.691072362630262D-17

      STATEV(29) = 160.34035599429185D0
      STATEV(30) = -80.17017799714479D0
      STATEV(31) = -80.170177997147D0
      STATEV(32) = -1.9975986981846377D-14
      STATEV(33) = 3.2019216319922587D-13
      STATEV(34) = 8.007189725945639D-14
      STATEV(35) = -1.997598698184637D-14
      STATEV(36) = 3.2019216319922587D-13
      STATEV(37) = 8.007189725945646D-14

      STATEV(38) = 0.08585533116956541D0


      
      call VEVP(STRESS,STATEV,DDSDDE,STRAN,NTENS,NSTATV,PROPS,
     &         NPROPS,DTIME,DSTRAN,KINC,KSTEP,NOEL,DFGRD0,DFGRD1)

      END PROGRAM MAIN