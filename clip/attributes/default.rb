# currently only supports redhat, other distros to be added and refactored in.

set_unless[:clip][:platform] = :redhat

node[:clip][:redhat][:install][:packages] = %w[
	 auditlibs-devel
	 autoconf
	 automake
	 bison
	 byacc
	 docbook-style-xsl
	 flex
	 gcc
	 libcap-devel
	 libtool
	 linuxdoc-tools
	 pam-devel
	 python-devel
	 rpm-build
	 subversion
	 swig
	 w3m
]