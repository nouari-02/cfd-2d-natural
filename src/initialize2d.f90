! initialize2d Subroutine for 2D CFD Problems
!
! Written by Matt Blomquist
! Last Update: 2018-04-03 (YYYY-MM-DD)
!

subroutine initialize2d

  ! Pull in standard variable header
  include "var2d.dec"

  ! Read Input File ..........
  ! ..........................
  ! ..........................

  ! Define geometry variables
  length = 1	! 1 meter long
  width = 1     ! 1 meter wide
  depth = 1     ! 1 meter deep

  ! Define media variables
  Re = 2.801e2
  Pr = 5.821e0
  Ra = 3.448e3

  rho = 9.970e2
  mu = 8.900e-4
  k_const = 6.400e-1
  Cp = 4.186e3

  alpha = k_const/Cp/rho
  beta = 6.9e-5

  ! Define high and low temperature
  T_h = 343     ! High temperature wall
  T_c = 293     ! Low temperature wall
  delta_T = T_h - T_c

  ! Define dimensionless temperature at boundaries
  T_w = T_c
  T_e = T_c
  T_s = T_h
  T_n = T_c

  ! Define solution parameters
  itrmax = 1000
  maxit = 10
  solver_tol = 1e-9
  simpler_tol = 1e-6

  ! Calculate geometry properties.
  call geometry2d

  ! Calculate pressure source terms and initialize grid
  call pressure2d

  ! Calculate velocity source terms and initialize grid
  call velocity2d

  ! Calculate temperature source terms and initialize grid
  call temperature2d

  return

end subroutine initialize2d
