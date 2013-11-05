qa () 
{
    if [[ "$#" -lt 1 ]]; then
        echo "Check Python Script Syntax Before Submitting to the Repo!!!";
        echo "Usage: $FUNCNAME <project_path_or_python_filename>";
        return;
    else
        flake8 "$1" | pcregrep -v "E501|E272|E221|E225|E303|W601|E302|E502|W291|E261|E262|W391|E127|E128|E126|E123|E125|E124|E711|E712";
    fi
}

flake8 --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Warning: flake8 not install."
    echo "         Try pip install flake8"
fi
