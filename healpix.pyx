# distutils: sources = healpix_bare/healpix_bare.c
# distutils: include_dirs = healpix_bare/

cimport chealpix


def vec(x, y, z):
    return chealpix.t_vec(x, y, z)

def ang(theta, phi):
    return chealpix.t_ang(theta, phi)


cdef chealpix.t_vec _ang2vec(chealpix.t_ang ang):
    return chealpix.ang2vec(ang)

def ang2vec(ang):
    return _ang2vec(ang)


cdef chealpix.t_ang _vec2ang(chealpix.t_vec vec):
    return chealpix.vec2ang(vec)

def vec2ang(vec):
    return _vec2ang(vec)


cdef int _nest2ring(int nside, int ipnest):
    return chealpix.nest2ring(nside, ipnest)

def nest2ring(nside, ipnest):
    return _nest2ring(nside, ipnest)


cdef int _ring2nest(int nside, int ipring):
    return chealpix.ring2nest(nside, ipring)

def ring2nest(nside, ipring):
    return _ring2nest(nside, ipring)


cdef int _ang2nest(int nside, chealpix.t_ang ang):
    return chealpix.ang2nest(nside, ang)

def ang2nest(nside, ang):
    return _ang2nest(nside, ang)


cdef int _ang2ring(int nside, chealpix.t_ang ang):
    return chealpix.ang2ring(nside, ang)

def ang2ring(nside, ang):
    return _ang2ring(nside, ang)


cdef chealpix.t_ang _nest2ang(int nside, int ipix):
    return chealpix.nest2ang(nside, ipix)

def nest2ang(nside, ipix):
    return _nest2ang(nside, ipix)


cdef chealpix.t_ang _ring2ang(int nside, int ipix):
    return chealpix.ring2ang(nside, ipix)

def ring2ang(nside, ipix):
    return _ring2ang(nside, ipix)


cdef int _vec2nest(int nside, chealpix.t_vec vec):
    return chealpix.vec2nest(nside, vec)

def vec2nest(nside, vec):
    return _vec2nest(nside, vec)


cdef int _vec2ring(int nside, chealpix.t_vec vec):
    return chealpix.vec2ring(nside, vec)

def vec2ring(nside, vec):
    return _vec2ring(nside, vec)


cdef chealpix.t_vec _nest2vec(int nside, int ipix):
    return chealpix.nest2vec(nside, ipix)

def nest2vec(nside, ipix):
    return _nest2vec(nside, ipix)


cdef chealpix.t_vec _ring2vec(int nside, int ipix):
    return chealpix.ring2vec(nside, ipix)

def ring2vec(nside, ipix):
    return _ring2vec(nside, ipix)


cdef int _nside2npix(int nside):
    return chealpix.nside2npix(nside)

def nside2npix(nside):
    return _nside2npix(nside)


cdef int _npix2nside(int npix):
    return chealpix.npix2nside(npix)

def npix2nside(npix):
    return _npix2nside(npix)


cdef double _vec_angle(chealpix.t_vec v1, chealpix.t_vec v2):
    return chealpix.vec_angle(v1, v2)

def vec_angle(v1, v2):
    return _vec_angle(v1, v2)
