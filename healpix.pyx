# distutils: sources = healpix_bare/healpix_bare.c
# distutils: include_dirs = healpix_bare/

cimport chealpix

"""
=============================
Continuous coordinate systems
=============================

Admissible values for theta (definition see below)
0 <= theta <= pi

Admissible values for phi (definition see below)
In principle unconstrained, but best accuracy is obtained for
-2*pi <= phi <= 2*pi
"""

def ang(theta, phi):
    """
    A structure describing a location on the sphere. \a Theta is the co-latitude
    in radians (0 at the North Pole, increasing to pi at the South Pole.
    \a Phi is the azimuth in radians.
    """
    return chealpix.t_ang(theta, phi)

`
def vec(x, y, z):
    """
    A structure describing a 3-vector with coordinates \a x, \a y and \a z.
    """
    return chealpix.t_vec(x, y, z)


cdef chealpix.t_vec _ang2vec(chealpix.t_ang ang):
    return chealpix.ang2vec(ang)

def ang2vec(ang):
    """
    Returns a normalized 3-vector pointing in the same direction as \a ang.
    """
    return _ang2vec(ang)


cdef chealpix.t_ang _vec2ang(chealpix.t_vec vec):
    return chealpix.vec2ang(vec)

def vec2ang(vec):
    """
    Returns a t_ang describing the same direction as the 3-vector \a vec.
    \a vec need not be normalized.
    """
    return _vec2ang(vec)


"""
===========================
Discrete coordinate systems
===========================

Admissible values for nside parameters:
any integer power of 2 with 1 <= nside <= 1<<29

Admissible values for pixel indices:
0 <= idx < 12*nside*nside
"""


cdef int _nest2ring(int nside, int ipnest):
    return chealpix.nest2ring(nside, ipnest)

def nest2ring(nside, ipnest):
    """
    Returns the RING pixel index of pixel \a ipnest at resolution \a nside.
    On error, returns -1.
    """
    return _nest2ring(nside, ipnest)


cdef int _ring2nest(int nside, int ipring):
    return chealpix.ring2nest(nside, ipring)

def ring2nest(nside, ipring):
    """
    Returns the NEST pixel index of pixel \a ipring at resolution \a nside.
    On error, returns -1.
    """
    return _ring2nest(nside, ipring)


"""
==============================================================
Conversions between continuous and discrete coordinate systems
==============================================================
"""


cdef int _ang2nest(int nside, chealpix.t_ang ang):
    return chealpix.ang2nest(nside, ang)

def ang2nest(nside, ang):
    """
    Returns the pixel number in NEST scheme at resolution \a nside,
    which contains the position \a ang.
    """
    return _ang2nest(nside, ang)


cdef int _ang2ring(int nside, chealpix.t_ang ang):
    return chealpix.ang2ring(nside, ang)

def ang2ring(nside, ang):
    """
    Returns the pixel number in RING scheme at resolution \a nside,
    which contains the position \a ang.
    """
    return _ang2ring(nside, ang)


cdef chealpix.t_ang _nest2ang(int nside, int ipix):
    return chealpix.nest2ang(nside, ipix)

def nest2ang(nside, ipix):
    """
    Returns a t_ang corresponding to the angular position of the center of
    pixel \a ipix in NEST scheme at resolution \a nside.
    """
    return _nest2ang(nside, ipix)


cdef chealpix.t_ang _ring2ang(int nside, int ipix):
    return chealpix.ring2ang(nside, ipix)

def ring2ang(nside, ipix):
    """
    Returns a t_ang corresponding to the angular position of the center of
    pixel \a ipix in RING scheme at resolution \a nside.
    """
    return _ring2ang(nside, ipix)


cdef int _vec2nest(int nside, chealpix.t_vec vec):
    return chealpix.vec2nest(nside, vec)

def vec2nest(nside, vec):
    """
    Returns the pixel number in NEST scheme at resolution \a nside,
    which contains the direction described the 3-vector \a vec.
    """
    return _vec2nest(nside, vec)


cdef int _vec2ring(int nside, chealpix.t_vec vec):
    return chealpix.vec2ring(nside, vec)

def vec2ring(nside, vec):
    """
    Returns the pixel number in RING scheme at resolution \a nside,
    which contains the direction described the 3-vector \a vec.
    """
    return _vec2ring(nside, vec)


cdef chealpix.t_vec _nest2vec(int nside, int ipix):
    return chealpix.nest2vec(nside, ipix)

def nest2vec(nside, ipix):
    """
    Returns a normalized 3-vector pointing in the direction of the center
    of pixel \a ipix in NEST scheme at resolution \a nside.
    """
    return _nest2vec(nside, ipix)


cdef chealpix.t_vec _ring2vec(int nside, int ipix):
    return chealpix.ring2vec(nside, ipix)

def ring2vec(nside, ipix):
    """
    Returns a normalized 3-vector pointing in the direction of the center
    of pixel \a ipix in RING scheme at resolution \a nside.
    """
    return _ring2vec(nside, ipix)


cdef int _nside2npix(int nside):
    return chealpix.nside2npix(nside)

def nside2npix(nside):
    """
    Returns \a 12*nside*nside.
    """
    return _nside2npix(nside)


"""
==============================
Miscellaneous utility routines
==============================
"""


cdef int _npix2nside(int npix):
    return chealpix.npix2nside(npix)

def npix2nside(npix):
    """
    Returns \a sqrt(npix/12) if this is an integer number, otherwise \a -1.
    """
    return _npix2nside(npix)


cdef double _vec_angle(chealpix.t_vec v1, chealpix.t_vec v2):
    return chealpix.vec_angle(v1, v2)

def vec_angle(v1, v2):
    """
    Returns the angle (in radians) between the vectors \a v1 and \a v2.
    The result is accurate even for angles close to 0 and pi.
    """
    return _vec_angle(v1, v2)
