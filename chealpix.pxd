cdef extern from "healpix_bare/healpix_bare.h":
    ctypedef struct t_ang:
        double theta
        double phi
    ctypedef struct t_vec:
        double x
        double y
        double z

    t_vec ang2vec(t_ang ang)
    t_ang vec2ang(t_vec vec)

    int nest2ring(int nside, int ipnest)
    int ring2nest(int nside, int ipring)

    int ang2nest(int nside, t_ang ang)
    int ang2ring(int nside, t_ang ang)

    t_ang nest2ang(int nside, int ipix)
    t_ang ring2ang(int nside, int ipix)

    int vec2nest(int nside, t_vec vec)
    int vec2ring(int nside, t_vec vec)

    t_vec nest2vec(int nside, int ipix)
    t_vec ring2vec(int nside, int ipix)

    int nside2npix(int nside)
    int npix2nside(int npix)

    double vec_angle(t_vec v1, t_vec v2)
