#!/bin/sh -e

##########################################################################
#   Function description:
#       Walk user through port quality checks
#       
#   History:
#   Date        Name        Modification
#   2018-11-19  Charlie &   Begin
##########################################################################

step()
{
    pause
    clear
    # printf "==============================================================\n"
}


##########################################################################
#   Function description:
#       Pause until user presses return
##########################################################################

pause()
{
    local junk
    
    printf "Press return to continue..."
    read junk
}

clear
if ! fgrep -q DEVELOPER=yes /etc/make.conf; then
    printf "Consider adding DEVELOPER=yes to /etc/make.conf.\n"
    step
fi

cat << EOM

If maintaining the source, clean up and reroll distfile

EOM
step
cat << EOM

Open the Makefile in an editor in another window.

EOM

step
cat << EOM

PORTNAME should match the upstream dist, including case
    unless this means changing it, which would break pkg upgrade
    pkg is case-insensitive (in some cases)
    Ports that install only one binary can use the binary name

EOM

step
cat << EOM

Replace PORTVERSION with DISTVERSION wherever possible
    * Only when changing version, otherwise breaks svn annotate / git blame
    DISTVERSION must match upstream version
    PORTVERSION is derived from DISTVERSION
    Use PORTVERSION directly if DISTVERSION is incompatible with
	FreeBSD version rules
    See porter's handbook "Configuring the Makefile" for details

EOM

step
cat << EOM

Bump PORT_REVISION if not changing VERSION
    Otherwise, remove PORT_REVISION

EOM

step
cat << EOM

Add PORT_EPOCH if downgrading

EOM

step
cat << EOM

Check categories
    Add java, perl5, python, etc. for ports that use them

EOM

step
cat << EOM

Use = instead of += wherever possible
    Use += only for vars commonly set in make.conf, like CFLAGS.

EOM

step
cat << EOM

If updating a port
    portsnap fetch update
    Merge latest changes in committed port into development port

EOM

step
cat << EOM

PKGNAMEPREFIX
    p5-, \${PYTHON_PKGNAMEPREFIX}, etc.

EOM

step
cat << EOM

Check/correct MASTER_SITES
    Use https if possible to protect download stream from hackers
    USE_GITHUB, SF, DISTVERSIONPREFIX, etc. if possible
    DISTVERSIONPREFIX=v preferred over GH_TAGNAME=v\${DISTVERSION}
    No need to manually set WRKSRC if using USE_GITHUB
    Remove MASTER_SITE_SUBDIR if present (deprecated)

EOM

step
cat << EOM

GITHUB
    See USE_GITHUB in guide for versioning between releases, etc.

EOM

step
cat << EOM

Check use of each LOCALBASE and PREFIX
Remove references to wip category
Use \${PORTNAME}, \${DISTVERSION}, etc in body wherever possible

EOM

step
cat << EOM

MAINTAINER=     email

Check comment

EOM

step
cat << EOM

Add LICENSE (after COMMENT)
    Add LICENSE_FILE if included in dist

EOM

step
cat << EOM

Add NO_ARCH=yes if the port is architecture free
    e.g. Only installs scripts or Java byte code

EOM

step
cat << EOM

Replace pre and post with <bsd.port.mk> if possible

EOM

step
cat << EOM

Check versions of all depends
    Be as generic as possible

EOM

step
cat << EOM

Check order of blocks:
    https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/porting-order.html

EOM

step
cat << EOM

Use USES or USE_* variables wherever possible
    USES before USE_*
	USES=localbase = CFLAGS+=-I\${LOCALBASE}/include, etc.
	See /usr/ports/Mk/Uses
    USE_TEX instead of tex-* depends
    pathfix for pkgconfig lib/libdata
    USE_XORG= instead of LIB_DEPENDS where possible

EOM

step
cat << EOM

Python
    https://wiki.freebsd.org/Python/PortsPolicy
    Use autoplist unless there's a good reason not to
    If including a plist, USE_PYTHON+=py3kplist
	%%PYTHON_PYOEXTENSION%%->pyo? (antoine)
    USE_PYTHON=concurrent if multiple flavors install the same files
    Ports that depend on a python module should use USES=python:env or :run
    \${PYNUMPY} for numpy dep.  Check python.mk for other goodies
    Deps should end in @\${PY_FLAVOR}
    Check dep version requirements in setup.py
    Koobs: Python packages that provide end-user, console scripts, or
	other files in common/shared locations should tested to be, or
	made to be USE_PYTHON=concurrent safe
    Match port atrributes to setup.py as closely as possible
	COMMENT to setup.py description
    Add TEST_DEPENDS and do-test target if appropriate
	py-nose or py-pytest

EOM

step
cat << EOM

BROKEN_\${OPSYS}_\${REL}_\${ARCH}

EOM

step
cat << EOM

OPTIONS
    options.mk only needed when using the PORT_OPTIONS variable
    All non-options macros before bsd.options.mk
    Add DOCS and EXAMPLES to OPTIONS_DEFINE if needed
	If installing to PORTDOCS or PORTEXAMPLES:
	    OPTIONS_DEFINE= DOCS EXAMPLES
	    PORTDOCS= *
    Remove PORT_OPTIONS:MDOCS checks (automatic with staging)
    Check OPTIONS_DEFINE for standards like MYSQL, etc.

EOM

step
cat << EOM

If installing config files (usually .conf):
    suffix with .sample
	may need to hack install
    plist entry: @sample path/file.conf.sample
    This will automatically install/deinstall .conf file if not different
    from sample

EOM

step
cat << EOM

Remove MAKE_JOBS_UNSAFE if possible
    Verify on build host with many cores.  May work on 4 but not 16.

EOM

step
cat << EOM

WRKSRC_SUBDIR instead of WRKSRC if possible

EOM

step
cat << EOM

Check need for USES vars like pkgconfig, localbase, gettext,
    desktop-file-utils (installs a .desktop file)
    DEVELOPER=yes will help with this during stage-qa

EOM

step
cat << EOM

CMAKE_ARGS format VAR:BOOL=ON, not VAR=1
    CMAKE_ON and CMAKE_OFF where possible

EOM

step
cat << EOM

Use CFLAGS_i386, CFLAGS_amd64, etc.

EOM

step
cat << EOM

Use COPYTREE_* instead of \${CP} -r
    Combine dirs going to the same destination:
	cd \${WRKSRC} && COPYTREE_SHARE "A B C" \${STAGEDIR}...

EOM

step
cat << EOM

Use @ to silence most commands, except commands that contribute to plist

EOM

step
cat << EOM

Carefully check REINPLACE_CMDS and patches
    Patching should be done at the earliest possible stage, e.g. don't
    patch in post-stage if the same effect can be achieved in post-patch

EOM

step
cat << EOM

Prefer \$() preferred over \`\` unless \`\` is more readable

EOM
exit


Testing
-------
    Check all installed scripts for proper shebang line
	(DEVELOPER=yes in /etc/make.conf will enable QA tests to detect this)
	USES=shebangfix
	SHEBANG_FILES=path ...


pkg-plist
---------
    pkgconfig files should be in libdata/pkgconfig
	configure may support --with-pkgconfigdir= even if not advertised
    Use EXAMPLESDIR, DOCSDIR, DATADIR where possible
    Executables called by bin/* but not meant for users go in prefix/libexec
    Optional scripts for users go in DATADIR or EXAMPLESDIR at your discretion
    Perl modules (*.pm) \${PREFIX}/\${SITE_PERL_REL}
    Java .jar files in \${JAVAJARDIR}


pkg-descr
---------
    Find a good description more than once sentence long
    spell-check
    space, not tab after WWW
    fmt -w 79

Remove any extraneous files from port framework and add a post-extract \${RM}
for any preexisting .orig files that cause makepatch to generate an extraneous
patch

Test on all available platforms.  Do the following IN ORDER:

    Add DEVELOPER=yes to /etc/make.conf to enable QA tests

    wip-reinstall-port -u -r ports-mgmt/port-dev
    port-check

    test with NOPORT* (whatever is in pkg-plist)

    If USES=ssl, test with each of the following in /etc/make.conf:
	DEFAULT_VERSIONS+= ssl=libressl
	DEFAULT_VERSIONS+= ssl=openssl
	DEFAULT_VERSIONS+= base

	See /usr/ports/Mk/bsd.default-versions.mk

Test with poudriere to ensure all depends are installed by the port
    If you've installed Poudriere with port-poudriere-setup:
	wip-poudriere-test category/portname all
    Python flavors are not tested by default:
	Also run testport cat/port@py36 or use poudriere bulk -t

Generate unified diff for updates, shar file for new ports
    (port-diff or port-shar scripts from ports-mgmt/port-dev)

Carefully inspect diff or shar

Follow porter's handbook to submit new port or update.
    https://www.freebsd.org/doc/en/books/porters-handbook/
    https://www.freebsd.org/support/bugreports.html

    Subject line:
    
    [NEW PORT] category/port: COMMENT field
    [MAINTAINER UPDATE] category/port: ?
    [CHANGE REQUEST] category/port: ?
    
    Text:
    
    Description
    
    Justification for PR
    
    portlint: OK (summary output)
    testport: OK (poudriere: {9.3, 10.3, 11.0}, {i386, amd64}, options tested)
    unittest: OK (test suite summary output)

Update /usr/wip/upstream


After commit
------------
Remove poudriere logs if present

If maintaining source

    tag this version of source and create next one

    update wip ports if present

else
    1)  Send patches through proper channels.
    
    2)  Contact author(s):

    People often assume the only supported platforms are those listed on
    the software's home page and that they should follow the (usually
    inadequate) instructions on the developer's site to install the software.
    A simple note about using a package manager and a link to the ports site
    can do a lot to raise awareness of the advantages of FreeBSD ports and
    other package managers.

    Send the following message AFTER THE PORT IS COMMITTED and then
    update FreeBSD-citing.
	
============================================================================

FYI:

[Software name] has been committed to the FreeBSD ports collection.
It might be helpful to users if you could post a message like
the following on your website:

Regards,

    [Your name]

[Software name] can be installed on FreeBSD via the FreeBSD ports system.

To install via the binary package, simply run:

    pkg install [put package name here]

This will very quickly install a binary using only highly-portable
optimizations, much like apt-get, yum, etc.

FreeBSD ports can just as easily be built and installed from source,
although this will take more time:

    cd /usr/ports/category/[put port name here] && make install

Building from source allows installing to a different prefix, compiling with
additional options (e.g. -march=native), and in some cases, building with
non-default options such as different compilers or dependencies.

We, the developers, do not directly support installation via FreeBSD ports.
To report any issues, please submit a PR at:

    https://bugs.freebsd.org/bugzilla/query.cgi?format=advanced.

For more information, visit https://www.freebsd.org/ports/index.html.

============================================================================

Switch dependencies in other wip ports from /usr/wip to \${PORTSDIR}