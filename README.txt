Note that this is just a proof of concept for now.

Instructions:
-------------

mkvirtualenv --no-site-packages numpy-mkl
pip install -I ipython nose
make install
make test


In ipython (it should be using all the cores, and be *really* fast):

import numpy as np
a = np.empty((4096, 4096), dtype=np.float32)
timeit np.dot(a, a)


Compatibility:
--------------

Tested on Gentoo with:
* icc-12.1.9.293 USE=mkl from 'sekyfsr' overlay (see https://github.com/npinto/sekyfsr-gentoo-overlay/blob/master/dev-lang/icc/icc-12.1.9.293.ebuild)

