# $FreeBSD: head/biology/py-dnaio/Makefile 496770 2019-03-24 19:40:26Z jwb $

PORTNAME=	dnaio
DISTVERSION=	0.4.1
CATEGORIES=	wip biology python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Read and write FASTQ and FASTA

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>0:devel/py-setuptools_scm@${PY_FLAVOR}

USES=		python:3.4+
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
