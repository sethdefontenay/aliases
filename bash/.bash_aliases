alias clip='xclip -selection c'

aliens() {
	echo "Yuuuup yup yup yup yup yup yup"
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

revoke_aws() {
       unset AWS_SESSION_TOKEN
       unset AWS_SECRET_ACCESS_KEY
       unset AWS_ACCESS_KEY_ID
       unset AWS_SECURITY_TOKEN
}

alias nr_up="NR_LICENSE_KEY='cc841a139a759c77a0b845c39122badc81969b1e' docker-compose up -d"

common() {
	cd ~/Development/xero_sre_common/
	act
	inv build
	inv docker.build-common
	deactivate
	cd ~/Development/platform/
	act
	pip3 install ../xero_sre_common
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

act() {
	source venv/bin/activate
}

space() {
	sudo du -chsx * | sort -h
}

purge() {
	docker stop $(docker container ls -a -q) && docker system prune -a -f --volumes
}

azlogin() {
	az login -u seth@con-x.com -p 9fSpuU9JuI8aTE1uVimy
}
ssh_load
alias refresh="source ~/.bash_profile"