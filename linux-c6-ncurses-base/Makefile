# $FreeBSD: head/devel/linux-c6-ncurses-base/Makefile 392922 2015-07-26 13:35:29Z antoine $

# http://vault.centos.org/centos/6.9/os/x86_64/Packages/

PORTNAME=	${LINUX_NAME}-base
PORTVERSION=	5.7
CATEGORIES=	wip devel linux

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Terminfo database required by Linux ncurses programs

USES=		linux:c6
USE_LINUX_RPM=	yes
LINUX_NAME=	ncurses
DESCR=		${.CURDIR}/../../devel/${LINUX_NAME}/pkg-descr
RPMVERSION=	4.20090207.el6
SRC_DISTFILES=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}${SRC_SUFX}

.include <bsd.port.mk>
