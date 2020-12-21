alias clip='xclip -selection c'

aliens() {
	echo "Yuuuup yup yup yup yup yup yup"
}

act(){
	source venv/bin/activate
}

install_venv(){
/home/vagrant/.local/bin/virtualenv -p /usr/bin/python3.8 venv --always-copy
}

location() {
	echo "The file to edit is /u/.bash_aliases"
}

ssh_load(){
eval "$(ssh-agent -s)"
ssh-add /c/Users/Seth/.ssh/id_rsa
}

assume() {
     eval $(echo $2 | ~/go/bin/assume-role $1)
}
d_stop(){
	docker stop $(docker ps -aq)
}

d_rebuild() {
	d_stop
	docker build -t $1 .
	docker run --shm-size 1g -p 8000:8000 $1
}
d_login() {
	docker login conxdevcontainerregistry.azurecr.io -u conxDevContainerRegistry -p $1
}
d_upload() {
	docker build -t conxdevcontainerregistry.azurecr.io/$1 .
	docker push conxdevcontainerregistry.azurecr.io/$1
}
d_loginp() {
	docker login inttester.azurecr.io -u inttester -p $1
}
d_uploadp() {
	docker build -t inttester.azurecr.io/$1 .
	docker push inttester.azurecr.io/$1
}

revoke_aws() { 
       unset AWS_SESSION_TOKEN
       unset AWS_SECRET_ACCESS_KEY
       unset AWS_ACCESS_KEY_ID
       unset AWS_SECURITY_TOKEN
}

amend() {
	git add .
	git commit --amend --no-edit
}

git_cr() {
	git stash
	git checkout -b temp
	git branch -D $1
	git checkout -b $1 origin/$1
	git branch -D temp
}

git_update() {
	git fetch --all
	git pull origin $1
}

space() {
	sudo du -chsx * | sort -h
}

purge() {
	docker stop $(docker container ls -a -q) && docker system prune -a -f --volumes
}

azlogin() {
	az login -u seth@con-x.com -p
}
#Virtualenvwrapper settings:
export WORKON_HOME=$HOME/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
. /usr/local/bin/virtualenvwrapper.sh
PATH="$PATH:/home/vagrant/.local/bin"
alias refresh="source ~/.bash_profile"
