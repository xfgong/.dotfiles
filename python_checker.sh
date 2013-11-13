flake8 --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Warning: flake8 not install."
    echo "         Try pip install flake8"
fi

function check() {
    exit=0
    for file in `git diff --cached --name-only --diff-filter=ACMRTUXB HEAD|grep '\.py$'`; do
        flake8 --ignore=W291,W391,W402,W404,W601,E123,E124,E125,E126,E127,E128,E226,E261,E262,E501,E502,E711,E712 $file
        if [ $? -ne 0 ]; then
            let exit=1
        fi
    done

    if [ "$0" != "check" ];then
        exit $exit
    fi
}

function check_dir () 
{
    if [[ "$#" -lt 1 ]]; then
        echo "Check Python Script Syntax Before Submitting to the Repo!!!";
        echo "Usage: $FUNCNAME <project_path_or_python_filename>";
        return;
    else
        flake8 --ignore=W291,W391,W402,W404,W601,E123,E124,E125,E126,E127,E128,E226,E261,E262,E501,E502,E711,E712 "$1"
    fi
}

function hook() {
    root=`git rev-parse --show-toplevel`
    if [ -d $root ]; then
        hooksdir=$root/.git/hooks
        if [ -d $hooksdir ]; then
            precommit=$hooksdir/pre-commit
            echo "#!/bin/bash\nsource ~/.dotfiles/python_checker.sh\ncheck" > $precommit
            chmod +x $precommit
            echo "install python check hook successful!"
        fi
    fi
}
