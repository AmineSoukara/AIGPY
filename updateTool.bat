cd  %~dp0

REM remove old dir
rmdir /s/q dist
rmdir /s/q build
rmdir /s/q aigpy.egg-info

REM build
python setup.py sdist bdist_wheel

REM reinstall aigpy
pip uninstall -y aigpy
python setup.py install

REM upload to pip
twine upload dist/*

REM pip install --upgrade aigpy