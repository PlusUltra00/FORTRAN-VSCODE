program main
    implicit none
    integer n
    double precision, parameter:: a = -1.0d0
    double precision, parameter:: b = 1.0d0
    double precision s_daikei

    n = 10

    call daikei(n, a, b, s_daikei)

    write(*, *) s_daikei
end program main

subroutine daikei(n, a, b, s_daikei)
    implicit none
    integer, intent(in) :: n
    double precision, intent(in) :: a, b
    double precision, intent(out):: s_daikei
    double precision h, f, f1, f2
    integer i

    h = (b - a) / dble(n)
    s_daikei = 0
    do i = 0, n - 1
        f1 = f(a + i * h)
        f2 = f(a + (i + 1.0d0) * h)
        s_daikei = s_daikei + (f1 + f2) * h / 2.0d0
    enddo
end subroutine daikei

function f(xin)
    implicit none
    double precision, intent(in) :: xin
    double precision f
    f = 2 / (1 + xin ** 2)
end function f