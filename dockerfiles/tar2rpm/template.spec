Name:       @@@CMDNAME@@@
Summary:    @@@SUMMARY@@@
Version:    @@@VERSION@@@
Group:      Applications
License:    MIT
Release:    %(date '+%'s)
BuildArch:  %(uname -m)
URL:        @@@URL@@@
Source:     template.tar.gz
Vendor:     @@@AUTHOR@@@ <@@@EMAIL@@@>
Provides:   @@@CMDNAME@@@

BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

%description
@@@DESCRIOPTION@@@

%prep
%setup

%install
install -d -m 0755 %{buildroot}%{_bindir} %{buildroot}%{_mandir}/man1
%{__cp} -a man/*.1 %{buildroot}%{_mandir}/man1/
%{__cp} -a bin/* %{buildroot}%{_bindir}/

%files
%attr(0644, root, root) %{_mandir}/man1/*
%attr(0755, root, root) %{_bindir}/*

%clean
%{__rm} -rf %{buildroot}
