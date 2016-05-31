# source setup.sh

# Colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}>>> Creating virtualenv${reset}"
# with Python 3
python -m venv .venv
source .venv/bin/activate

cd highcharts

echo "${green}>>> Installing the Django${reset}"
pip install -r requirements.txt
python manage.py makemigrations core
python manage.py migrate
python manage.py shell < highcharts/shell/shell_dollar.py
python manage.py shell < highcharts/shell/shell_euro.py
python manage.py runserver
echo "${green}>>> Done${reset}"
