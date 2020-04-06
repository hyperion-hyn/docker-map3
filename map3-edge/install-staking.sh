#!/bin/sh
set -e

get_distribution() {
	lsb_dist=""
	# Every system that we officially support has /etc/os-release
	if [ -r /etc/os-release ]; then
		lsb_dist="$(. /etc/os-release && echo "$ID")"
	fi
	# Returning an empty string here should be alright since the
	# case statements don't act unless you provide an actual value
	echo "$lsb_dist"
}

befor_install_docker() {
    user="$(id -un 2>/dev/null || true)"

	sh_c='sh -c'
	if [ "$user" != 'root' ]; then
		if command_exists sudo; then
			sh_c='sudo -E sh -c'
		elif command_exists su; then
			sh_c='su -c'
		else
			cat >&2 <<-'EOF'
			Error: this installer needs the ability to run commands as root.
			We are unable to find either "sudo" or "su" available to make this happen.
			EOF
			exit 1
		fi
	fi

	lsb_dist=$( get_distribution )
	lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"
	case "$lsb_dist" in

		centos)
            # add aliyun epel repo
            sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo_back
            sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
            sudo yum makecache -y
            sudo yum install -y epel-release
		;;

	esac
}

install_docker() {
	lsb_dist=$( get_distribution )
	lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"
	case "$lsb_dist" in

		redhat|rhel)
            # https://docs.docker.com/install/linux/docker-ce/centos/
            sudo yum remove -y docker \
                     docker-client \
                     docker-client-latest \
                     docker-common \
                     docker-latest \
                     docker-latest-logrotate \
                     docker-logrotate \
                     docker-engine


            sudo yum install -y yum-utils \
                device-mapper-persistent-data \
                lvm2

            sudo yum-config-manager \
                --add-repo \
                https://download.docker.com/linux/centos/docker-ce.repo

            sudo yum install -y containerd.io docker-ce-18.09.1 docker-ce-cli-18.09.1
		;;

        amzn)
            sudo yum update -y
            sudo amazon-linux-extras install docker
        ;;

        *)
            curl -fsSL https://get.docker.com | bash
        ;;

	esac
}

after_install_docker() {
    sudo usermod -aG docker `logname`
	
    lsb_dist=$( get_distribution )
	lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"
	case "$lsb_dist" in

        # start docker for centos/fedora/redhat
		centos|fedora|redhat|rhel)
            sudo systemctl enable docker.service
            sudo systemctl start docker
		;;

        amzn)
            sudo service docker start
        ;;

	esac

	case "$lsb_dist" in

        # install iptable_nat for redhat
		redhat|rhel)
            sudo modprobe iptable_nat
            # persistent
            cat > /etc/sysconfig/modules/dockerd.modules <<- ENDEND
#!/bin/sh

exec /sbin/modprobe iptable_nat >/dev/null 2>&1
ENDEND

            sudo chmod +x /etc/sysconfig/modules/dockerd.modules
		;;

	esac
}

install_docker_compose() {
    # install docker-compose
    curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
}

download_and_run_map3() {
    # get docker-compose.yml
    mkdir -p ~/docker-map3
    curl -L https://hyperion-deploy.s3-ap-southeast-1.amazonaws.com/edge-staking/docker-compose.yml -o ~/docker-map3/docker-compose.yml

    # get depends files
    curl -L https://hyperion-deploy.s3-ap-southeast-1.amazonaws.com/edge-staking/depends.tar.gz -o ~/docker-map3/depends.tar.gz
    tar zxvf ~/docker-map3/depends.tar.gz -C ~/docker-map3/

    # launch services
    /usr/local/bin/docker-compose -f ~/docker-map3/docker-compose.yml up -d
}

run_map3() {
    befor_install_docker
    install_docker
    after_install_docker

    install_docker_compose

    download_and_run_map3
}

run_map3
