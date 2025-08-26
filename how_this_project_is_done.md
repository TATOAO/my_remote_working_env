

# Build minial version of RedHat Docker in a machine that is online


One possible example
https://catalog.redhat.com/software/containers/ubi8/ubi-minimal/5c359a62bed8bd75a2c3fba8?container-tabs=gti&gti-tabs=red-hat-login

docker login registry.redhat.io
Username: {REGISTRY-SERVICE-ACCOUNT-USERNAME}
Password: {REGISTRY-SERVICE-ACCOUNT-PASSWORD}
Login Succeeded!

docker pull registry.redhat.io/ubi8/ubi-minimal:8.10-1018

docker pull redhat/ubi8-minimal


docker run -it --name my_working_env redhat/ubi8-minimal



# download basic


microdnf install yum
microdnf install vim


``` 
[root@2c83b3591388 dev_tools]# yum groupinfo "Development Tools"
Red Hat Universal Base Image 8 (RPMs) - BaseOS                     1.1 MB/s | 722 kB     00:00
Red Hat Universal Base Image 8 (RPMs) - AppStream                  3.6 MB/s | 3.2 MB     00:00
Red Hat Universal Base Image 8 (RPMs) - CodeReady Builder          344 kB/s | 185 kB     00:00
Warning: Group Development Tools does not exist.
```



mkdir -p ~/devtools_packages
cd ~/devtools_packages


yum install yum-utils
? yumdownloader --resolve @development
yum groupinstall --downloadonly --downloaddir=./ "Development Tools"
