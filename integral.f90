program main
    implicit none
    INTEGER n
    DOUBLE PRECISION, PARAMETER:: a = -1.0d0
    DOUBLE PRECISION, PARAMETER:: b = 1.0d0
    DOUBLE PRECISION s_daikei
    n = 10

    call daikei(n, a, b, s_daikei)

    WRITE(*, *) s_daikei

end program main

subroutine daikei(n, a, b, s_daikei)
    implicit none
    INTEGER, intent(in) :: n
    DOUBLE PRECISION, intent(in) :: a, b
    DOUBLE PRECISION, INTENT(OUT):: s_daikei
    DOUBLE PRECISION h
    DOUBLE PRECISION f
    INTEGER i
    DOUBLE PRECISION f1, f2

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
    DOUBLE PRECISION, INTENT(IN):: xin
    DOUBLE PRECISION f

    f = 2 / (1 + xin ** 2)
end function f