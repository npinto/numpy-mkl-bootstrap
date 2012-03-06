Note that this is just a proof of concept for now.


Compatibility:
--------------

Tested on Gentoo with icc-12.1.9.293 USE=mkl from 'sekyfsr' overlay
(see http://goo.gl/YXOVM), e.g.:

layman -a sekyfsr
layman -S && eix-update && eix-sync -q
ACCEPT_KEYWORDS='**' USE=mkl emerge dev-lang/icc
# XXX: more with echo here ?


Instructions:
-------------

# create virtualenv
mkvirtualenv --no-site-packages numpy-mkl
pip install -I ipython nose

# install numpy
make install

# test with appropriate path
export LD_LIBRARY_PATH=/opt/intel/composerxe-2011.9.293/mkl/lib/intel64:${LD_LIBRARY_PATH}
make test


# In ipython (it should be using all the cores, and be *really* fast):

import numpy as np
a = np.empty((4096, 4096), dtype=np.float32)
timeit np.dot(a, a)


Misc:
-----

Part of what makes this work comes from a patch, here is the pull request upstream:
https://github.com/numpy/numpy/pull/229
(see also http://projects.scipy.org/numpy/ticket/993)
