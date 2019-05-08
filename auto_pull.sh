#!/bin/sh
cd "${0%/*}"

git fetch
LOCAL=$(git rev-parse HEAD)
UPSTREAM=$(git rev-parse @{u})
if [ $LOCAL = $UPSTREAM ]; then
	echo same
	echo $LOCAL
	echo $UPSTREAM
    	cd ./python/
else
	echo changed
	echo $LOCAL
	echo $UPSTREAM
	git pull
	cd ./python/
	/home/ubuntu/anaconda3/bin/python setup.py build_ext --inplace
fi

/home/ubuntu/anaconda3/bin/jupyter notebook --NotebookApp.token='' --NotebookApp.password='' --no-browser --port 8888
echo "done v2"

