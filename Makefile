default: install

numpy-1.6.1.tar.gz:
	wget http://pypi.python.org/packages/source/n/numpy/numpy-1.6.1.tar.gz

numpy-1.6.1: numpy-1.6.1.tar.gz
	tar xzf $?

system_info_patch-r2.diff:
	wget https://raw.github.com/gist/1983883/d005a16acb48f9ecc7d807e7746142ce3d3e7430/system_info_patch-r2.diff

install: numpy-1.6.1 system_info_patch-r2.diff
	# -- patch
	patch numpy-1.6.1/numpy/distutils/system_info.py < system_info_patch-r2.diff
	# -- configure
	cp -vf site.cfg $<
	# -- build
	cd $? && python setup.py build
	# -- install
	cd $? && python setup.py install

test:
	python -c 'import numpy as np; np.test()'

clean:
	rm -rf numpy-1.6.1
