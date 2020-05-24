Name:       @@@CMDNAME@@@
Summary:    @@@SUMMARY@@@
Version:    @@@VERSION@@@
Group:      Applications
License:    MIT
Release:    %(date '+%'s)
BuildArch:  @@@ARCH@@@
URL:        @@@URL@@@
Source:     template.tar.gz
Vendor:     @@@AUTHOR@@@ <@@@EMAIL@@@>
Provides:   @@@CMDNAME@@@

BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

%description
@@@DESCRIPTION@@@

%prep
%setup

%install
#@bin@install -d -m 0755 %{buildroot}%{_bindir}
#@man@install -d -m 0755 %{buildroot}%{_mandir}/man1
#@lib@install -d -m 0755 %{buildroot}%{_libdir}
#@bin@%{__cp} -a bin/* %{buildroot}%{_bindir}/
#@man@%{__cp} -a man/*.1 %{buildroot}%{_mandir}/man1/
#@lib@%{__cp} -a lib/* %{buildroot}%{_libdir}/

%files
#@man@%attr(0644, root, root) %{_mandir}/man1/*
#@bin@%attr(0755, root, root) %{_bindir}/*
#@lib@%attr(-, root, root) %{_libdir}/*

%clean
%{__rm} -rf %{buildroot}
