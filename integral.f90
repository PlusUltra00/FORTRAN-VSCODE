program main
    implicit none
    INTEGER n
    double precision, PARAMETER:: a = -1.0d0
    double precision, PARAMETER:: b = 1.0d0
    double precision s_daikei
    n = 10

    call daikei(n, a, b, s_daikei)

    WRITE(*, *) s_daikei

end program main

subroutine daikei(n, a, b, s_daikei)
    implicit none
    INTEGER, intent(in) :: n
    double precision, intent(in) :: a, b
    double precision, INTENT(OUT):: s_daikei
    double precision h
    double precision f
    INTEGER i
    double precision f1, f2

    h = (b - a) / DBLE(n)
    s_daikei = 0.0d0

    do i = 0, n - 1
        f1 = f(a + i * h)
        f2 = f(a + (i + 1.0d0) * h)
        s_daikei = s_daikei + (f1 + f2) * h / 2.0d0
    enddo
end subroutine daikei

function f(xin)
    implicit none
    double precision, INTENT(IN):: xin
    double precision f

    f = 2 / (1 + xin ** 2)
end function f