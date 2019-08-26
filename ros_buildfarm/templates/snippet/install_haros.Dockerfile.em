@[if os_name == 'debian' or os_name == 'ubuntu' and os_code_name not in ['trusty', 'utopic'] and testing]@
@# Install haros with its dependencies

RUN python3 -u /tmp/wrapper_scripts/apt.py update-install-clean -q -y git cppcheck cccc libclang-3.8-dev python-pip pylint

RUN pip install --upgrade pip

RUN pip install -U haros

# pyflwor has to be cloned in edit mode
USER buildfarm

RUN pip install --user -U git+https://github.com/timtadh/pyflwor.git#egg=pyflwor

USER root
@[end if]@

